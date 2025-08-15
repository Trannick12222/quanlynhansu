#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script Python để sửa vấn đề sup_score ghi đè user_score
Chạy script này để khôi phục dữ liệu đã bị ghi đè
"""

import pymysql
import sys
from datetime import datetime

# Cấu hình database - THAY ĐỔI THEO MÔI TRƯỜNG CỦA BẠN
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',  # Thay đổi username
    'password': '',  # Thay đổi password
    'database': 'quanlytruonghoc',  # Thay đổi tên database
    'charset': 'utf8mb4',
    'cursorclass': pymysql.cursors.DictCursor
}

def connect_db():
    """Kết nối database"""
    try:
        conn = pymysql.connect(**DB_CONFIG)
        print("✅ Kết nối database thành công!")
        return conn
    except Exception as e:
        print(f"❌ Lỗi kết nối database: {e}")
        sys.exit(1)

def check_current_data(conn):
    """Kiểm tra dữ liệu hiện tại"""
    print("\n🔍 BƯỚC 1: Kiểm tra dữ liệu hiện tại...")
    
    cursor = conn.cursor()
    try:
        # Kiểm tra dữ liệu bị ghi đè
        cursor.execute("""
            SELECT 
                ten_tk,
                year,
                month,
                COUNT(*) as total_questions,
                COUNT(CASE WHEN user_score = sup_score AND user_score IS NOT NULL THEN 1 END) as overwritten_count,
                SUM(user_score) as user_total,
                SUM(sup_score) as sup_total
            FROM bangdanhgia 
            WHERE user_score = sup_score AND user_score IS NOT NULL
            GROUP BY ten_tk, year, month
        """)
        
        overwritten_data = cursor.fetchall()
        
        if not overwritten_data:
            print("✅ Không có dữ liệu nào bị ghi đè!")
            return False
        
        print(f"❌ Tìm thấy {len(overwritten_data)} user có dữ liệu bị ghi đè:")
        for row in overwritten_data:
            print(f"   - {row['ten_tk']} ({row['year']}/{row['month']}): {row['overwritten_count']}/{row['total_questions']} câu hỏi bị ghi đè")
            print(f"     Tổng điểm: user_score={row['user_total']}, sup_score={row['sup_total']}")
        
        return True
        
    except Exception as e:
        print(f"❌ Lỗi khi kiểm tra dữ liệu: {e}")
        return False
    finally:
        cursor.close()

def fix_overwritten_data(conn):
    """Sửa dữ liệu bị ghi đè"""
    print("\n🔧 BƯỚC 2: Sửa dữ liệu bị ghi đè...")
    
    cursor = conn.cursor()
    try:
        # Sửa dữ liệu bị ghi đè - đặt user_score = NULL cho các record mà supervisor tạo
        cursor.execute("""
            UPDATE bangdanhgia 
            SET user_score = NULL, user_comment = ''
            WHERE user_score = sup_score 
              AND user_score IS NOT NULL 
              AND (user_comment = '' OR user_comment IS NULL)
              AND EXISTS (
                  SELECT 1 FROM tongdiem_epa t 
                  WHERE t.ten_tk = bangdanhgia.ten_tk 
                    AND t.year = bangdanhgia.year 
                    AND t.month = bangdanhgia.month
                    AND t.sup_total_score > 0
              )
        """)
        
        updated_rows = cursor.rowcount
        print(f"✅ Đã sửa {updated_rows} record trong bảng bangdanhgia")
        
        return updated_rows > 0
        
    except Exception as e:
        print(f"❌ Lỗi khi sửa dữ liệu: {e}")
        return False
    finally:
        cursor.close()

def fix_tongdiem_epa(conn):
    """Sửa bảng tongdiem_epa"""
    print("\n🔧 BƯỚC 3: Sửa bảng tongdiem_epa...")
    
    cursor = conn.cursor()
    try:
        # Xóa các record tongdiem_epa có user_total_score = sup_total_score (có thể bị ghi đè)
        cursor.execute("""
            DELETE FROM tongdiem_epa 
            WHERE user_total_score = sup_total_score 
              AND user_total_score > 0
        """)
        
        deleted_rows = cursor.rowcount
        print(f"✅ Đã xóa {deleted_rows} record trong bảng tongdiem_epa")
        
        # Tạo lại tongdiem_epa từ dữ liệu đã sửa
        cursor.execute("""
            INSERT INTO tongdiem_epa (ten_tk, year, month, user_total_score, sup_total_score)
            SELECT 
                ten_tk,
                year,
                month,
                COALESCE(SUM(user_score), 0) as user_total_score,
                COALESCE(SUM(sup_score), 0) as sup_total_score
            FROM bangdanhgia
            WHERE sup_score IS NOT NULL
            GROUP BY ten_tk, year, month
            ON DUPLICATE KEY UPDATE
                user_total_score = VALUES(user_total_score),
                sup_total_score = VALUES(sup_total_score)
        """)
        
        print("✅ Đã tạo lại bảng tongdiem_epa")
        return True
        
    except Exception as e:
        print(f"❌ Lỗi khi sửa tongdiem_epa: {e}")
        return False
    finally:
        cursor.close()

def verify_fix(conn):
    """Kiểm tra kết quả sau khi sửa"""
    print("\n🔍 BƯỚC 4: Kiểm tra kết quả...")
    
    cursor = conn.cursor()
    try:
        # Kiểm tra kết quả
        cursor.execute("""
            SELECT 
                ten_tk,
                year,
                month,
                user_total_score,
                sup_total_score,
                CASE 
                    WHEN user_total_score = 0 AND sup_total_score > 0 THEN '✅ Đã sửa - chỉ có sup_score'
                    WHEN user_total_score > 0 AND sup_total_score > 0 THEN '✅ Đã sửa - có cả user_score và sup_score'
                    ELSE '❓ Cần kiểm tra'
                END as status
            FROM tongdiem_epa
            ORDER BY year DESC, month DESC, ten_tk
        """)
        
        results = cursor.fetchall()
        
        print("📊 Kết quả sau khi sửa:")
        for row in results:
            print(f"   - {row['ten_tk']} ({row['year']}/{row['month']}): {row['status']}")
            print(f"     user_total_score: {row['user_total_score']}, sup_total_score: {row['sup_total_score']}")
        
        return True
        
    except Exception as e:
        print(f"❌ Lỗi khi kiểm tra kết quả: {e}")
        return False
    finally:
        cursor.close()

def main():
    """Hàm chính"""
    print("🚀 Bắt đầu sửa vấn đề sup_score ghi đè user_score...")
    print(f"⏰ Thời gian: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Kết nối database
    conn = connect_db()
    
    try:
        # Kiểm tra dữ liệu hiện tại
        has_overwritten = check_current_data(conn)
        
        if not has_overwritten:
            print("\n🎉 Không cần sửa gì cả!")
            return
        
        # Sửa dữ liệu bị ghi đè
        if not fix_overwritten_data(conn):
            print("❌ Không thể sửa dữ liệu!")
            return
        
        # Sửa bảng tongdiem_epa
        if not fix_tongdiem_epa(conn):
            print("❌ Không thể sửa tongdiem_epa!")
            return
        
        # Commit thay đổi
        conn.commit()
        print("✅ Đã commit tất cả thay đổi!")
        
        # Kiểm tra kết quả
        verify_fix(conn)
        
        print("\n🎉 Hoàn thành! Vấn đề đã được khắc phục.")
        print("💡 Bây giờ hãy refresh trang web để xem kết quả.")
        
    except Exception as e:
        print(f"❌ Lỗi: {e}")
        conn.rollback()
        print("🔄 Đã rollback thay đổi!")
    finally:
        conn.close()
        print("🔌 Đã đóng kết nối database.")

if __name__ == "__main__":
    main()
