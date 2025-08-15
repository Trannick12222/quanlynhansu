-- Script để cập nhật trigger trg_update_tongdiem để tránh tạo duplicate records
-- Chạy script này để cập nhật trigger hiện tại

-- Xóa trigger cũ nếu tồn tại
DROP TRIGGER IF EXISTS trg_update_tongdiem;

-- Tạo trigger mới với logic cải thiện
DELIMITER //

CREATE TRIGGER trg_update_tongdiem
AFTER INSERT ON bangdanhgia
FOR EACH ROW
BEGIN
    -- Sử dụng INSERT ... ON DUPLICATE KEY UPDATE để tránh race condition
    INSERT INTO tongdiem_epa (ten_tk, year, month, user_total_score, sup_total_score)
    VALUES (
        NEW.ten_tk,
        NEW.year,
        NEW.month,
        (SELECT COALESCE(SUM(user_score), 0) FROM bangdanhgia WHERE ten_tk = NEW.ten_tk AND year = NEW.year AND month = NEW.month),
        (SELECT COALESCE(SUM(sup_score), 0) FROM bangdanhgia WHERE ten_tk = NEW.ten_tk AND year = NEW.year AND month = NEW.month)
    )
    ON DUPLICATE KEY UPDATE
        user_total_score = VALUES(user_total_score),
        sup_total_score = VALUES(sup_total_score);
END//

DELIMITER ;

-- Thông báo hoàn thành
SELECT 'Trigger trg_update_tongdiem đã được cập nhật thành công!' as message;
