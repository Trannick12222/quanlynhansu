-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlytruonghoc_app
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bangdanhgia`
--

DROP TABLE IF EXISTS `bangdanhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangdanhgia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_tk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chuc_vu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `translate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `user_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `user_score` int DEFAULT NULL,
  `sup_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `sup_score` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ten_tk` (`ten_tk`),
  CONSTRAINT `bangdanhgia_ibfk_1` FOREIGN KEY (`ten_tk`) REFERENCES `tk` (`ten_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangdanhgia`
--

LOCK TABLES `bangdanhgia` WRITE;
/*!40000 ALTER TABLE `bangdanhgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `bangdanhgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cauhoi_epa`
--

DROP TABLE IF EXISTS `cauhoi_epa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cauhoi_epa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `translate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `score` int DEFAULT '20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cauhoi_epa`
--

LOCK TABLES `cauhoi_epa` WRITE;
/*!40000 ALTER TABLE `cauhoi_epa` DISABLE KEYS */;
INSERT INTO `cauhoi_epa` VALUES (1,'Do you strictly comply with working hours this month? (Late arrivals, unpermitted absences, non-participation in collective activities…)','',10),(2,'Do you fully and correctly implement professional activities: etiquette, weekly activities, morning exercise, learning activities, corner activities, and outdoor activities?','Bạn có thực hiện đầy đủ và đúng quy trình các hoạt động chuyên môn: lễ giáo, sinh hoạt đầu tuần, thể dục sáng, hoạt động học, hoạt động góc, hoạt động ngoài trời không?',20),(3,'Do you prepare teaching aids, music, and tools sufficiently and follow proper teaching methods in professional activities? (Be proactive, memorize demonstration movements, model activities for children…)','',10),(4,'Do you ensure children\'s safety during all learning and outdoor play activities? (No accidents, unsafe play, or lack of safety tools…)','Bạn có đảm bảo an toàn cho trẻ trong suốt các hoạt động học tập và vui chơi ngoài trời không? (Không để xảy ra tai nạn, trẻ chơi sai cách, thiếu dụng cụ an toàn…)',20),(5,'For boarding care: Do you maintain hygiene during mealtime, distribute food in the correct portions, and support children to eat enough according to the menu?','',5),(6,'Do you ensure personal hygiene, sleep, clothing, toilet routines, and clean handling of personal items for children?','Bạn có đảm bảo công tác chăm sóc trẻ: vệ sinh cá nhân, giấc ngủ, trang phục, hỗ trợ trẻ đi vệ sinh đúng quy trình và xử lý đồ dùng cá nhân sạch sẽ không?',20),(7,'Did any child experience weight loss, no weight gain, or health issues this month due to your fault?','Trong tháng, có tình trạng trẻ bị sụt cân, không lên cân, hoặc sức khỏe trẻ bị ảnh hưởng do lỗi của bạn không?',10),(8,'Do you complete all assigned extra duties such as updating the app, submitting assignments on time, and fully participating in festivals and meetings?','Bạn có thực hiện đầy đủ các công việc được phân công thêm: cập nhật app, nộp bài tập chuyên môn đúng hạn, tham gia đầy đủ lễ hội và họp không?',20),(9,'Do you collaborate well with parents and colleagues in caring for, educating children, and preserving facilities? (Put toys away, keep areas clean, work with parents to solve children\'s issues…)','Bạn có phối hợp tốt với phụ huynh và đồng nghiệp trong công tác chăm sóc, giáo dục trẻ và bảo quản cơ sở vật chất không? (Cất đồ chơi đúng chỗ, giữ vệ sinh khu vực phụ trách, phối hợp phụ huynh giải quyết các vấn đề của trẻ…)',20),(10,'Have you been negatively reported by parents, caught on camera, or caused incidents that harmed the school\'s reputation this month?','Trong tháng, bạn có bị phụ huynh/phản ánh tiêu cực, bị trích xuất camera, hoặc để xảy ra sự cố ảnh hưởng uy tín nhà trường không?',10);
/*!40000 ALTER TABLE `cauhoi_epa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_lop`
--

DROP TABLE IF EXISTS `ds_lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ds_lop` (
  `ma_lop` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ten_lop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `khoi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nam_hoc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `si_so` int DEFAULT '0',
  `ghi_chu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_lop`
--

LOCK TABLES `ds_lop` WRITE;
/*!40000 ALTER TABLE `ds_lop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giaovien`
--

DROP TABLE IF EXISTS `giaovien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaovien` (
  `ma_gv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ten_tk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chuc_vu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `que_quan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cccd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_cap` date DEFAULT NULL,
  `mst` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cmnd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `so_bh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sdt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tk_nh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nhom_mau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dia_chi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gioi_tinh` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_vao_lam` date DEFAULT NULL,
  `luong_co_ban` decimal(15,2) DEFAULT NULL,
  `phu_cap` decimal(15,2) DEFAULT NULL,
  `tong_luong` decimal(15,2) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'active',
  PRIMARY KEY (`ma_gv`),
  UNIQUE KEY `ten_tk` (`ten_tk`),
  CONSTRAINT `giaovien_ibfk_1` FOREIGN KEY (`ten_tk`) REFERENCES `tk` (`ten_tk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaovien`
--

LOCK TABLES `giaovien` WRITE;
/*!40000 ALTER TABLE `giaovien` DISABLE KEYS */;
INSERT INTO `giaovien` VALUES ('GV0001','Đặng Thị Kim Nhung','kimnhung','HT','1982-03-06','Bình Định','068182012582','2021-08-12','5801208827','250581492','4207000877','0976896384','5404215007578','dangthikimnhung82@gmail.com','O','xóm 4a, Quả+N6:N22ng Đức, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0002','Đặng Thị Ngọc Qúy','ngocquy','PHT','1986-11-12','Bình Định','068186008915','2021-08-12','8052739893','250645771','6810000069','0345370570','5404205048499','ngocquy121186@gmail.com','O','xóm 4a, Quảng Đức, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0003','Nguyễn Thị Ngọc','ngocnguyen','TGV1','1982-06-08','Thanh Hóa','038182044169','2021-09-01','8030986867','250490545','6809001713','0969797606','5404205402215','ngochoahuongduong82@gmail.com',NULL,'TDP Đồng Tâm, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0004','K\' Diên','kdien','TGV2','1997-08-20','Lâm Đồng','068197011223','2021-10-02','8745385991','251153661','6821791130','0388448327','5404205444845','Kdien0897@gmail.com',NULL,'99 TDP Pót Pe, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0005','Nguyễn Thị Thu Uyên','thuuyen','GV1','2000-03-12','Nghệ An','068300002223','2022-10-06',NULL,NULL,NULL,'0914227907','0914227907 (MB)','ntu0914227907@gmail.com',NULL,'Thôn Đa Nung B, Đạ Đờn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0006','Nguyễn Thị Hoàng Trân','hoangtran','GV1','1988-12-02','Huế','068188012742','2022-07-24','8745374943','250752066','6812007417','0949385443','5404205340470','hoangtran0589@gmail.com',NULL,'Tân Đức, Tân Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0007','Hoàng Thị Phượng','huongphuong','GV1','1997-06-15','Nghệ An','040197017957','2021-10-02',NULL,NULL,'6823005707','0966471596','15150688 (MB)','hoangthiphuong257@gmail.com',NULL,'TDP B\'Nông Rết, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0008','Bùi Thị Kim Oanh','kimoanh','GV1','1992-10-08','Quảng Ngãi','068300009599','2021-08-12',NULL,NULL,NULL,'0886904044',NULL,NULL,NULL,'Thôn An Phước, Phú Sơn, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0009','Nguyễn Thanh Huyền','thanhhuyen','GV1','1999-12-29','Hà Nội','001199035999','2021-10-02',NULL,NULL,NULL,'0335551673','21124857 (ACB)',NULL,NULL,'Thôn 5, Đạ Đờn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0010','Cil K\' Si Ra','ksira','GV1','2001-03-15','Lâm Đồng','068301008967','2023-09-08',NULL,'251284559','6822818134','0837045172','237128686 (MB)','ck.sira.m24g@sptwnt.edu.vn',NULL,'TDP B\'Nông Rết, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0011','Phan Thị Thanh Tuyền','thanhtuyen','GV1','1996-08-29','Huế','068196007072','2021-08-12',NULL,'250147020','6821310671','0364937896','5404205334990','thanhtuyencdspdalat@gmail.com','O','xóm 1, Hòa lạc, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0012','Hồ Ngọc Anh Thơ','anhtho','GV2','2000-04-03','Quảng Ngãi','068300009599','2021-08-12',NULL,NULL,'102430798','0886904044','1024307198  (VCB)',NULL,NULL,'415, Kim Phát, Bình Thạnh, Đức Trọng, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0013','Nguyễn Thị Hàn','hannguyen','GV2','1975-10-01','Nghệ An','042175005932','2023-04-01','8737606950','250937013','6821785015','0386708472',NULL,NULL,NULL,'xóm 3a, Quảng Đức, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0014','Nguyễn Thị Hằng','hangnguyen','GV2','1970-10-01','Hà Nội','001170051212','2021-12-27','8675993873','251311013',NULL,'0943608725',NULL,NULL,NULL,'Tân Lin,  Tân Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0015','Đặng Ngọc Ba','ngocba','GV2','1950-01-01','Bình Định','068050001935',NULL,NULL,'250581651',NULL,'0384251521',NULL,NULL,NULL,'xóm 4a, Quảng Đức, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0016','Nguyễn Trọng Hùng','tronghung','GV2','1987-09-10','Hà Tĩnh','042087002690','2021-04-25',NULL,'250581651',NULL,'0384251521','64610000306574','BIDV',NULL,'xóm 4a, Quảng Đức, Đinh Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0017','Trần Thị Thắm','thamtran','GV2','1998-05-08','Đắc Lăk','066198015174','2023-08-22',NULL,'251393684','5220248477','0976322523','0441000794759','leluan280796@gmail.com',NULL,'Tân Tiến, Đạ Đờn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('GV0018','Phạm Thị Ngọc Phượng','ngocphuong','GV2','1991-11-28','Lâm Đồng','068191009504','2022-05-24',NULL,NULL,'6823208871','0354478379','0220190795818','Ngocphuongkl@gmail.com',NULL,'Tân Lập, Tân Văn, Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active');
/*!40000 ALTER TABLE `giaovien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giaovien_score`
--

DROP TABLE IF EXISTS `giaovien_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaovien_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_tk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chuc_vu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `translate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `score` int DEFAULT NULL,
  `thang_nam` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `diem_td` decimal(5,2) DEFAULT NULL,
  `diem_cm` decimal(5,2) DEFAULT NULL,
  `diem_ht` decimal(5,2) DEFAULT NULL,
  `diem_at` decimal(5,2) DEFAULT NULL,
  `diem_bt` decimal(5,2) DEFAULT NULL,
  `diem_cs` decimal(5,2) DEFAULT NULL,
  `diem_sk` decimal(5,2) DEFAULT NULL,
  `diem_pt` decimal(5,2) DEFAULT NULL,
  `diem_px` decimal(5,2) DEFAULT NULL,
  `diem_ut` decimal(5,2) DEFAULT NULL,
  `tong_diem` decimal(5,2) DEFAULT NULL,
  `xep_loai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ghi_chu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ten_tk` (`ten_tk`),
  CONSTRAINT `giaovien_score_ibfk_1` FOREIGN KEY (`ten_tk`) REFERENCES `tk` (`ten_tk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaovien_score`
--

LOCK TABLES `giaovien_score` WRITE;
/*!40000 ALTER TABLE `giaovien_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `giaovien_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocsinh`
--

DROP TABLE IF EXISTS `hocsinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocsinh` (
  `ma_hs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` enum('Nam','Nữ') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dan_toc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ma_dinh_danh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_ten_bo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nghe_nghiep_bo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_ten_me` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nghe_nghiep_me` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cccd_bo_me` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sdt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dia_chi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ma_lop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nam_hoc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trang_thai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'active',
  PRIMARY KEY (`ma_hs`),
  KEY `ma_lop` (`ma_lop`),
  CONSTRAINT `hocsinh_ibfk_1` FOREIGN KEY (`ma_lop`) REFERENCES `ds_lop` (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocsinh`
--

LOCK TABLES `hocsinh` WRITE;
/*!40000 ALTER TABLE `hocsinh` DISABLE KEYS */;
/*!40000 ALTER TABLE `hocsinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocsinh_backup`
--

DROP TABLE IF EXISTS `hocsinh_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocsinh_backup` (
  `ma_hs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ma_gv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ma_lop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `dan_toc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ma_dinh_danh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_ten_bo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nghe_nghiep_bo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_ten_me` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nghe_nghiep_me` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cccd_bo_me` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sdt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gioi_tinh` enum('Nam','N?') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ma_hs`),
  KEY `ma_lop` (`ma_lop`),
  KEY `idx_hocsinh_ma_gv` (`ma_gv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocsinh_backup`
--

LOCK TABLES `hocsinh_backup` WRITE;
/*!40000 ALTER TABLE `hocsinh_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `hocsinh_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_ten_tk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `target_staff_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `target_table` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,NULL,NULL,'tk','Added new user \'ngocngoan\' with role \'user\'',NULL,'2025-08-02 13:35:54','2025-08-02 13:35:54',NULL),(2,'kimnhung','GV0001','giaovien','Added GV staff Quách Ngọc Ngoan',NULL,'2025-08-02 13:36:25','2025-08-02 13:36:25',NULL),(3,'kimnhung','ngocngoan','tk','Changed password',NULL,'2025-08-02 15:33:36','2025-08-02 15:33:36',NULL),(4,'kimnhung','thanhtuyen','tk','Changed password',NULL,'2025-08-03 06:15:24','2025-08-03 06:15:24',NULL);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop_gv`
--

DROP TABLE IF EXISTS `lop_gv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop_gv` (
  `ma_lop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ma_gv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vai_tro` enum('GVCN','Bộ môn','Bảo mẫu') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Bộ môn',
  `nam_hoc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_phan_cong` date DEFAULT (curdate()),
  PRIMARY KEY (`ma_lop`,`ma_gv`),
  KEY `ma_gv` (`ma_gv`),
  CONSTRAINT `lop_gv_ibfk_1` FOREIGN KEY (`ma_lop`) REFERENCES `ds_lop` (`ma_lop`),
  CONSTRAINT `lop_gv_ibfk_2` FOREIGN KEY (`ma_gv`) REFERENCES `giaovien` (`ma_gv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop_gv`
--

LOCK TABLES `lop_gv` WRITE;
/*!40000 ALTER TABLE `lop_gv` DISABLE KEYS */;
/*!40000 ALTER TABLE `lop_gv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phan_lop`
--

DROP TABLE IF EXISTS `phan_lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phan_lop` (
  `ma_hs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ma_lop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nam_hoc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_phan` date DEFAULT (curdate()),
  PRIMARY KEY (`ma_hs`),
  KEY `ma_lop` (`ma_lop`),
  CONSTRAINT `phan_lop_ibfk_1` FOREIGN KEY (`ma_hs`) REFERENCES `hocsinh` (`ma_hs`),
  CONSTRAINT `phan_lop_ibfk_2` FOREIGN KEY (`ma_lop`) REFERENCES `ds_lop` (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phan_lop`
--

LOCK TABLES `phan_lop` WRITE;
/*!40000 ALTER TABLE `phan_lop` DISABLE KEYS */;
/*!40000 ALTER TABLE `phan_lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `team` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `count` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoigianmoepa`
--

DROP TABLE IF EXISTS `thoigianmoepa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thoigianmoepa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_tk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_day` int NOT NULL,
  `close_day` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `make_epa_gv` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'no',
  `make_epa_tgv` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'no',
  `make_epa_all` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'no',
  `phase1_start` int DEFAULT NULL,
  `phase1_end` int DEFAULT NULL,
  `phase2_start` int DEFAULT NULL,
  `phase2_end` int DEFAULT NULL,
  `phase3_start` int DEFAULT NULL,
  `phase3_end` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoigianmoepa`
--

LOCK TABLES `thoigianmoepa` WRITE;
/*!40000 ALTER TABLE `thoigianmoepa` DISABLE KEYS */;
INSERT INTO `thoigianmoepa` VALUES (1,'ngocngoan',1,5,8,2025,'','yes','no','no',1,5,26,27,28,30,'2025-08-02 13:54:27'),(2,'kimnhung',1,5,8,2025,'','yes','no','no',1,5,6,10,28,30,'2025-08-02 13:58:37'),(3,'thanhtuyen',1,7,8,2025,'','yes','no','no',1,7,26,27,28,30,'2025-08-03 06:14:47');
/*!40000 ALTER TABLE `thoigianmoepa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tk`
--

DROP TABLE IF EXISTS `tk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tk` (
  `ten_tk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nhom` enum('admin','user','supervisor') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ngay_tao` date DEFAULT (curdate()),
  `nguoi_tao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_hh` date DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chuc_vu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sdt` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dia_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cccd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngay_vao_lam` date DEFAULT NULL,
  `luong_co_ban` decimal(15,2) DEFAULT NULL,
  `phu_cap` decimal(15,2) DEFAULT NULL,
  `tong_luong` decimal(15,2) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'active',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'user',
  PRIMARY KEY (`ten_tk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tk`
--

LOCK TABLES `tk` WRITE;
/*!40000 ALTER TABLE `tk` DISABLE KEYS */;
INSERT INTO `tk` VALUES ('admin','admin','scrypt:32768:8:1$HhkGxlkkMqAfpk0k$16c91ae47fcd5d6c4f4a4f7c5a7c6e7b8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0','2025-08-02','system',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('administrator','admin','scrypt:32768:8:1$85lyZTwYscM9BRUZ$0aa62d223d201aef1529c8b914f504cb2a71af54339f55c30af95bd8f1bf6f4c5d3df6e67961a26322cb70df58dd5724f1a78af98d0ad67f74ac0cefab175015','2025-08-02','system',NULL,NULL,'Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('anhtho','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('hangnguyen','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('hannguyen','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('hoangtran','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('huongphuong','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('kdien','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('kimnhung','admin','scrypt:32768:8:1$85lyZTwYscM9BRUZ$0aa62d223d201aef1529c8b914f504cb2a71af54339f55c30af95bd8f1bf6f4c5d3df6e67961a26322cb70df58dd5724f1a78af98d0ad67f74ac0cefab175015','2025-08-02','system',NULL,NULL,'Kim Nhung',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('kimoanh','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ksira','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocba','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocngoan','user','scrypt:32768:8:1$q0rQiwoqTPQ1dCX5$576ae60b8615b7896557d69c1493acea6192b5a9b9618d12152a195f4ab7974f541e21f0926861e7de8e72fb988d7807d5cab6777f3e9f82b3664ce18a3801ee','2025-08-02','kimnhung','2025-10-31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocnguyen','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocphuong','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocquy','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('thamtran','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('thanhhuyen','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('thanhtuyen','user','scrypt:32768:8:1$FsOuQ3MBQfPidmh2$4f9e9e1dbd782b46ccd145c9456339cc1723a66ff80fc6b556af047e2fcb8a8c06e7323d0aef8fc8f994db12613424716b58d49f5814ac6c599cd1d420b2d9ab','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('thuuyen','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('tronghung','user','abc123','2025-08-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user');
/*!40000 ALTER TABLE `tk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tongdiem_epa`
--

DROP TABLE IF EXISTS `tongdiem_epa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tongdiem_epa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_tk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ho_va_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chuc_vu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `user_total_score` int DEFAULT '0',
  `sup_total_score` int DEFAULT '0',
  `pri_total_score` int DEFAULT NULL,
  `pri_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `pri_updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pri_updated_at` datetime DEFAULT NULL,
  `xeploai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ten_tk` (`ten_tk`),
  CONSTRAINT `tongdiem_epa_ibfk_1` FOREIGN KEY (`ten_tk`) REFERENCES `tk` (`ten_tk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tongdiem_epa`
--

LOCK TABLES `tongdiem_epa` WRITE;
/*!40000 ALTER TABLE `tongdiem_epa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tongdiem_epa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'quanlytruonghoc_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-03  7:38:33
