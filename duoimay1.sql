-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangdanhgia`
--

LOCK TABLES `bangdanhgia` WRITE;
/*!40000 ALTER TABLE `bangdanhgia` DISABLE KEYS */;
INSERT INTO `bangdanhgia` VALUES (15,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Bạn đảm bảo giờ công, ngày công, tác phong theo quy định không? Bạn có sử dụng điện thoại làm việc riêng không? Bạn có tạo được sự đoàn kết trong nội bộ không ?','','',10,'',10,'2025-08-15 17:28:31'),(16,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Bạn thực hiện và dạy trẻ chào hỏi lễ phép theo quy trình chưa ? Bạn thực hiện điểm danh trẻ vào buổi sáng chưa ?','','',4,'',4,'2025-08-15 17:28:31'),(17,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Trẻ lớp bạn thực hiện tốt đội hình đội ngũ, hiệu lệnh và động lệnh chưa? Bạn và trẻ tập thể dục sáng đúng động tác và đúng nhịp nhạc không ?','','',2,'',2,'2025-08-15 17:28:31'),(18,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Bạn dạy trẻ như thế nào? (đảm bảo quy trình, giáo cụ, trẻ thực hiện được hiệu lệnh giờ học, trả lời đúng cách) chưa? Trẻ nhớ nội dung bài học, trẻ có kỷ năng thông qua đề tài bạn đã dạy không? Bạn trợ giảng đúng cách chưa? Bạn có dạy trẻ nói lời yêu thương, xin lỗi và được tôn trọng không ?','','',3,'',3,'2025-08-15 17:28:31'),(19,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Trẻ lớp bạn nhớ tên góc chơi, nội dung chơi, tên đồ chơi, cách chơi, sử dụng và bảo quản đồ chơi chưa? Bạn có bổ sung đồ dùng đồ chơi mới cho chủ đề không? Bạn đã chơi cùng trẻ và gợi ý nội dung chơi cho trẻ không ?','','',3,'',3,'2025-08-15 17:28:31'),(20,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Bạn thường xuyên tổ chức hoạt động ngoài trời không? Bạn có đồ dùng giáo cụ, nội dung tổ chức không? Trẻ của bạn có an toàn và cất đồ chơi ngoài trời đúng chổ chứ ?','','',5,'',5,'2025-08-15 17:28:31'),(21,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Trong giờ ăn uống trẻ biết xếp hàng chờ lần lượt, biết xin bằng hai tay và nói lời cảm ơn không? Trẻ biết tên món ăn (sữa) và ăn hết xuất không? Đồ dùng có đầy đủ và vệ sinh giờ ăn của bạn có sạch sẽ không? Trẻ của bạn có được rửa tay trước khi ăn và đánh răng lau mặt sau khi ăn không? Tháng qua bạn có trẻ đứng và sụt cân không ?','','',9,'',9,'2025-08-15 17:28:31'),(22,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Con được hít thở điều hòa hơi thở trước khi ngủ không? Đủ đồ dùng giấc ngủ và con ngủ đúng tư thế không ?','','',10,'',10,'2025-08-15 17:28:31'),(23,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Con được cô chấp nhận và yêu thương khi đi vệ sinh không? Trang phục, mặt mũi, tóc tai của con có sạch sẽ và phù hợp không? Dụng cụ vệ sinh chung và đồ dùng cá nhân của con có để đúng chổ, dùng đúng cách và sắp xếp gọn gàng không? Nhà vệ sinh của trẻ khô ráo không? Rác cuối ngày bạn xử lý tốt không? Bạn tiết kiệm điện nước chứ ?','','',15,'',15,'2025-08-15 17:28:31'),(24,'hoangphuong','Hoàng Thị Phượng','TGV1','1997-06-15',2025,8,'Sổ LLĐT của con cập nhật thường xuyên không ? HSSS, thi đua, bài tập CM bạn làm tốt chứ ? Trẻ bạn đi học đều không ? Nếu không bạn thăm hỏi chưa? Bạn có thông tin phụ huynh phản ánh về trường không? Phụ huynh bạn có yêu cầu xem camera không ? Thiết bị sử dụng của bạn có hư hỏng không? Lớp bạn có HS nghỉ học không ?','','',9,'',9,'2025-08-15 17:28:31'),(25,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Bạn đảm bảo giờ công, ngày công, tác phong theo quy định không? Bạn có sử dụng điện thoại làm việc riêng không? Bạn có tạo được sự đoàn kết trong nội bộ không ?','','',9,'',9,'2025-08-15 14:46:22'),(26,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Bạn thực hiện và dạy trẻ chào hỏi lễ phép theo quy trình chưa ? Bạn thực hiện điểm danh trẻ vào buổi sáng chưa ?','','',4,'',4,'2025-08-15 14:46:22'),(27,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Trẻ lớp bạn thực hiện tốt đội hình đội ngũ, hiệu lệnh và động lệnh chưa? Bạn và trẻ tập thể dục sáng đúng động tác và đúng nhịp nhạc không ?','','',4,'',4,'2025-08-15 14:46:22'),(28,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Bạn dạy trẻ như thế nào? (đảm bảo quy trình, giáo cụ, trẻ thực hiện được hiệu lệnh giờ học, trả lời đúng cách) chưa? Trẻ nhớ nội dung bài học, trẻ có kỷ năng thông qua đề tài bạn đã dạy không? Bạn trợ giảng đúng cách chưa? Bạn có dạy trẻ nói lời yêu thương, xin lỗi và được tôn trọng không ?','','',9,'',9,'2025-08-15 14:46:22'),(29,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Trẻ lớp bạn nhớ tên góc chơi, nội dung chơi, tên đồ chơi, cách chơi, sử dụng và bảo quản đồ chơi chưa? Bạn có bổ sung đồ dùng đồ chơi mới cho chủ đề không? Bạn đã chơi cùng trẻ và gợi ý nội dung chơi cho trẻ không ?','','',9,'',9,'2025-08-15 14:46:22'),(30,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Bạn thường xuyên tổ chức hoạt động ngoài trời không? Bạn có đồ dùng giáo cụ, nội dung tổ chức không? Trẻ của bạn có an toàn và cất đồ chơi ngoài trời đúng chổ chứ ?','','',9,'',9,'2025-08-15 14:46:22'),(31,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Trong giờ ăn uống trẻ biết xếp hàng chờ lần lượt, biết xin bằng hai tay và nói lời cảm ơn không? Trẻ biết tên món ăn (sữa) và ăn hết xuất không? Đồ dùng có đầy đủ và vệ sinh giờ ăn của bạn có sạch sẽ không? Trẻ của bạn có được rửa tay trước khi ăn và đánh răng lau mặt sau khi ăn không? Tháng qua bạn có trẻ đứng và sụt cân không ?','','',9,'',9,'2025-08-15 14:46:22'),(32,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Con được hít thở điều hòa hơi thở trước khi ngủ không? Đủ đồ dùng giấc ngủ và con ngủ đúng tư thế không ?','','',10,'',10,'2025-08-15 14:46:22'),(33,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Con được cô chấp nhận và yêu thương khi đi vệ sinh không? Trang phục, mặt mũi, tóc tai của con có sạch sẽ và phù hợp không? Dụng cụ vệ sinh chung và đồ dùng cá nhân của con có để đúng chổ, dùng đúng cách và sắp xếp gọn gàng không? Nhà vệ sinh của trẻ khô ráo không? Rác cuối ngày bạn xử lý tốt không? Bạn tiết kiệm điện nước chứ ?','','',9,'',9,'2025-08-15 14:46:22'),(34,'thanhtuyen','Phan Thị Thanh Tuyền','GV1','1996-08-29',2025,8,'Sổ LLĐT của con cập nhật thường xuyên không ? HSSS, thi đua, bài tập CM bạn làm tốt chứ ? Trẻ bạn đi học đều không ? Nếu không bạn thăm hỏi chưa? Bạn có thông tin phụ huynh phản ánh về trường không? Phụ huynh bạn có yêu cầu xem camera không ? Thiết bị sử dụng của bạn có hư hỏng không? Lớp bạn có HS nghỉ học không ?','','',9,'',9,'2025-08-15 14:46:22');
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
INSERT INTO `cauhoi_epa` VALUES (1,'Bạn đảm bảo giờ công, ngày công, tác phong theo quy định không? Bạn có sử dụng điện thoại làm việc riêng không? Bạn có tạo được sự đoàn kết trong nội bộ không ?','',10),(2,'Bạn thực hiện và dạy trẻ chào hỏi lễ phép theo quy trình chưa ? Bạn thực hiện điểm danh trẻ vào buổi sáng chưa ?','',5),(3,'Trẻ lớp bạn thực hiện tốt đội hình đội ngũ, hiệu lệnh và động lệnh chưa? Bạn và trẻ tập thể dục sáng đúng động tác và đúng nhịp nhạc không ?','',5),(4,'Bạn dạy trẻ như thế nào? (đảm bảo quy trình, giáo cụ, trẻ thực hiện được hiệu lệnh giờ học, trả lời đúng cách) chưa? Trẻ nhớ nội dung bài học, trẻ có kỷ năng thông qua đề tài bạn đã dạy không? Bạn trợ giảng đúng cách chưa? Bạn có dạy trẻ nói lời yêu thương, xin lỗi và được tôn trọng không ?','',10),(5,'Trẻ lớp bạn nhớ tên góc chơi, nội dung chơi, tên đồ chơi, cách chơi, sử dụng và bảo quản đồ chơi chưa? Bạn có bổ sung đồ dùng đồ chơi mới cho chủ đề không? Bạn đã chơi cùng trẻ và gợi ý nội dung chơi cho trẻ không ?','',10),(6,'Bạn thường xuyên tổ chức hoạt động ngoài trời không? Bạn có đồ dùng giáo cụ, nội dung tổ chức không? Trẻ của bạn có an toàn và cất đồ chơi ngoài trời đúng chổ chứ ?','',10),(7,'Trong giờ ăn uống trẻ biết xếp hàng chờ lần lượt, biết xin bằng hai tay và nói lời cảm ơn không? Trẻ biết tên món ăn (sữa) và ăn hết xuất không? Đồ dùng có đầy đủ và vệ sinh giờ ăn của bạn có sạch sẽ không? Trẻ của bạn có được rửa tay trước khi ăn và đánh răng lau mặt sau khi ăn không? Tháng qua bạn có trẻ đứng và sụt cân không ?','',10),(8,'Con được hít thở điều hòa hơi thở trước khi ngủ không? Đủ đồ dùng giấc ngủ và con ngủ đúng tư thế không ?','',10),(9,'Con được cô chấp nhận và yêu thương khi đi vệ sinh không? Trang phục, mặt mũi, tóc tai của con có sạch sẽ và phù hợp không? Dụng cụ vệ sinh chung và đồ dùng cá nhân của con có để đúng chổ, dùng đúng cách và sắp xếp gọn gàng không? Nhà vệ sinh của trẻ khô ráo không? Rác cuối ngày bạn xử lý tốt không? Bạn tiết kiệm điện nước chứ ?','',20),(10,'Sổ LLĐT của con cập nhật thường xuyên không ? HSSS, thi đua, bài tập CM bạn làm tốt chứ ? Trẻ bạn đi học đều không ? Nếu không bạn thăm hỏi chưa? Bạn có thông tin phụ huynh phản ánh về trường không? Phụ huynh bạn có yêu cầu xem camera không ? Thiết bị sử dụng của bạn có hư hỏng không? Lớp bạn có HS nghỉ học không ?','',10);
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
INSERT INTO `ds_lop` VALUES ('Bee','Bee',NULL,NULL,0,NULL),('Bird 1','Bird 1',NULL,NULL,0,NULL),('Bird 2','Bird 2',NULL,NULL,0,NULL),('Cat','Cat',NULL,NULL,0,NULL),('Pig','Pig',NULL,NULL,0,NULL),('Tiger 1','Tiger 1',NULL,NULL,0,NULL),('Tiger 2','Tiger 2',NULL,NULL,0,NULL);
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
INSERT INTO `giaovien` VALUES ('NS0001','Đặng Thị Kim Nhung','kimnhung','HT','1982-03-06','Gia Lai','068182012582','2021-08-12','5801208827',NULL,'4207000877','0976896384','5404215007578','dangthikimnhung82@gmail.com','O','xóm 4a, Quảng Đức, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0002','Đặng Thị Ngọc Qúy','ngocquy','PHT','1986-11-12','Gia Lai','068186008915','2021-08-12','8052739893',NULL,'6810000069','0345370570','5404205048499','ngocquy121186@gmail.com','O','xóm 4a, Quảng Đức, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0003','Nguyễn Thị Hoàng Trân','hoangtran','GV1','1988-12-02','Huế','068188012742','2022-07-24','8745374943',NULL,'6812007417','0949385443','5404205340470','hoangtran0589@gmail.com',NULL,'Thôn Tân Đức, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0004','Hoàng Thị Phượng','hoangphuong','TGV1','1997-06-15','Nghệ An','040197017957','2021-10-02',NULL,NULL,'6823005707','0966471596','15150688 (MB)','hoangthiphuong257@gmail.com',NULL,'Thôn B\'Nông Rết, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0005','Phan Thị Thanh Tuyền','thanhtuyen','GV1','1996-08-29','Huế','068196007072','2021-08-12',NULL,NULL,'6821310671','0364937896','5404205424781','thanhtuyencdspdalat@gmail.com',NULL,'xóm 1, Hòa lạc, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0006','Đoàn Thị Huyền','doanhuyen','GV1','2001-10-02','Hà Nội','068301006296','2021-06-28',NULL,NULL,NULL,'0777686001','07777686001(MB)','doanthihuyen0210@gmail.com',NULL,'Thôn Gia Thạnh, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0007','Huỳnh Trương Dạ Thảo','dathao','GV1','1998-12-25','Quảng Ngãi','068198011242','2022-07-18',NULL,NULL,NULL,'0389102366','008704070026764','huynhtruongdathao@gmail.com',NULL,'Thôn Đồng Tâm,  xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0008','Võ Thị Ngọc Yến','ngocyen','GV1','1998-08-23','Quảng Ngãi','051198010024','2022-02-16',NULL,NULL,NULL,'0382789374','060278213131 (SCB)','Vothingocyen230818@gmail.com',NULL,'Thôn Sơn Hà, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0009','Đinh Thị Bích Hiệp','bichhiep','GV1','1990-03-04','Hà Nội','068190009457','2021-06-28',NULL,NULL,NULL,'0948434487',NULL,NULL,NULL,'Thôn Mỹ Đức, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0010','Nguyễn Thị Cẩm Hạnh','camhanh','GV1','2004-11-11','Gia Lai','068304003899','2021-08-12',NULL,NULL,NULL,'0347546836',NULL,NULL,NULL,'Thôn Sê Nhắc, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0011','Nguyễn Thị Thảo','nguyenthao','GV2','1991-11-20','Gia Lai','052191014281','2022-02-10',NULL,NULL,NULL,'0986955026','65026805(VP Bank)','nguyenthao20111991@gmail.com','O','Thôn B\'Nông Rết, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0012','Nguyễn Thị Thủy','nguyenthuy','TGV2','1996-03-26','Hà Tĩnh','042196013882','2021-08-12',NULL,NULL,NULL,'0826689922','64610000243510 (BIDV)',NULL,NULL,'Thôn Tân Lập, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0013','Nguyễn Thị Hàn','nguyenhan','GV2','1975-10-01','Nghệ An','042175005932','2023-04-01','8737606950',NULL,'6821785015','0386708472','0845785247 (MB)',NULL,NULL,'xóm 3a, Thôn Quảng Đức, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0014','Nguyễn Thị Hằng','nguyenhang','GV2','1970-10-01','Hà Nội','001170051212','2021-12-27','8675993873',NULL,NULL,'0943608725',NULL,NULL,NULL,'Tân Lin,  xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0015','Đặng Ngọc Ba','ngocba','GV2','1950-01-01','Gia Lai','068050001935',NULL,NULL,NULL,NULL,'0384251521',NULL,NULL,NULL,'xóm 4a, Quảng Đức, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active'),('NS0016','Nguyễn Trọng Hùng','tronghung','GV2','1987-09-10','Hà Tĩnh','042087002690','2021-04-25',NULL,NULL,NULL,NULL,'64610000306574 (BIDV)',NULL,NULL,'xóm 4a, Quảng Đức, xã Đinh Văn Lâm Hà, Lâm Đồng',NULL,NULL,NULL,NULL,NULL,'active');
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,NULL,NULL,'tk','Added new user \'ngocngoan\' with role \'user\'',NULL,'2025-08-02 13:35:54','2025-08-02 13:35:54',NULL),(7,NULL,NULL,'tk','Updated role for \'ksira\' to \'supervisor\'',NULL,'2025-08-04 03:12:12','2025-08-04 03:12:12',NULL),(9,NULL,NULL,'tk','Updated role for \'ngocngoan\' to \'supervisor\'',NULL,'2025-08-05 09:35:22','2025-08-05 09:35:22',NULL),(12,NULL,NULL,'tk','Deleted user \'anhtho\' and related data by kimnhung',NULL,'2025-08-05 15:30:09','2025-08-05 15:30:09',NULL),(13,NULL,NULL,'tk','Deleted user \'hangnguyen\' and related data by kimnhung',NULL,'2025-08-05 15:30:14','2025-08-05 15:30:14',NULL),(14,NULL,NULL,'tk','Deleted user \'hannguyen\' and related data by kimnhung',NULL,'2025-08-05 15:30:21','2025-08-05 15:30:21',NULL),(15,NULL,NULL,'tk','Deleted user \'hoangtran\' and related data by kimnhung',NULL,'2025-08-05 15:30:28','2025-08-05 15:30:28',NULL),(16,NULL,NULL,'tk','Deleted user \'huongphuong\' and related data by kimnhung',NULL,'2025-08-05 15:30:34','2025-08-05 15:30:34',NULL),(17,NULL,NULL,'tk','Deleted user \'kdien\' and related data by kimnhung',NULL,'2025-08-05 15:30:41','2025-08-05 15:30:41',NULL),(18,NULL,NULL,'tk','Deleted user \'ksira\' and related data by kimnhung',NULL,'2025-08-05 15:30:47','2025-08-05 15:30:47',NULL),(19,NULL,NULL,'tk','Deleted user \'ngocba\' and related data by kimnhung',NULL,'2025-08-05 15:30:53','2025-08-05 15:30:53',NULL),(20,NULL,NULL,'tk','Deleted user \'kimoanh\' and related data by kimnhung',NULL,'2025-08-05 15:31:00','2025-08-05 15:31:00',NULL),(21,NULL,NULL,'tk','Deleted user \'ngocngoan\' and related data by kimnhung',NULL,'2025-08-05 15:31:08','2025-08-05 15:31:08',NULL),(22,NULL,NULL,'tk','Deleted user \'ngocnguyen\' and related data by kimnhung',NULL,'2025-08-05 15:31:14','2025-08-05 15:31:14',NULL),(23,NULL,NULL,'tk','Deleted user \'ngocphuong\' and related data by kimnhung',NULL,'2025-08-05 15:31:21','2025-08-05 15:31:21',NULL),(24,NULL,NULL,'tk','Deleted user \'ngocquy\' and related data by kimnhung',NULL,'2025-08-05 15:31:27','2025-08-05 15:31:27',NULL),(25,NULL,NULL,'tk','Deleted user \'thamtran\' and related data by kimnhung',NULL,'2025-08-05 15:31:33','2025-08-05 15:31:33',NULL),(26,NULL,NULL,'tk','Deleted user \'thanhhuyen\' and related data by kimnhung',NULL,'2025-08-05 15:31:37','2025-08-05 15:31:37',NULL),(27,NULL,NULL,'tk','Deleted user \'thanhtuyen\' and related data by kimnhung',NULL,'2025-08-05 15:31:44','2025-08-05 15:31:44',NULL),(28,NULL,NULL,'tk','Deleted user \'thuuyen\' and related data by kimnhung',NULL,'2025-08-05 15:31:50','2025-08-05 15:31:50',NULL),(29,NULL,NULL,'tk','Deleted user \'tronghung\' and related data by kimnhung',NULL,'2025-08-05 15:31:55','2025-08-05 15:31:55',NULL),(30,NULL,NULL,'tk','Deleted user \'ngocphuong\' and related data by kimnhung',NULL,'2025-08-12 13:33:10','2025-08-12 13:33:10',NULL),(31,NULL,NULL,'tk','Deleted user \'ngocquy\' and related data by kimnhung',NULL,'2025-08-12 13:33:16','2025-08-12 13:33:16',NULL),(32,NULL,NULL,'tk','Deleted user \'ngocyen\' and related data by kimnhung',NULL,'2025-08-12 13:33:25','2025-08-12 13:33:25',NULL),(33,NULL,NULL,'tk','Deleted user \'nguyenhan\' and related data by kimnhung',NULL,'2025-08-12 13:33:30','2025-08-12 13:33:30',NULL),(34,NULL,NULL,'tk','Deleted user \'nguyenhang\' and related data by kimnhung',NULL,'2025-08-12 13:33:36','2025-08-12 13:33:36',NULL),(35,NULL,NULL,'tk','Deleted user \'nguyenthao\' and related data by kimnhung',NULL,'2025-08-12 13:33:41','2025-08-12 13:33:41',NULL),(36,NULL,NULL,'tk','Deleted user \'nguyenthuy\' and related data by kimnhung',NULL,'2025-08-12 13:33:45','2025-08-12 13:33:45',NULL),(37,NULL,NULL,'tk','Deleted user \'thamtran\' and related data by kimnhung',NULL,'2025-08-12 13:33:50','2025-08-12 13:33:50',NULL),(38,NULL,NULL,'tk','Deleted user \'thanhhuyen\' and related data by kimnhung',NULL,'2025-08-12 13:33:54','2025-08-12 13:33:54',NULL),(39,NULL,NULL,'tk','Deleted user \'thanhtuyen\' and related data by kimnhung',NULL,'2025-08-12 13:33:59','2025-08-12 13:33:59',NULL),(40,NULL,NULL,'tk','Deleted user \'thanhutuyen\' and related data by kimnhung',NULL,'2025-08-12 13:34:05','2025-08-12 13:34:05',NULL),(41,NULL,NULL,'tk','Deleted user \'thuuyen\' and related data by kimnhung',NULL,'2025-08-12 13:34:10','2025-08-12 13:34:10',NULL),(42,NULL,NULL,'tk','Deleted user \'tronghung\' and related data by kimnhung',NULL,'2025-08-12 13:34:15','2025-08-12 13:34:15',NULL),(43,NULL,NULL,'tk','Deleted user \'ngocnguyen\' and related data by kimnhung',NULL,'2025-08-12 13:34:20','2025-08-12 13:34:20',NULL),(44,NULL,NULL,'tk','Deleted user \'ngocba\' and related data by kimnhung',NULL,'2025-08-12 13:34:25','2025-08-12 13:34:25',NULL),(45,NULL,NULL,'tk','Deleted user \'ksira\' and related data by kimnhung',NULL,'2025-08-12 13:34:29','2025-08-12 13:34:29',NULL),(46,NULL,NULL,'tk','Deleted user \'kimoanh\' and related data by kimnhung',NULL,'2025-08-12 13:34:34','2025-08-12 13:34:34',NULL),(47,NULL,NULL,'tk','Deleted user \'kimnhung\' and related data by kimnhung',NULL,'2025-08-12 13:34:39','2025-08-12 13:34:39',NULL),(48,NULL,NULL,'tk','Deleted user \'kdien\' and related data by kimnhung',NULL,'2025-08-12 13:34:44','2025-08-12 13:34:44',NULL),(49,NULL,NULL,'tk','Deleted user \'huongphuong\' and related data by kimnhung',NULL,'2025-08-12 13:34:49','2025-08-12 13:34:49',NULL),(50,NULL,NULL,'tk','Deleted user \'hoangtran\' and related data by kimnhung',NULL,'2025-08-12 13:34:53','2025-08-12 13:34:53',NULL),(51,NULL,NULL,'tk','Deleted user \'hoangphuong\' and related data by kimnhung',NULL,'2025-08-12 13:34:58','2025-08-12 13:34:58',NULL),(52,NULL,NULL,'tk','Deleted user \'hannguyen\' and related data by kimnhung',NULL,'2025-08-12 13:35:03','2025-08-12 13:35:03',NULL),(53,NULL,NULL,'tk','Deleted user \'hangnguyen\' and related data by kimnhung',NULL,'2025-08-12 13:35:09','2025-08-12 13:35:09',NULL),(54,NULL,NULL,'tk','Deleted user \'doanhuyen\' and related data by kimnhung',NULL,'2025-08-12 13:35:13','2025-08-12 13:35:13',NULL),(55,NULL,NULL,'tk','Deleted user \'dathao\' and related data by kimnhung',NULL,'2025-08-12 13:35:18','2025-08-12 13:35:18',NULL),(56,NULL,NULL,'tk','Deleted user \'camhanh\' and related data by kimnhung',NULL,'2025-08-12 13:35:24','2025-08-12 13:35:24',NULL),(57,NULL,NULL,'tk','Deleted user \'bichhiep\' and related data by kimnhung',NULL,'2025-08-12 13:35:30','2025-08-12 13:35:30',NULL),(58,NULL,NULL,'tk','Deleted user \'anhtho\' and related data by kimnhung',NULL,'2025-08-12 13:35:40','2025-08-12 13:35:40',NULL),(59,NULL,NULL,'tk','Updated role for \'hoangphuong\' to \'supervisor\'',NULL,'2025-08-12 13:37:14','2025-08-12 13:37:14',NULL),(60,NULL,NULL,'tk','Updated role for \'kimnhung\' to \'admin\'',NULL,'2025-08-12 13:37:27','2025-08-12 13:37:27',NULL),(61,NULL,NULL,'tk','Updated role for \'nguyenthuy\' to \'supervisor\'',NULL,'2025-08-12 13:37:50','2025-08-12 13:37:50',NULL),(62,'kimnhung','nguyenthuy','tk','Changed password',NULL,'2025-08-12 13:45:06','2025-08-12 13:45:06',NULL),(63,'kimnhung','bichhiep','tk','Changed password',NULL,'2025-08-12 13:47:03','2025-08-12 13:47:03',NULL),(64,'kimnhung','camhanh','tk','Changed password',NULL,'2025-08-12 13:47:46','2025-08-12 13:47:46',NULL),(65,'kimnhung','dathao','tk','Changed password',NULL,'2025-08-12 13:48:19','2025-08-12 13:48:19',NULL),(66,'kimnhung','doanhuyen','tk','Changed password',NULL,'2025-08-12 13:48:45','2025-08-12 13:48:45',NULL),(67,'kimnhung','hoangphuong','tk','Changed password',NULL,'2025-08-12 13:49:05','2025-08-12 13:49:05',NULL),(68,'kimnhung','hoangtran','tk','Changed password',NULL,'2025-08-12 13:52:36','2025-08-12 13:52:36',NULL),(69,'kimnhung','kimnhung','tk','Changed password',NULL,'2025-08-12 13:53:25','2025-08-12 13:53:25',NULL),(70,'kimnhung','ngocquy','tk','Changed password',NULL,'2025-08-12 13:54:04','2025-08-12 13:54:04',NULL),(71,'kimnhung','ngocyen','tk','Changed password',NULL,'2025-08-12 13:54:32','2025-08-12 13:54:32',NULL),(72,'kimnhung','nguyenthao','tk','Changed password',NULL,'2025-08-12 13:55:17','2025-08-12 13:55:17',NULL),(73,'kimnhung','nguyenthuy','tk','Changed password',NULL,'2025-08-12 13:55:40','2025-08-12 13:55:40',NULL),(74,'kimnhung','thanhutuyen','tk','Changed password',NULL,'2025-08-12 13:56:11','2025-08-12 13:56:11',NULL),(75,'kimnhung','NS0005','giaovien','Deleted record NS0005',NULL,'2025-08-12 14:01:25','2025-08-12 14:01:25',NULL),(76,'kimnhung','thanhtuyen','tk','Changed password',NULL,'2025-08-12 14:07:11','2025-08-12 14:07:11',NULL),(77,'administrator','kimnhung','tk','Changed password',NULL,'2025-08-12 14:12:10','2025-08-12 14:12:10',NULL),(78,'kimnhung','hoangphuong','tk','Changed password',NULL,'2025-08-12 14:12:56','2025-08-12 14:12:56',NULL),(79,'kimnhung','nguyenthuy','tk','Changed password',NULL,'2025-08-12 14:19:55','2025-08-12 14:19:55',NULL),(80,'kimnhung','NS0012','giaovien','Cập nhật các trường: Chuc Vu',NULL,'2025-08-12 14:23:24','2025-08-12 14:23:24',NULL),(81,'kimnhung','NS0016','giaovien','Cập nhật các trường: Chuc Vu',NULL,'2025-08-12 14:23:52','2025-08-12 14:23:52',NULL),(82,'kimnhung','bichhiep','tk','Changed password',NULL,'2025-08-12 14:32:11','2025-08-12 14:32:11',NULL),(83,'kimnhung','camhanh','tk','Changed password',NULL,'2025-08-12 14:55:02','2025-08-12 14:55:02',NULL),(84,'kimnhung','dathao','tk','Changed password',NULL,'2025-08-12 14:56:05','2025-08-12 14:56:05',NULL),(85,'administrator','admin','tk','Changed password',NULL,'2025-08-12 14:56:58','2025-08-12 14:56:58',NULL),(86,'kimnhung','doanhuyen','tk','Changed password',NULL,'2025-08-12 14:57:00','2025-08-12 14:57:00',NULL),(87,'kimnhung','hoangtran','tk','Changed password',NULL,'2025-08-12 14:58:30','2025-08-12 14:58:30',NULL),(88,'kimnhung','kimnhung','tk','Changed password',NULL,'2025-08-12 14:59:52','2025-08-12 14:59:52',NULL),(89,NULL,NULL,'tk','Deleted user \'thanhutuyen\' and related data by kimnhung',NULL,'2025-08-12 15:00:15','2025-08-12 15:00:15',NULL),(90,'kimnhung','ngocquy','tk','Changed password',NULL,'2025-08-12 15:00:51','2025-08-12 15:00:51',NULL),(91,'kimnhung','ngocyen','tk','Changed password',NULL,'2025-08-12 15:03:23','2025-08-12 15:03:23',NULL),(92,'kimnhung','nguyenthao','tk','Changed password',NULL,'2025-08-12 15:04:33','2025-08-12 15:04:33',NULL),(93,'kimnhung','thanhtuyen','tk','Changed password',NULL,'2025-08-12 15:06:10','2025-08-12 15:06:10',NULL),(94,'kimnhung','thanhtuyen','tk','Changed password',NULL,'2025-08-12 15:07:24','2025-08-12 15:07:24',NULL),(95,'admin','NS0006','giaovien','Cập nhật các trường: Chuc Vu',NULL,'2025-08-13 05:42:52','2025-08-13 05:42:52',NULL),(96,'admin','NS0006','giaovien','Cập nhật các trường: Chuc Vu',NULL,'2025-08-13 05:43:03','2025-08-13 05:43:03',NULL),(97,'admin','NS0005','giaovien','Cập nhật các trường: Chuc Vu',NULL,'2025-08-13 07:18:52','2025-08-13 07:18:52',NULL),(98,'admin','NS0005','giaovien','Cập nhật các trường: Chuc Vu',NULL,'2025-08-13 07:18:57','2025-08-13 07:18:57',NULL),(99,'admin','thanhtuyen','tk','Changed password',NULL,'2025-08-15 14:43:45','2025-08-15 14:43:45',NULL),(100,'admin','hoangphuong','tk','Changed password',NULL,'2025-08-15 14:44:09','2025-08-15 14:44:09',NULL),(101,'hoangphuong','hoangphuong','bangdanhgia','Gửi kết quả tự đánh giá EPA',NULL,'2025-08-15 14:44:57','2025-08-15 14:44:57',NULL),(102,'thanhtuyen','thanhtuyen','bangdanhgia','Gửi kết quả tự đánh giá EPA',NULL,'2025-08-15 14:46:23','2025-08-15 14:46:23',NULL),(103,'hoangphuong','hoangphuong','bangdanhgia','Gửi kết quả tự đánh giá EPA',NULL,'2025-08-15 17:28:31','2025-08-15 17:28:31',NULL);
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
  `vai_tro` enum('GVCN','Bộ môn','Bảo mẫu','GIÁO VIÊN MẪU GIÁO','GIÁO VIÊN NHÀ TRẺ','NHÂN VIÊN CẤP DƯỠNG') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Bộ môn',
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
INSERT INTO `lop_gv` VALUES ('Bee','NS0011','NHÂN VIÊN CẤP DƯỠNG',NULL,'2025-08-13');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoigianmoepa`
--

LOCK TABLES `thoigianmoepa` WRITE;
/*!40000 ALTER TABLE `thoigianmoepa` DISABLE KEYS */;
INSERT INTO `thoigianmoepa` VALUES (5,'hoangphuong',10,14,8,2025,'','yes','yes','no',10,14,15,27,28,30,'2025-08-12 13:42:19'),(6,'nguyenthuy',20,25,8,2025,'','yes','yes','no',20,25,26,27,28,30,'2025-08-12 13:42:30'),(7,'kimnhung',20,25,8,2025,'','yes','no','yes',20,25,26,27,28,30,'2025-08-12 13:42:53'),(8,'ngocquy',20,25,8,2025,'','yes','no','yes',20,25,26,27,28,30,'2025-08-13 00:30:50'),(9,'thanhtuyen',10,15,8,2025,'','yes','no','no',10,15,16,27,28,30,'2025-08-15 14:43:35');
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
INSERT INTO `tk` VALUES ('admin','admin','scrypt:32768:8:1$UwkzEkOoJLkgby8h$3e44200e47e4448f0a1ef991b1f476e42363408a50b8b0997b2ec4a730adb8e9c8d9bf82757f99ddd4ea01e0691d52a24fdcc5c683e37704aa57cb4fd5df634f','2025-08-02','system',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('administrator','admin','scrypt:32768:8:1$85lyZTwYscM9BRUZ$0aa62d223d201aef1529c8b914f504cb2a71af54339f55c30af95bd8f1bf6f4c5d3df6e67961a26322cb70df58dd5724f1a78af98d0ad67f74ac0cefab175015','2025-08-02','system',NULL,NULL,'Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('bichhiep','user','scrypt:32768:8:1$Iw56Zr59yvilCGBO$01332a7709644a21819e4c50492eff00d5202501010141c589d88a231da0e41a91c126e9f27d4599f19553fd3efc84249e6af34feba43c29fd357d6747790e83','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('camhanh','user','scrypt:32768:8:1$AmA1RR6uNNs3obY9$2ef8462eb4ccdc0fb88bb0be33da7531a4d7e70e41bd73ba67e1b2a2b16b658d81e43fc41c0c1ce3fc5cfd06768cbc3d0919674103849aff98c0852281df7ae0','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('dathao','user','scrypt:32768:8:1$WR3UtY6pJE2xDByK$3d4fcad1817041f2aef2069f38a4e6ef466c8dd08746aa22f3c1343cda917ac03c87a016a86c4eee407664b33acc1328b1f7dd71d96e55e229622e1f92407eed','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('doanhuyen','user','scrypt:32768:8:1$IPe9wW9zfUjeRvzG$7413c8151098f302e70e129fcdb38440f12b7b96e36eb9d10a542c241d070b24b13dbca33819f2da0aaa644ac27eba11f8dc74c023796a9854651fd635906570','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('hoangphuong','supervisor','pbkdf2:sha256:600000$jeERUfF9EvdDM62L$366649223db2e528e65fe884e84090b702cdd6c3fae41e0e991d1d95eea00b7d','2025-08-12',NULL,'2025-11-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('hoangtran','user','scrypt:32768:8:1$p118W0oDDEZ8cfsF$46b8f51d594c309b985d2bf39092bab60316ae03554e8960b79b8b15cedefb163d55bfb0a5875a370209783e539d5a494602f1aee04cda17a6c05bf08ffbd8b3','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('kimnhung','admin','scrypt:32768:8:1$CDIeYYl1CVGJd1NV$856fbaba1d3036dc1b8d7eb0dfa7a41f7598ae012aef3251350a68bcc2b3c753b96c7b58b3feffc1c226b2804361724200be8137e8e83606f2c573917172042a','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocba','user','abc123','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocquy','user','scrypt:32768:8:1$5dF2YSUUNK4xMtAO$948734be4f0ef446ee95632658cdaa5c82f0977a7007d6fa50fdb68c5b17f662ba0ac634c731faf3d7a686b194beac05a7ababc7b548f8fb44cff17ef5c3fc61','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('ngocyen','user','scrypt:32768:8:1$ZMAmzIHgUwefHWhM$2d424c4685eeeaf934d8f5f74d406482db91b9de04eccccc5b932addc3c6fbf33d1dcdbb58a3054abe7321a3ab17beec72b53db3829f319dfe2d737b08ed6f9f','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('nguyenhan','user','abc123','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('nguyenhang','user','abc123','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('nguyenthao','user','scrypt:32768:8:1$FSfbitJvOJTjPmMm$0638e8a341dc4101b0c61fab1e2369405fb900a840db4c29afe5984fa07e80bb511d28bee781a49076ca721b2cf94983420884ebb4b565256117aa3467002317','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('nguyenthuy','supervisor','scrypt:32768:8:1$SP2DPehNGjwmigqr$b0043518b2a1370ed8a7031e12a8037b7bdce5735111f340cb056d65eb9ba9b4981145cc42b8a0dd837a2d4dbe087c3db871c681bc5e538d2b20bdcc44adc8b5','2025-08-12',NULL,'2025-11-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('thanhtuyen','user','pbkdf2:sha256:600000$r3gYN4HcoR8wvIfP$03ae24877c95cad6893e971b8c594c786a3c55eb718dc8f4072404aaf0037ce1','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user'),('tronghung','user','abc123','2025-08-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','user');
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
  UNIQUE KEY `unique_user_month` (`ten_tk`,`year`,`month`),
  KEY `ten_tk` (`ten_tk`),
  CONSTRAINT `tongdiem_epa_ibfk_1` FOREIGN KEY (`ten_tk`) REFERENCES `tk` (`ten_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tongdiem_epa`
--

LOCK TABLES `tongdiem_epa` WRITE;
/*!40000 ALTER TABLE `tongdiem_epa` DISABLE KEYS */;
INSERT INTO `tongdiem_epa` VALUES (2,'hoangphuong',NULL,NULL,2025,8,70,70,NULL,NULL,NULL,NULL,NULL,'2025-08-15 14:44:57'),(3,'thanhtuyen',NULL,NULL,2025,8,81,81,NULL,NULL,NULL,NULL,NULL,'2025-08-15 14:46:23');
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

-- Dump completed on 2025-08-15 18:38:35
