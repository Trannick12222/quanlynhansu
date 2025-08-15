from flask import Blueprint, render_template, request, redirect, url_for, flash, session, jsonify
from utils.db import get_conn
from datetime import datetime
import pymysql
from config import DB_CONFIG

# ✅ Blueprint với tên rõ ràng
thoigianmoepa_bp = Blueprint('thoigianmoepa', __name__)

def is_allowed():
    """Kiểm tra quyền truy cập"""
    user = session.get('user', '').lower()
    role = session.get('role', '')
    return user in {'admin', 'kimnhung', 'ngocquy'} or role == 'admin'

# ✅ Route chính - CHỈ MỘT route duy nhất cho index
@thoigianmoepa_bp.route('/thoigianmoepa', strict_slashes=False)
def index():
    """Trang chính quản lý thời gian mở EPA - chấp nhận cả có và không có trailing slash"""
    if not session.get('user'):
        return redirect('/')
    
    if not is_allowed():
        return render_template('403.html'), 403

    conn = get_conn()
    try:
        with conn.cursor() as cursor:
            # Lấy danh sách tài khoản từ bảng tk
            cursor.execute("SELECT ten_tk FROM tk WHERE ten_tk IS NOT NULL AND ten_tk != '' ORDER BY ten_tk")
            tk_rows = cursor.fetchall()
            tk_list = [row['ten_tk'] for row in tk_rows]
            
            # Lấy records hiện có từ bảng thoigianmoepa
            cursor.execute("SELECT * FROM thoigianmoepa ORDER BY ten_tk")
            records_rows = cursor.fetchall()
            
            # Chuyển thành dict để dễ truy cập
            records = {}
            for record in records_rows:
                records[record['ten_tk']] = record
                
    except Exception as e:
        print(f"❌ Lỗi database trong index(): {e}")
        tk_list = []
        records = {}
    finally:
        conn.close()
    
    return render_template('thoigianmoepa.html', tk_list=tk_list, records=records)

# ✅ Route sync_records 
@thoigianmoepa_bp.route('/sync_records', methods=['POST'])
def sync_records():
    """Đồng bộ tài khoản từ bảng tk"""
    if not session.get('user'):
        return redirect('/')
    
    if not is_allowed():
        return render_template('403.html'), 403

    conn = get_conn()
    try:
        with conn.cursor() as cursor:
            # Lấy danh sách tài khoản từ bảng tk
            cursor.execute("SELECT ten_tk, nhom FROM tk WHERE ten_tk IS NOT NULL AND ten_tk != ''")
            tk_rows = cursor.fetchall()
            
            # Lấy tài khoản đã có trong thoigianmoepa
            cursor.execute("SELECT ten_tk FROM thoigianmoepa")
            existing_rows = cursor.fetchall()
            existing_tk = {row['ten_tk'] for row in existing_rows}
            
            # Lấy tài khoản có trong bảng giaovien (optional check)
            try:
                cursor.execute("SELECT ten_tk FROM giaovien WHERE ten_tk IS NOT NULL AND ten_tk != ''")
                giaovien_rows = cursor.fetchall()
                giaovien_tk = {row['ten_tk'] for row in giaovien_rows}
            except:
                # Nếu không có bảng giaovien, chấp nhận tất cả tk
                giaovien_tk = {row['ten_tk'] for row in tk_rows}
            
            count = 0
            for tk_row in tk_rows:
                ten_tk = tk_row['ten_tk']
                nhom = tk_row.get('nhom', 'user')
                
                # Chỉ thêm nếu: chưa có trong thoigianmoepa VÀ có trong giaovien
                if ten_tk not in existing_tk and ten_tk in giaovien_tk:
                    # Cài đặt quyền mặc định dựa theo nhóm
                    make_epa_gv = 'yes'
                    make_epa_tgv = 'yes' if nhom == 'supervisor' else 'no'
                    make_epa_all = 'yes' if nhom == 'admin' else 'no'
                    
                    cursor.execute("""
                        INSERT INTO thoigianmoepa (ten_tk, start_day, close_day, month, year, remark, make_epa_gv, make_epa_tgv, make_epa_all)
                        VALUES (%s, 20, 25, MONTH(CURDATE()), YEAR(CURDATE()), '', %s, %s, %s)
                    """, (ten_tk, make_epa_gv, make_epa_tgv, make_epa_all))
                    count += 1
                    
            conn.commit()
            flash(f"✅ Đã đồng bộ {count} tài khoản mới", "success")
            
    except Exception as e:
        print(f"❌ Lỗi đồng bộ: {e}")
        flash(f"❌ Lỗi đồng bộ: {str(e)}", "danger")
        conn.rollback()
    finally:
        conn.close()
    
    return redirect(url_for('thoigianmoepa.index'))

# ✅ Route save_record
@thoigianmoepa_bp.route('/save_record', methods=['POST'])
def save_record():
    """Lưu cài đặt thời gian EPA cho một tài khoản - HỖ TRỢ 3 GIAI ĐOẠN"""
    if not session.get('user'):
        return redirect('/')
    
    if not is_allowed():
        return render_template('403.html'), 403

    # Lấy dữ liệu từ form
    ten_tk = request.form.get('ten_tk')
    record_id = request.form.get('id')  # Có thể None nếu là record mới
    remark = request.form.get('remark', '').strip()
    make_epa_gv = request.form.get('make_epa_gv', 'no')
    make_epa_tgv = request.form.get('make_epa_tgv', 'no') 
    make_epa_all = request.form.get('make_epa_all', 'no')
    
    # Lấy dữ liệu 3 giai đoạn
    phase1_start = request.form.get('phase1_start', type=int)
    phase1_end = request.form.get('phase1_end', type=int)
    phase2_start = request.form.get('phase2_start', type=int)
    phase2_end = request.form.get('phase2_end', type=int)
    phase3_start = request.form.get('phase3_start', type=int)
    phase3_end = request.form.get('phase3_end', type=int)
    
    # Backward compatibility: nếu không có dữ liệu 3 giai đoạn, dùng start_day/close_day cũ
    if not phase1_start and request.form.get('start_day'):
        start_day = request.form.get('start_day', type=int)
        close_day = request.form.get('close_day', type=int)
        # Convert sang 3 giai đoạn mặc định
        phase1_start, phase1_end = 20, 25
        phase2_start, phase2_end = 26, 27
        phase3_start, phase3_end = 28, 30
    
    # Validation
    if not ten_tk:
        flash("❌ Thiếu tên tài khoản", "danger")
        return redirect(url_for('thoigianmoepa.index'))
    
    # Validate 3 phases
    phases = [
        ("Giai đoạn 1", phase1_start, phase1_end),
        ("Giai đoạn 2", phase2_start, phase2_end),
        ("Giai đoạn 3", phase3_start, phase3_end)
    ]
    
    for phase_name, start, end in phases:
        if not start or not end:
            flash(f"❌ {phase_name}: Vui lòng nhập ngày bắt đầu và kết thúc", "danger")
            return redirect(url_for('thoigianmoepa.index'))
        
        if start >= end:
            flash(f"❌ {phase_name}: Ngày bắt đầu phải nhỏ hơn ngày kết thúc", "danger")
            return redirect(url_for('thoigianmoepa.index'))
        
        if not (1 <= start <= 31) or not (1 <= end <= 31):
            flash(f"❌ {phase_name}: Ngày phải trong khoảng 1-31", "danger")
            return redirect(url_for('thoigianmoepa.index'))
    
    # Validate sequential order
    if phase1_end >= phase2_start:
        flash("❌ Giai đoạn 2 phải bắt đầu sau khi giai đoạn 1 kết thúc", "danger")
        return redirect(url_for('thoigianmoepa.index'))
        
    if phase2_end >= phase3_start:
        flash("❌ Giai đoạn 3 phải bắt đầu sau khi giai đoạn 2 kết thúc", "danger")
        return redirect(url_for('thoigianmoepa.index'))

    conn = get_conn()
    try:
        with conn.cursor() as cursor:
            # Kiểm tra tài khoản có tồn tại trong bảng tk không
            cursor.execute("SELECT 1 FROM tk WHERE ten_tk = %s", (ten_tk,))
            if not cursor.fetchone():
                flash(f"❌ Tài khoản {ten_tk} không tồn tại", "danger")
                return redirect(url_for('thoigianmoepa.index'))
            
            if record_id:
                # Cập nhật record hiện có
                cursor.execute("""
                    UPDATE thoigianmoepa 
                    SET phase1_start = %s, phase1_end = %s, 
                        phase2_start = %s, phase2_end = %s,
                        phase3_start = %s, phase3_end = %s,
                        remark = %s, make_epa_gv = %s, make_epa_tgv = %s, make_epa_all = %s,
                        start_day = %s, close_day = %s
                    WHERE id = %s AND ten_tk = %s
                """, (phase1_start, phase1_end, phase2_start, phase2_end, phase3_start, phase3_end,
                      remark, make_epa_gv, make_epa_tgv, make_epa_all, phase1_start, phase1_end, record_id, ten_tk))
            else:
                # Thêm mới hoặc cập nhật nếu đã tồn tại
                cursor.execute("""
                    INSERT INTO thoigianmoepa (ten_tk, phase1_start, phase1_end, phase2_start, phase2_end, 
                                             phase3_start, phase3_end, remark, make_epa_gv, make_epa_tgv, make_epa_all,
                                             start_day, close_day, month, year)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, MONTH(CURDATE()), YEAR(CURDATE()))
                    ON DUPLICATE KEY UPDATE
                        phase1_start = VALUES(phase1_start),
                        phase1_end = VALUES(phase1_end),
                        phase2_start = VALUES(phase2_start),
                        phase2_end = VALUES(phase2_end),
                        phase3_start = VALUES(phase3_start),
                        phase3_end = VALUES(phase3_end),
                        remark = VALUES(remark),
                        make_epa_gv = VALUES(make_epa_gv),
                        make_epa_tgv = VALUES(make_epa_tgv),
                        make_epa_all = VALUES(make_epa_all),
                        start_day = VALUES(start_day),
                        close_day = VALUES(close_day)
                """, (ten_tk, phase1_start, phase1_end, phase2_start, phase2_end, phase3_start, phase3_end,
                      remark, make_epa_gv, make_epa_tgv, make_epa_all, phase1_start, phase1_end))

            
            conn.commit()
            flash(f"✅ Đã lưu cài đặt 3 giai đoạn cho tài khoản {ten_tk}", "success")
            
    except Exception as e:
        print(f"❌ Lỗi lưu dữ liệu: {e}")
        flash(f"❌ Lỗi lưu dữ liệu: {str(e)}", "danger")
        conn.rollback()
    finally:
        conn.close()
    
    return redirect(url_for('thoigianmoepa.index'))

# ============================
# API ENDPOINTS
# ============================

@thoigianmoepa_bp.route('/api/assessment-period')
def get_assessment_period():
    """API kiểm tra thời gian đánh giá EPA cho user hiện tại - HỖ TRỢ 3 GIAI ĐOẠN"""
    if not session.get('user'):
        return jsonify({"error": "Not logged in"}), 401
    
    user = session.get('user')
    role = session.get('role', '')
    now = datetime.now()
    current_day = now.day
    current_month = now.month
    current_year = now.year
    
    conn = get_conn()
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                SELECT phase1_start, phase1_end, phase2_start, phase2_end, phase3_start, phase3_end,
                       make_epa_gv, make_epa_tgv, make_epa_all,
                       start_day, close_day
                FROM thoigianmoepa 
                WHERE ten_tk = %s
            """, (user,))
            
            record = cursor.fetchone()
            
            if not record:
                # Nếu không có cài đặt, dùng mặc định 3 giai đoạn
                phase1_start, phase1_end = 20, 25
                phase2_start, phase2_end = 26, 27
                phase3_start, phase3_end = 28, 30
                make_epa_gv = "yes"
                make_epa_tgv = "no"
                make_epa_all = "no"
            else:
                phase1_start = record['phase1_start'] or 20
                phase1_end = record['phase1_end'] or 25
                phase2_start = record['phase2_start'] or 26
                phase2_end = record['phase2_end'] or 27
                phase3_start = record['phase3_start'] or 28
                phase3_end = record['phase3_end'] or 30
                make_epa_gv = record['make_epa_gv']
                make_epa_tgv = record['make_epa_tgv']
                make_epa_all = record['make_epa_all']
            
            # Xác định giai đoạn hiện tại và quyền
            current_phase = None
            phase_name = ""
            can_assess = False
            is_open = False
            
            # Kiểm tra giai đoạn 1: Tự đánh giá
            if phase1_start <= current_day <= phase1_end:
                current_phase = 1
                phase_name = "Tự Đánh Giá"
                # Cho phép tất cả user (bao gồm supervisor) tự đánh giá trong giai đoạn 1
                if make_epa_all == "yes" or make_epa_gv == "yes" or role == "admin" or role == "supervisor":
                    can_assess = True
                    is_open = True
            
            # Kiểm tra giai đoạn 2: TGV chấm điểm tổ viên
            elif current_day > phase1_end and phase2_start <= current_day <= phase2_end:
                current_phase = 2
                phase_name = "TGV Chấm Tổ Viên"
                # Trong giai đoạn 2, chỉ cho phép TGV chấm điểm tổ viên, không tự đánh giá
                if make_epa_all == "yes" or role == "admin":
                    can_assess = True
                    is_open = True
            
            # Kiểm tra giai đoạn 3: HT/PHT chấm điểm (chỉ sau khi giai đoạn 2 kết thúc)  
            elif current_day > phase2_end and phase3_start <= current_day <= phase3_end:
                current_phase = 3
                phase_name = "HT/PHT Chấm Điểm"
                if user in ['admin', 'kimnhung', 'ngocquy'] or role == "admin":
                    can_assess = True
                    is_open = True
            
            # Xác định thời gian hiển thị dựa trên giai đoạn
            if current_phase == 1:
                display_start, display_end = phase1_start, phase1_end
            elif current_phase == 2:
                display_start, display_end = phase2_start, phase2_end
            elif current_phase == 3:
                display_start, display_end = phase3_start, phase3_end
            else:
                # Ngoài thời gian, hiển thị giai đoạn tiếp theo
                if current_day < phase1_start:
                    display_start, display_end = phase1_start, phase1_end
                    phase_name = "Chờ Giai Đoạn 1"
                elif current_day < phase2_start:
                    display_start, display_end = phase2_start, phase2_end
                    phase_name = "Chờ Giai Đoạn 2"
                elif current_day < phase3_start:
                    display_start, display_end = phase3_start, phase3_end
                    phase_name = "Chờ Giai Đoạn 3"
                else:
                    display_start, display_end = phase3_start, phase3_end
                    phase_name = "Đã Kết Thúc"
                
            # Debug logging
            print(f"🔍 DEBUG API Response for {user}:")
            print(f"  Current Day: {current_day}")
            print(f"  Current Phase: {current_phase}")
            print(f"  Phase Name: {phase_name}")
            print(f"  Is Open: {is_open}")
            print(f"  Can Assess: {can_assess}")
            print(f"  Role: {role}")
            print(f"  make_epa_gv: {make_epa_gv}")
            print(f"  make_epa_tgv: {make_epa_tgv}")
            print(f"  make_epa_all: {make_epa_all}")
            
            return jsonify({
                "year": current_year,
                "month": current_month,
                "current_day": current_day,
                "current_phase": current_phase,
                "phase_name": phase_name,
                "start_day": display_start,
                "close_day": display_end,
                "isOpen": is_open,
                "can_assess": can_assess,
                # Thông tin chi tiết 3 giai đoạn
                "phase1": {"start": phase1_start, "end": phase1_end, "name": "Tự Đánh Giá"},
                "phase2": {"start": phase2_start, "end": phase2_end, "name": "TGV Chấm Điểm"},
                "phase3": {"start": phase3_start, "end": phase3_end, "name": "HT/PHT Chấm Điểm"},
                # Quyền
                "make_epa_gv": make_epa_gv,
                "make_epa_tgv": make_epa_tgv,
                "make_epa_all": make_epa_all
            })
            
    except Exception as e:
        print(f"❌ Lỗi API assessment-period: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        conn.close()

@thoigianmoepa_bp.route("/api/epa-check-time")
def api_epa_check_time():
    """API để kiểm tra thời gian EPA cho supervisor"""
    user = session.get('user')
    role = session.get('role', '')
    
    if not user:
        return "Không có người dùng trong session", 401
    
    if role != 'supervisor':
        return "Chỉ supervisor mới có thể sử dụng API này", 403

    now = datetime.now()
    current_day = now.day

    conn = pymysql.connect(**DB_CONFIG)
    try:
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:
            # Kiểm tra quyền supervisor EPA và thời gian đánh giá
            cursor.execute("""
                SELECT make_epa_tgv, make_epa_all, phase2_start, phase2_end 
                FROM thoigianmoepa WHERE ten_tk = %s
            """, (user,))
            epa_record = cursor.fetchone()
            
            if not epa_record:
                return "Không tìm thấy cài đặt EPA cho user", 403
            
            # Kiểm tra quyền supervisor EPA
            if epa_record['make_epa_all'] != 'yes' and epa_record['make_epa_tgv'] != 'yes':
                return "Không có quyền đánh giá EPA tổ viên", 403
            
            # Admin và HT/PHT luôn được phép
            if user in ['admin', 'kimnhung', 'ngocquy']:
                return jsonify({"status": "ok", "message": "Admin/HT/PHT có quyền truy cập"}), 200
            
            # Kiểm tra thời gian Phase 2
            if epa_record['phase2_start'] and epa_record['phase2_end']:
                phase2_open = epa_record['phase2_start'] <= current_day <= epa_record['phase2_end']
                
                if not phase2_open:
                    return f"Chưa tới thời gian đánh giá EPA tổ viên (ngày {epa_record['phase2_start']}-{epa_record['phase2_end']} hàng tháng)", 403
            else:
                return "Chưa cấu hình thời gian đánh giá EPA tổ viên", 403
            
            return jsonify({"status": "ok", "message": "Trong thời gian đánh giá EPA tổ viên"}), 200
            
    finally:
        conn.close()