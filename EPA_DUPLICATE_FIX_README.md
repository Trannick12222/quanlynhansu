# 🔧 KHẮC PHỤC VẤN ĐỀ DUPLICATE EPA RECORDS

## 📋 Mô tả vấn đề

Khi supervisor tạo đánh giá cho tổ viên, hệ thống đang tạo dòng mới thay vì cập nhật dòng cũ, dẫn đến:
- **Dòng mới**: Có Sup Score nhưng không có Tổng điểm GV
- **Dòng cũ**: Có Tổng điểm GV nhưng không có Sup Score
- Hiển thị nhiều dòng cho cùng một nhân viên với thông tin không đầy đủ

## 🔍 Nguyên nhân

1. **Logic INSERT không đồng nhất**: Cả `app.py` và `giaovien_epa.py` đều sử dụng INSERT thay vì UPDATE
2. **Race condition**: Trigger và logic code có thể chạy đồng thời
3. **Thiếu UNIQUE constraint handling**: Không xử lý đúng khi có duplicate key

## ✅ Giải pháp đã thực hiện

### 1. Cải thiện logic trong `app.py`
- Thay thế `INSERT ... ON DUPLICATE KEY UPDATE` bằng logic kiểm tra và UPDATE/INSERT rõ ràng
- Kiểm tra bản ghi hiện có trước khi thực hiện thao tác

### 2. Cải thiện logic trong `giaovien_epa.py`
- Sử dụng `INSERT ... ON DUPLICATE KEY UPDATE` để tránh race condition
- Loại bỏ logic kiểm tra phức tạp không cần thiết

### 3. Cập nhật trigger
- Sử dụng `INSERT ... ON DUPLICATE KEY UPDATE` trong trigger
- Tránh tạo duplicate khi có nhiều INSERT đồng thời

### 4. Script dọn dẹp dữ liệu
- Tạo script để dọn dẹp các bản ghi duplicate hiện có
- Giữ lại bản ghi có thông tin đầy đủ nhất

## 🚀 Cách thực hiện khắc phục

### Bước 1: Backup database
```bash
# Backup database trước khi thực hiện
mysqldump -u username -p database_name > backup_before_fix.sql
```

### Bước 2: Chạy script khắc phục
```bash
python fix_epa_duplicate_issue.py
```

Script này sẽ:
1. Hiển thị các bản ghi duplicate hiện tại
2. Dọn dẹp các bản ghi duplicate (tùy chọn)
3. Cập nhật trigger (tùy chọn)
4. Kiểm tra lại kết quả

### Bước 3: Kiểm tra thủ công (tùy chọn)
```bash
# Chỉ hiển thị các bản ghi duplicate
python fix_duplicate_epa_records.py --show

# Dọn dẹp thủ công
python fix_duplicate_epa_records.py
```

### Bước 4: Cập nhật trigger (nếu chưa làm)
```sql
-- Chạy file SQL này trong database
source update_trigger_fix_duplicate.sql;
```

## 📁 Files đã tạo/sửa đổi

### Files đã sửa:
- `app.py` - Cải thiện logic update_sup_epa()
- `apis/giaovien_epa.py` - Cải thiện logic insert/update tongdiem_epa

### Files mới tạo:
- `fix_duplicate_epa_records.py` - Script dọn dẹp duplicate records
- `fix_epa_duplicate_issue.py` - Script chính khắc phục vấn đề
- `update_trigger_fix_duplicate.sql` - SQL cập nhật trigger
- `EPA_DUPLICATE_FIX_README.md` - File hướng dẫn này

### Files đã cập nhật:
- `schema/trigger_update_tongdiem.sql` - Cải thiện logic trigger

## 🔄 Kết quả mong đợi

Sau khi khắc phục:
- ✅ Mỗi giáo viên chỉ có 1 bản ghi cho mỗi tháng/năm
- ✅ Dữ liệu được merge đúng cách (user_score + sup_score)
- ✅ Không còn tạo duplicate records
- ✅ Hiển thị đúng thông tin trong dashboard

## ⚠️ Lưu ý quan trọng

1. **Backup database** trước khi chạy script dọn dẹp
2. **Test trên môi trường dev** trước khi áp dụng production
3. **Kiểm tra kỹ** sau khi thực hiện để đảm bảo dữ liệu không bị mất
4. **Monitor** hệ thống sau khi cập nhật để đảm bảo không có lỗi mới

## 🐛 Troubleshooting

### Nếu vẫn còn duplicate:
1. Kiểm tra xem trigger đã được cập nhật chưa
2. Chạy lại script dọn dẹp
3. Kiểm tra log để tìm nguyên nhân

### Nếu có lỗi khi chạy script:
1. Kiểm tra kết nối database
2. Kiểm tra quyền truy cập
3. Kiểm tra cấu trúc bảng tongdiem_epa

## 📞 Hỗ trợ

Nếu gặp vấn đề, vui lòng:
1. Kiểm tra log của ứng dụng
2. Chụp màn hình lỗi
3. Cung cấp thông tin về môi trường (OS, database version, etc.)

