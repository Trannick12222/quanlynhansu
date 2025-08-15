# Khắc phục vấn đề Sup_score ghi đè User_score

## Mô tả vấn đề

Khi supervisor đánh giá EPA cho tổ viên, điểm `Sup_score` đang ghi đè lên `user_score` trong database, khiến "Tổng điểm GV" bằng với "Sup Score". Điều này xảy ra do:

1. **Logic sai trong code**: Khi supervisor tạo record mới, cả `user_score` và `sup_score` đều được set cùng một giá trị
2. **Function `update_tongdiem_epa`**: Ghi đè cả `user_total_score` và `sup_total_score`
3. **Trigger database**: Có thể gây ra race condition

## Các file đã được sửa

### 1. `apis/giaovien_epa.py`
- **Dòng 616-620**: Sửa logic xử lý cho supervisor
- **Dòng 311-352**: Sửa function `update_tongdiem_epa` để phân biệt role
- **Dòng 738**: Truyền role khi gọi function

**Thay đổi chính:**
```python
if role == 'supervisor':
    # CHỐNG BUG: Khi supervisor tạo record mới, user_score phải là NULL
    sup_score = user_score  # Điểm supervisor nhập
    user_score = None       # KHÔNG copy điểm supervisor vào user_score
    user_comment = ''       # KHÔNG copy comment supervisor vào user_comment
```

### 2. `apis/giaovien_epa_tmp.py`
- **Dòng 73-120**: Cập nhật function `update_tongdiem_epa` tương tự
- **Dòng 326**: Truyền role khi gọi function

### 3. `app.py`
- **Dòng 1844-1972**: Route `update_sup_epa` đã có logic bảo vệ `user_score`
- **Dòng 1930-1950**: Sửa logic cập nhật `tongdiem_epa`

## Cách khắc phục

### Bước 1: Cập nhật code (Đã hoàn thành)
Các file đã được sửa để ngăn chặn vấn đề trong tương lai.

### Bước 2: Sửa dữ liệu hiện tại
Chạy script SQL `fix_sup_score_overwrite.sql` để sửa dữ liệu đã bị ghi đè:

```sql
-- Kết nối database và chạy:
source fix_sup_score_overwrite.sql;
```

### Bước 3: Kiểm tra kết quả
Script sẽ hiển thị:
- Dữ liệu trước khi sửa
- Số lượng record bị ghi đè
- Kết quả sau khi sửa
- Trạng thái của từng user

## Logic mới

### Khi Supervisor đánh giá:
1. **Tạo record mới**: `user_score = NULL`, `sup_score = điểm_supervisor`
2. **Cập nhật record**: Chỉ thay đổi `sup_score`, giữ nguyên `user_score`
3. **Cập nhật tongdiem_epa**: Chỉ cập nhật `sup_total_score`

### Khi User tự đánh giá:
1. **Tạo/cập nhật record**: `user_score = điểm_user`, `sup_score = NULL`
2. **Cập nhật tongdiem_epa**: Cập nhật cả `user_total_score` và `sup_total_score`

## Kiểm tra sau khi khắc phục

1. **Trong bảng `bangdanhgia`**:
   - `user_score` và `sup_score` phải khác nhau
   - `user_score` chỉ có giá trị khi user tự đánh giá
   - `sup_score` chỉ có giá trị khi supervisor đánh giá

2. **Trong bảng `tongdiem_epa`**:
   - `user_total_score` và `sup_total_score` phải khác nhau
   - `user_total_score` = tổng điểm tự đánh giá
   - `sup_total_score` = tổng điểm supervisor đánh giá

## Phòng ngừa trong tương lai

1. **Code review**: Kiểm tra logic xử lý role supervisor
2. **Unit test**: Test các trường hợp supervisor vs user
3. **Database constraint**: Có thể thêm constraint để đảm bảo logic
4. **Monitoring**: Log và alert khi có dấu hiệu ghi đè

## Lưu ý quan trọng

- **Backup database** trước khi chạy script sửa
- **Test trên môi trường dev** trước khi áp dụng production
- **Kiểm tra dữ liệu** sau khi sửa để đảm bảo tính toàn vẹn
- **Thông báo cho team** về thay đổi logic

## Liên hệ hỗ trợ

Nếu gặp vấn đề trong quá trình khắc phục, hãy:
1. Kiểm tra log trong `server.log`
2. Chạy script kiểm tra dữ liệu
3. Liên hệ team development
