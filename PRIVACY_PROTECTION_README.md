# 🔒 Hệ Thống Bảo Vệ Quyền Riêng Tư

## 📋 Tổng Quan

Hệ thống đã được cập nhật để bảo vệ thông tin nhạy cảm của giáo viên khỏi việc truy cập trái phép. Các thông tin nhạy cảm bao gồm:

- **CCCD** (Căn cước công dân)
- **Ngày cấp CCCD**
- **Mã số thuế**
- **CMND** (Chứng minh nhân dân)
- **Số bảo hiểm**
- **Số điện thoại**
- **Tài khoản ngân hàng**

## 🛡️ Cơ Chế Bảo Vệ

### 1. Phân Quyền Truy Cập

**Có quyền xem thông tin nhạy cảm:**
- `admin` (Administrator)
- `kimnhung` 
- `ngocquy`

**Không có quyền xem thông tin nhạy cảm:**
- `supervisor` (ngocngoan)
- `user` (các tài khoản thường)

### 2. Bảo Vệ Ở Backend (API)

File: `app.py` - Route `/api/employees`

```python
# Kiểm tra quyền truy cập
current_user = session["user"]
current_role = session.get("role", "")

# Chỉ admin, kimnhung, ngocquy mới có quyền xem thông tin nhạy cảm
can_view_sensitive = current_user in ("admin", "kimnhung", "ngocquy") or current_role in ("admin", "Administrator")

if dept == "GV":
    if can_view_sensitive:
        # Hiển thị tất cả thông tin cho admin
        query = "SELECT * FROM giaovien"
    else:
        # Ẩn thông tin nhạy cảm cho user và supervisor
        query = """
            SELECT 
                ma_gv, ho_va_ten, ten_tk, chuc_vu, ngay_sinh, que_quan,
                NULL as cccd, NULL as ngay_cap, NULL as mst, NULL as cmnd,
                NULL as so_bh, NULL as sdt, NULL as tk_nh,
                email, nhom_mau, dia_chi
            FROM giaovien
        """
```

### 3. Bảo Vệ Ở Frontend (Template)

File: `templates/nhansu_info.html`

#### Ẩn Cột Nhạy Cảm
```html
<th class="px-4 py-3 text-left font-cute font-semibold sensitive-column" style="display: none;">CCCD</th>
<th class="px-4 py-3 text-left font-cute font-semibold sensitive-column" style="display: none;">Ngày Cấp CCCD</th>
<!-- ... các cột nhạy cảm khác -->
```

#### Thông Báo Quyền Truy Cập
```html
<div id="access-notice" class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-4" style="display: none;">
  <div class="flex items-center">
    <div class="flex-shrink-0">
      <i class="fas fa-exclamation-triangle text-yellow-500"></i>
    </div>
    <div class="ml-3">
      <p class="text-sm font-cute">
        <strong>Lưu ý:</strong> Bạn chỉ có quyền xem thông tin cơ bản. Các thông tin nhạy cảm như CCCD, số bảo hiểm, số điện thoại đã được ẩn để bảo vệ quyền riêng tư.
      </p>
    </div>
  </div>
</div>
```

#### JavaScript Xử Lý
```javascript
// Cập nhật quyền xem thông tin nhạy cảm
window.canViewSensitive = result.can_view_sensitive || false;

// Hiển thị/ẩn các cột nhạy cảm
if (dept === "GV") {
  const sensitiveColumns = document.querySelectorAll('.sensitive-column');
  const accessNotice = document.getElementById('access-notice');
  
  sensitiveColumns.forEach(col => {
    col.style.display = window.canViewSensitive ? 'table-cell' : 'none';
  });
  
  // Hiển thị thông báo nếu không có quyền xem thông tin nhạy cảm
  if (accessNotice) {
    accessNotice.style.display = window.canViewSensitive ? 'none' : 'block';
  }
}
```

## 🧪 Kiểm Tra Hệ Thống

### Chạy Test
```bash
python test_privacy_protection.py
```

### Test Cases
1. **Admin Access**: Đăng nhập với `admin` → Có thể xem tất cả thông tin
2. **Supervisor Access**: Đăng nhập với `ngocngoan` → Không thể xem thông tin nhạy cảm
3. **User Access**: Đăng nhập với `user1` → Không thể xem thông tin nhạy cảm

## 📊 Kết Quả Mong Đợi

### Với Admin (`admin`, `kimnhung`, `ngocquy`)
- ✅ Xem được tất cả thông tin
- ✅ Có thể thêm/sửa/xóa
- ✅ Không có thông báo cảnh báo

### Với Supervisor/User (`ngocngoan`, `user1`)
- ✅ Chỉ xem được thông tin cơ bản
- ❌ Không xem được CCCD, số bảo hiểm, số điện thoại
- ⚠️ Hiển thị thông báo cảnh báo
- ❌ Không thể thêm/sửa/xóa

## 🔧 Cấu Hình Thêm

### Thêm User Có Quyền Admin
```python
# Trong app.py, thêm vào danh sách can_view_sensitive
can_view_sensitive = current_user in ("admin", "kimnhung", "ngocquy", "new_admin_user") or current_role in ("admin", "Administrator")
```

### Thêm Trường Nhạy Cảm Mới
```python
# Trong API
sensitive_fields = ['cccd', 'mst', 'cmnd', 'so_bh', 'sdt', 'tk_nh', 'new_sensitive_field']

# Trong template
<th class="px-4 py-3 text-left font-cute font-semibold sensitive-column" style="display: none;">Trường Mới</th>
```

## 🚨 Lưu Ý Bảo Mật

1. **Session Management**: Đảm bảo session được quản lý an toàn
2. **SQL Injection**: Sử dụng parameterized queries
3. **XSS Protection**: Escape dữ liệu đầu ra
4. **CSRF Protection**: Thêm CSRF tokens cho các form
5. **Logging**: Ghi log tất cả truy cập vào thông tin nhạy cảm

## 📝 Changelog

### Version 1.0.0
- ✅ Thêm hệ thống phân quyền truy cập
- ✅ Ẩn thông tin nhạy cảm cho user/supervisor
- ✅ Thêm thông báo cảnh báo
- ✅ Cập nhật API để lọc dữ liệu
- ✅ Thêm test cases
- ✅ Tạo documentation

---

**⚠️ Quan trọng**: Hệ thống này chỉ bảo vệ ở tầng ứng dụng. Để bảo mật hoàn toàn, cần kết hợp với:
- Bảo mật database
- Mã hóa dữ liệu
- Network security
- Access control ở tầng hệ thống
