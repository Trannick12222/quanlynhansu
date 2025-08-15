-- Script để sửa vấn đề sup_score ghi đè user_score
-- Chạy script này để khôi phục dữ liệu đã bị ghi đè

-- Bước 1: Xem dữ liệu hiện tại để kiểm tra
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
GROUP BY ten_tk, year, month;

-- Bước 2: Sửa dữ liệu bị ghi đè - đặt user_score = NULL cho các record mà supervisor tạo
-- Chỉ áp dụng cho các record có user_comment rỗng (có thể là supervisor tạo)
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
  );

-- Bước 3: Cập nhật lại tongdiem_epa để phản ánh thay đổi
-- Xóa các record tongdiem_epa có user_total_score = sup_total_score (có thể bị ghi đè)
DELETE FROM tongdiem_epa 
WHERE user_total_score = sup_total_score 
  AND user_total_score > 0;

-- Bước 4: Tạo lại tongdiem_epa từ dữ liệu đã sửa
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
    sup_total_score = VALUES(sup_total_score);

-- Bước 5: Kiểm tra kết quả
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
ORDER BY year DESC, month DESC, ten_tk;

-- Thông báo hoàn thành
SELECT 'Script sửa vấn đề sup_score ghi đè user_score đã hoàn thành!' as message;
