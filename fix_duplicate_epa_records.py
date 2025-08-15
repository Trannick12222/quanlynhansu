#!/usr/bin/env python3
"""
Script để dọn dẹp các bản ghi duplicate trong bảng tongdiem_epa
Giữ lại bản ghi có đầy đủ thông tin nhất (có cả user_total_score và sup_total_score)
"""

import pymysql
from config import DB_CONFIG
import logging

# Cấu hình logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def fix_duplicate_epa_records():
    """Dọn dẹp các bản ghi duplicate trong tongdiem_epa"""
    
    conn = pymysql.connect(**DB_CONFIG)
    try:
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:
            
            # 1. Tìm tất cả các nhóm duplicate
            logger.info("🔍 Tìm kiếm các bản ghi duplicate...")
            cursor.execute("""
                SELECT ten_tk, year, month, COUNT(*) as count
                FROM tongdiem_epa
                GROUP BY ten_tk, year, month
                HAVING COUNT(*) > 1
                ORDER BY ten_tk, year, month
            """)
            
            duplicate_groups = cursor.fetchall()
            
            if not duplicate_groups:
                logger.info("✅ Không có bản ghi duplicate nào được tìm thấy!")
                return
            
            logger.info(f"📊 Tìm thấy {len(duplicate_groups)} nhóm duplicate")
            
            total_deleted = 0
            
            for group in duplicate_groups:
                ten_tk = group['ten_tk']
                year = group['year']
                month = group['month']
                count = group['count']
                
                logger.info(f"🔧 Xử lý duplicate cho {ten_tk} - {month}/{year} ({count} bản ghi)")
                
                # 2. Lấy tất cả bản ghi trong nhóm này
                cursor.execute("""
                    SELECT id, ten_tk, year, month, user_total_score, sup_total_score, 
                           pri_total_score, pri_comment, created_at
                    FROM tongdiem_epa
                    WHERE ten_tk = %s AND year = %s AND month = %s
                    ORDER BY 
                        CASE 
                            WHEN user_total_score IS NOT NULL AND sup_total_score IS NOT NULL THEN 1
                            WHEN user_total_score IS NOT NULL THEN 2
                            WHEN sup_total_score IS NOT NULL THEN 3
                            ELSE 4
                        END,
                        created_at DESC
                """, (ten_tk, year, month))
                
                records = cursor.fetchall()
                
                if len(records) <= 1:
                    continue
                
                # 3. Giữ lại bản ghi tốt nhất (đầu tiên sau khi sắp xếp)
                best_record = records[0]
                records_to_delete = records[1:]
                
                logger.info(f"   ✅ Giữ lại bản ghi ID={best_record['id']} "
                          f"(user_score={best_record['user_total_score']}, "
                          f"sup_score={best_record['sup_total_score']})")
                
                # 4. Xóa các bản ghi còn lại
                for record in records_to_delete:
                    logger.info(f"   🗑️  Xóa bản ghi ID={record['id']} "
                              f"(user_score={record['user_total_score']}, "
                              f"sup_score={record['sup_total_score']})")
                    
                    cursor.execute("DELETE FROM tongdiem_epa WHERE id = %s", (record['id'],))
                    total_deleted += 1
                
                # 5. Commit sau mỗi nhóm để tránh mất dữ liệu
                conn.commit()
                logger.info(f"   ✅ Đã xử lý xong nhóm {ten_tk} - {month}/{year}")
            
            logger.info(f"🎉 Hoàn thành! Đã xóa {total_deleted} bản ghi duplicate")
            
            # 6. Kiểm tra lại
            cursor.execute("""
                SELECT ten_tk, year, month, COUNT(*) as count
                FROM tongdiem_epa
                GROUP BY ten_tk, year, month
                HAVING COUNT(*) > 1
            """)
            
            remaining_duplicates = cursor.fetchall()
            if remaining_duplicates:
                logger.warning(f"⚠️  Vẫn còn {len(remaining_duplicates)} nhóm duplicate!")
                for dup in remaining_duplicates:
                    logger.warning(f"   - {dup['ten_tk']} - {dup['month']}/{dup['year']} ({dup['count']} bản ghi)")
            else:
                logger.info("✅ Không còn bản ghi duplicate nào!")
                
    except Exception as e:
        logger.error(f"❌ Lỗi: {str(e)}")
        conn.rollback()
        raise
    finally:
        conn.close()

def show_current_duplicates():
    """Hiển thị các bản ghi duplicate hiện tại"""
    
    conn = pymysql.connect(**DB_CONFIG)
    try:
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:
            
            cursor.execute("""
                SELECT ten_tk, year, month, COUNT(*) as count
                FROM tongdiem_epa
                GROUP BY ten_tk, year, month
                HAVING COUNT(*) > 1
                ORDER BY ten_tk, year, month
            """)
            
            duplicates = cursor.fetchall()
            
            if not duplicates:
                print("✅ Không có bản ghi duplicate nào!")
                return
            
            print(f"📊 Tìm thấy {len(duplicates)} nhóm duplicate:")
            print("-" * 60)
            
            for dup in duplicates:
                print(f"👤 {dup['ten_tk']} - Tháng {dup['month']}/{dup['year']} ({dup['count']} bản ghi)")
                
                # Hiển thị chi tiết các bản ghi
                cursor.execute("""
                    SELECT id, user_total_score, sup_total_score, pri_total_score, created_at
                    FROM tongdiem_epa
                    WHERE ten_tk = %s AND year = %s AND month = %s
                    ORDER BY created_at
                """, (dup['ten_tk'], dup['year'], dup['month']))
                
                records = cursor.fetchall()
                for i, record in enumerate(records, 1):
                    print(f"   {i}. ID={record['id']}: "
                          f"user={record['user_total_score']}, "
                          f"sup={record['sup_total_score']}, "
                          f"pri={record['pri_total_score']}, "
                          f"created={record['created_at']}")
                print()
                
    finally:
        conn.close()

if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1 and sys.argv[1] == "--show":
        print("🔍 Hiển thị các bản ghi duplicate hiện tại:")
        show_current_duplicates()
    else:
        print("🧹 Bắt đầu dọn dẹp các bản ghi duplicate...")
        print("⚠️  Lưu ý: Hãy backup database trước khi chạy script này!")
        
        response = input("Bạn có chắc chắn muốn tiếp tục? (y/N): ")
        if response.lower() in ['y', 'yes']:
            fix_duplicate_epa_records()
        else:
            print("❌ Đã hủy bỏ.")

