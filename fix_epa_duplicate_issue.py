#!/usr/bin/env python3
"""
Script chính để khắc phục vấn đề duplicate EPA records
Thực hiện các bước:
1. Hiển thị các bản ghi duplicate hiện tại
2. Dọn dẹp các bản ghi duplicate
3. Cập nhật trigger để tránh tạo duplicate trong tương lai
"""

import pymysql
import subprocess
import sys
import os
from config import DB_CONFIG

def run_sql_script(script_path):
    """Chạy script SQL"""
    try:
        # Đọc nội dung script
        with open(script_path, 'r', encoding='utf-8') as f:
            sql_content = f.read()
        
        # Kết nối database và thực thi
        conn = pymysql.connect(**DB_CONFIG)
        with conn.cursor() as cursor:
            # Tách các câu lệnh SQL
            statements = sql_content.split(';')
            for statement in statements:
                statement = statement.strip()
                if statement and not statement.startswith('--'):
                    cursor.execute(statement)
            conn.commit()
        
        conn.close()
        print(f"✅ Đã chạy script: {script_path}")
        return True
        
    except Exception as e:
        print(f"❌ Lỗi khi chạy script {script_path}: {str(e)}")
        return False

def main():
    print("🔧 KHẮC PHỤC VẤN ĐỀ DUPLICATE EPA RECORDS")
    print("=" * 50)
    
    # Bước 1: Hiển thị các bản ghi duplicate hiện tại
    print("\n📊 BƯỚC 1: Kiểm tra các bản ghi duplicate hiện tại")
    print("-" * 50)
    
    if os.path.exists('fix_duplicate_epa_records.py'):
        subprocess.run([sys.executable, 'fix_duplicate_epa_records.py', '--show'])
    else:
        print("❌ Không tìm thấy file fix_duplicate_epa_records.py")
        return
    
    # Bước 2: Dọn dẹp các bản ghi duplicate
    print("\n🧹 BƯỚC 2: Dọn dẹp các bản ghi duplicate")
    print("-" * 50)
    
    response = input("Bạn có muốn dọn dẹp các bản ghi duplicate không? (y/N): ")
    if response.lower() in ['y', 'yes']:
        subprocess.run([sys.executable, 'fix_duplicate_epa_records.py'])
    else:
        print("⏭️  Bỏ qua bước dọn dẹp")
    
    # Bước 3: Cập nhật trigger
    print("\n🔧 BƯỚC 3: Cập nhật trigger để tránh duplicate trong tương lai")
    print("-" * 50)
    
    response = input("Bạn có muốn cập nhật trigger không? (y/N): ")
    if response.lower() in ['y', 'yes']:
        if run_sql_script('update_trigger_fix_duplicate.sql'):
            print("✅ Trigger đã được cập nhật thành công!")
        else:
            print("❌ Không thể cập nhật trigger")
    else:
        print("⏭️  Bỏ qua bước cập nhật trigger")
    
    # Bước 4: Kiểm tra lại
    print("\n🔍 BƯỚC 4: Kiểm tra lại sau khi khắc phục")
    print("-" * 50)
    
    response = input("Bạn có muốn kiểm tra lại không? (y/N): ")
    if response.lower() in ['y', 'yes']:
        subprocess.run([sys.executable, 'fix_duplicate_epa_records.py', '--show'])
    
    print("\n🎉 HOÀN THÀNH!")
    print("=" * 50)
    print("Các thay đổi đã được thực hiện:")
    print("✅ Logic trong app.py đã được cải thiện")
    print("✅ Logic trong giaovien_epa.py đã được cải thiện")
    print("✅ Trigger đã được cập nhật (nếu bạn chọn)")
    print("✅ Các bản ghi duplicate đã được dọn dẹp (nếu bạn chọn)")
    print("\n💡 Lưu ý:")
    print("- Hệ thống giờ sẽ cập nhật bản ghi hiện có thay vì tạo mới")
    print("- Mỗi giáo viên chỉ có 1 bản ghi cho mỗi tháng/năm")
    print("- Dữ liệu sẽ được merge đúng cách (user_score + sup_score)")

if __name__ == "__main__":
    main()

