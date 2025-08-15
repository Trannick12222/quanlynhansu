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
        (SELECT SUM(user_score) FROM bangdanhgia WHERE ten_tk = NEW.ten_tk AND year = NEW.year AND month = NEW.month),
        (SELECT SUM(sup_score) FROM bangdanhgia WHERE ten_tk = NEW.ten_tk AND year = NEW.year AND month = NEW.month)
    )
    ON DUPLICATE KEY UPDATE
        user_total_score = VALUES(user_total_score),
        sup_total_score = VALUES(sup_total_score);
END;
//

DELIMITER ;
