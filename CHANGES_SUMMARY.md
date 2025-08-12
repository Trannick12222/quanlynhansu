# 📋 Tóm Tắt Các Thay Đổi - Bảo Vệ Quyền Riêng Tư

## 🎯 Vấn Đề Được Giải Quyết

**Vấn đề**: Khi đăng nhập bằng tài khoản supervisor hoặc user, họ có thể xem toàn bộ thông tin nhạy cảm của giáo viên bao gồm:
- CCCD (Căn cước công dân)
- Số bảo hiểm
- Số điện thoại
- Mã số thuế
- CMND
- Tài khoản ngân hàng

**Giải pháp**: Triển khai hệ thống phân quyền truy cập để ẩn thông tin nhạy cảm.

## 📝 Các File Đã Thay Đổi

### 1. `app.py`
**Thay đổi**: Cập nhật API `/api/employees` để lọc dữ liệu dựa trên vai trò

**Trước**:
```python
@app.route("/api/employees")
def api_employees():
    dept = request.args.get("dept")
    if dept == "GV":
        table = "giaovien"
        query = f"SELECT * FROM {table}"
    # ...
```

**Sau**:
```python
@app.route("/api/employees")
def api_employees():
    # Kiểm tra quyền truy cập
    if "user" not in session:
        return jsonify({"error": "Unauthorized"}), 401
    
    current_user = session["user"]
    current_role = session.get("role", "")
    
    # Chỉ admin, kimnhung, ngocquy mới có quyền xem thông tin nhạy cảm
    can_view_sensitive = current_user in ("admin", "kimnhung", "ngocquy") or current_role in ("admin", "Administrator")
    
    if dept == "GV":
        if can_view_sensitive:
            query = "SELECT * FROM giaovien"
        else:
            # Ẩn thông tin nhạy cảm
            query = """
                SELECT 
                    ma_gv, ho_va_ten, ten_tk, chuc_vu, ngay_sinh, que_quan,
                    NULL as cccd, NULL as ngay_cap, NULL as mst, NULL as cmnd,
                    NULL as so_bh, NULL as sdt, NULL as tk_nh,
                    email, nhom_mau, dia_chi
                FROM giaovien
            """
```

### 2. `templates/nhansu_info.html`

#### A. Ẩn Cột Nhạy Cảm
**Thay đổi**: Thêm class `sensitive-column` và ẩn mặc định

```html
<!-- Trước -->
<th class="px-4 py-3 text-left font-cute font-semibold">CCCD</th>

<!-- Sau -->
<th class="px-4 py-3 text-left font-cute font-semibold sensitive-column" style="display: none;">CCCD</th>
```

#### B. Thêm Thông Báo Cảnh Báo
**Thêm**: Thông báo cho người dùng không có quyền

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

#### C. Cập Nhật JavaScript
**Thêm**: Logic xử lý quyền truy cập

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
  
  // Hiển thị thông báo nếu không có quyền
  if (accessNotice) {
    accessNotice.style.display = window.canViewSensitive ? 'none' : 'block';
  }
}
```

#### D. Cập Nhật Hàm Render
**Thay đổi**: Ẩn dữ liệu nhạy cảm trong bảng

```javascript
// Ẩn thông tin nhạy cảm nếu không có quyền
const sensitiveData = window.canViewSensitive ? {
  cccd: row.cccd || "",
  // ... các trường khác
} : {
  cccd: "***",
  // ... các trường khác
};
```

## 🔐 Hệ Thống Phân Quyền

### Có Quyền Xem Thông Tin Nhạy Cảm
- `admin` (Administrator)
- `kimnhung`
- `ngocquy`

### Không Có Quyền Xem Thông Tin Nhạy Cảm
- `supervisor` (ngocngoan)
- `user` (các tài khoản thường)

## ✅ Kết Quả

### Với Admin
- ✅ Xem được tất cả thông tin
- ✅ Có thể thêm/sửa/xóa
- ✅ Không có thông báo cảnh báo

### Với Supervisor/User
- ✅ Chỉ xem được thông tin cơ bản
- ❌ Không xem được thông tin nhạy cảm
- ⚠️ Hiển thị thông báo cảnh báo
- ❌ Không thể thêm/sửa/xóa

## 🧪 Cách Kiểm Tra

1. **Đăng nhập với admin**: `admin` / `admin123`
   - Vào trang `/dashboard?page=%2Femployees`
   - Chọn bộ phận "GIÁO VIÊN"
   - Kiểm tra xem có thấy CCCD, số bảo hiểm, số điện thoại không

2. **Đăng nhập với supervisor**: `ngocngoan` / `password123`
   - Vào trang `/dashboard?page=%2Femployees`
   - Chọn bộ phận "GIÁO VIÊN"
   - Kiểm tra xem các cột nhạy cảm có bị ẩn không
   - Kiểm tra thông báo cảnh báo

## 📊 Thống Kê Thay Đổi

- **Files modified**: 2
- **Lines added**: ~50
- **Lines modified**: ~30
- **Security improvements**: 7 thông tin nhạy cảm được bảo vệ
- **User experience**: Thêm thông báo cảnh báo

## 🚀 Triển Khai

Các thay đổi đã sẵn sàng để triển khai. Không cần thay đổi database hay cấu hình thêm.

**Lưu ý**: Đảm bảo restart server Flask sau khi cập nhật code.
