-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: university
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` varchar(8) NOT NULL,
  `faculty_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty1_id_idx` (`faculty_id`),
  CONSTRAINT `faculty1_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('DH19IT01','CNTT'),('DH20IT01','CNTT'),('DH20IT02','CNTT'),('DH20LU01','LUAT'),('DH20LU02','LUAT');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` date NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_idx` (`post_id`),
  KEY `user6_id_idx` (`user_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user6_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_price`
--

DROP TABLE IF EXISTS `credit_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `major_id` varchar(12) NOT NULL,
  `semester_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major4_id_idx` (`major_id`),
  KEY `semester99_id_idx` (`semester_id`),
  CONSTRAINT `major4_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `semester77_id` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_price`
--

LOCK TABLES `credit_price` WRITE;
/*!40000 ALTER TABLE `credit_price` DISABLE KEYS */;
INSERT INTO `credit_price` VALUES (1,400000,'MQPAN','12023'),(11,510000,'MGDTC','12023'),(12,640000,'TCT','12023'),(13,840000,'TH','12023'),(14,750000,'MLUAT','12023'),(15,750000,'MTCNH','12023'),(16,750000,'MKETOAN','12023'),(17,750000,'MKIEMTOAN','12023'),(18,750000,'MNNA','12023'),(20,840000,'MCNTT','12023'),(21,840000,'MHTTTQL','12023'),(22,760000,'MCNSH','12023'),(23,8000000,'MCNSH','12023'),(26,900000,'MNNA','12023'),(27,6000000,'test','12023'),(28,700000,'TCT','12024'),(29,900000,'MCNTT','12024'),(30,800000,'MLUAT','12024'),(31,800000,'MNNA','12024'),(32,450000,'MQPAN','12024');
/*!40000 ALTER TABLE `credit_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_program`
--

DROP TABLE IF EXISTS `education_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(12) DEFAULT NULL,
  `semester_id` varchar(5) DEFAULT NULL,
  `major_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id_idx` (`subject_id`),
  KEY `semester9_id_idx` (`semester_id`),
  KEY `major9_id_idx` (`major_id`),
  CONSTRAINT `major9_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `semester9_id` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`),
  CONSTRAINT `subject9_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_program`
--

LOCK TABLES `education_program` WRITE;
/*!40000 ALTER TABLE `education_program` DISABLE KEYS */;
INSERT INTO `education_program` VALUES (1,'NMTH','12023','MCNTT'),(2,'CSLT','12023','MCNTT'),(3,'DSTT','12023','MCNTT'),(4,'KTMT','22023','MCNTT'),(5,'KTLT','22023','MCNTT'),(6,'GT','22023','MCNTT'),(7,'OOP','32023','MCNTT'),(8,'CSDL','32023','MCNTT'),(9,'CNMLN','32023','MCNTT'),(10,'LUATKT','12024','MCNTT'),(11,'TKW','12024','MCNTT'),(12,'DCSVN','12024','MCNTT'),(13,'LTDD','12024','MCNTT');
/*!40000 ALTER TABLE `education_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('CNSH','Công nghệ sinh học '),('CNTT','Công nghệ thông tin'),('KINHTE','Kinh tế và Quản lý công'),('KTKT','Kế toán - Kiểm toán'),('LUAT','Luật'),('NN','Ngoại ngữ'),('QTKD','Quản trị kinh doanh'),('TCNH','Tài chính - Ngân hàng'),('TCT','Toán, Lý luận chính trị'),('test','test1'),('XD','Xây dựng'),('XHHCTXHDNA','XHH - CTXH - DNA');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `gender` smallint NOT NULL,
  `identification` varchar(12) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dregree` varchar(50) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `classes_id` varchar(8) DEFAULT NULL,
  `faculty_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id_idx` (`faculty_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `classes1_id_idx` (`classes_id`),
  CONSTRAINT `classes1_id` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES ('anh.phch','Phạm Hùng Cẩm Huyên Anh','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm 1','anh.phch@gmail.com','Cử nhân','Chuyên viên CTĐT',NULL,NULL,'CNTT'),('bay.nv','Nguyễn Văn Bảy','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 2','bay.nv@gmail.com','Thạc sĩ','Chuyên viên CTSV',NULL,NULL,'CNTT'),('bich.nd','Dư Ngọc Bích','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm','bich.nd@gmail.com','Tiến sĩ','Giảng viên',NULL,NULL,'LUAT'),('dat.nt','Nguyễn Tiến Đạt','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','dat.nt@gmail.com','Tiến sĩ','Trưởng bộ môn Hệ thống thông tin',NULL,NULL,'CNTT'),('khai.hq','Hồ Quang Khải','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','khai.hq@gmail.com','Thạc sĩ','Giảng viên',NULL,NULL,'CNTT'),('khue.ptm','Phan Trần Minh Khuê','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','khue.ptm@gmail.com','Tiến sĩ','Trưởng bộ môn Khoa học dữ liệu',NULL,NULL,'CNTT'),('minh.lq','Lê Minh Quang','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','minh.lq@gmail.com','Tiến sĩ','Giảng viên',NULL,NULL,'CNTT'),('phuong.lq','Lưu Quang Phương','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','phuong.lq@gmail.com','Thạc sĩ','Giảng viên',NULL,NULL,'CNTT'),('sinh.nh','Nguyễn Hoàng Sinh','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','sinh.nh@gmail.com','Tiến sĩ','Phụ trách Khoa Quản trị Kinh doanh',NULL,NULL,'QTKD'),('thanh.dh','Dương Hữu Thành','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','thanh.dh@gmail.com','Thạc sĩ','Phó Trưởng Bộ môn Cơ sở ngành',NULL,NULL,'CNTT'),('trang.ntm','Nguyễn Thị Mai Trang','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm 1','trang.ntm@gmail.com','Thạc sĩ','Giảng viên',NULL,NULL,'CNTT'),('tuan.lv','Lê Viết Tuấn','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','tuan.lv@gmail.com','Tiến sĩ','Trưởng Bộ môn Trí tuệ nhân tạo',NULL,NULL,'CNTT'),('vinh.th','Trương Hoàng Vinh','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','vinh.th@gmail.com','Tiến sĩ','Phụ trách khoa',NULL,NULL,'CNTT');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_subject`
--

DROP TABLE IF EXISTS `lecturer_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lecturer_id` varchar(10) NOT NULL,
  `subject_id` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_id_idx` (`lecturer_id`),
  KEY `subject1_id_idx` (`subject_id`),
  CONSTRAINT `lecturer_id` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject1_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_subject`
--

LOCK TABLES `lecturer_subject` WRITE;
/*!40000 ALTER TABLE `lecturer_subject` DISABLE KEYS */;
INSERT INTO `lecturer_subject` VALUES (12,'bich.nd','CNMLN'),(13,'dat.nt','OOP'),(14,'khai.hq','CSDL'),(15,'khue.ptm','LTDD'),(16,'minh.lq','DSTT'),(17,'phuong.lq','MMT'),(18,'sinh.nh','KN'),(19,'thanh.dh','TKW'),(20,'thanh.dh','KTLT'),(21,'vinh.th','KTMT');
/*!40000 ALTER TABLE `lecturer_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `id` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `faculty_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty2_id_idx` (`faculty_id`),
  CONSTRAINT `faculty2_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES ('MCNSH','Công nghệ sinh học','CNSH'),('MCNTT','Công nghệ thông tin','CNTT'),('MGDTC','Giáo dục thể chất',NULL),('MHTTTQL','Hệ thống thông tin quản lý','CNTT'),('MKETOAN','Kế toán','KTKT'),('MKIEMTOAN','Kiểm toán','KTKT'),('MKT','Kinh tế','KINHTE'),('MLUAT','Luật','LUAT'),('MNNA','Ngôn ngữ Anh','NN'),('MNNN','Ngôn ngữ Nhật','NN'),('MQLC','Quản lý công','KINHTE'),('MQPAN','Giáo dục quốc phòng – An ninh',NULL),('MQTKD','Quản trị kinh doanh','QTKD'),('MTCNH','Tài Chính - Ngân Hàng','TCNH'),('NNT','Ngôn ngữ Trung','NN'),('TCT','Toán, Lý luận chính trị',NULL),('test','test1','test'),('TH','Tin học',NULL);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_time` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user5_id_idx` (`user_id`),
  CONSTRAINT `user7_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `semester_id` varchar(5) NOT NULL,
  `student_subject_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `semester_id_idx` (`semester_id`),
  KEY `student_subject_id_idx` (`student_subject_id`),
  CONSTRAINT `semester_id` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_subject_id` FOREIGN KEY (`student_subject_id`) REFERENCES `student_subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_column`
--

DROP TABLE IF EXISTS `score_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_column` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_column`
--

LOCK TABLES `score_column` WRITE;
/*!40000 ALTER TABLE `score_column` DISABLE KEYS */;
INSERT INTO `score_column` VALUES (1,'Quá trình'),(2,'Giữa kì'),(3,'Cuối kì'),(4,'Điểm cộng'),(5,'Điểm TK'),(31,'Điểm tích lũy học kỳ'),(32,'Điểm tích lũy tổng kết');
/*!40000 ALTER TABLE `score_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_percent`
--

DROP TABLE IF EXISTS `score_percent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_percent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `percentCK` double NOT NULL,
  `percentGK` double NOT NULL,
  `subject_id` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject8_id_idx` (`subject_id`),
  CONSTRAINT `subject8_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_percent`
--

LOCK TABLES `score_percent` WRITE;
/*!40000 ALTER TABLE `score_percent` DISABLE KEYS */;
INSERT INTO `score_percent` VALUES (1,0.6,0.4,'CSDL'),(2,0.7,0.3,'CSLT'),(3,0.7,0.3,'KTLT'),(4,0.5,0.5,'LUATKT'),(5,0.7,0.3,'OOP'),(6,0.5,0.5,'TANC1'),(7,0.5,0.5,'TANC2'),(8,0.5,0.5,'TANC3'),(9,0.5,0.5,'TANC4'),(10,0.5,0.5,'TANC5'),(11,0.7,0.3,'TKW'),(12,0.5,0.5,'CNMLN'),(13,0.5,0.5,'DCSVN'),(17,0.9,0.1,'TANC1');
/*!40000 ALTER TABLE `score_percent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_value`
--

DROP TABLE IF EXISTS `score_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` double NOT NULL,
  `score_id` int NOT NULL,
  `score_column_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `score_id_idx` (`score_id`),
  KEY `score_column_id_idx` (`score_column_id`),
  CONSTRAINT `score_column_id` FOREIGN KEY (`score_column_id`) REFERENCES `score_column` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_id` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_value`
--

LOCK TABLES `score_value` WRITE;
/*!40000 ALTER TABLE `score_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `id` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_year` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES ('12020','Học kì 1',2020,'2020-01-12','2020-03-22'),('12021','Học kì 1',2021,'2021-01-12','2021-03-22'),('12022','Học kì 1',2022,'2022-01-12','2022-03-22'),('12023','Học kì 1',2023,'2023-01-12','2023-03-22'),('12024','Học kì 1',2024,'2023-01-12','2024-03-22'),('22020','Học kì 2',2020,'2020-03-28','2020-04-04'),('22021','Học kì 2',2021,'2021-03-28','2021-04-04'),('22022','Học kì 2',2022,'2022-03-28','2022-04-04'),('22023','Học kì 2',2023,'2023-03-28','2023-04-04'),('22024','Học kì 2',2024,'2024-01-13','2024-04-13'),('32020','Học kì 3',2020,'2020-06-06','2020-08-24'),('32021','Học kì 3',2021,'2021-06-06','2021-08-24'),('32022','Học kì 3',2022,'2022-06-06','2022-08-24'),('32023','Học kì 3',2023,'2023-06-06','2023-08-24');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `gender` smallint NOT NULL,
  `identification` varchar(12) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `classes_id` varchar(8) DEFAULT NULL,
  `faculty_id` varchar(10) DEFAULT NULL,
  `major_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bkix9btnoi1n917ll7bplkvg5` (`user_id`),
  KEY `user2_id_idx` (`user_id`),
  KEY `classes2_id_idx` (`classes_id`),
  KEY `faculty3_id_idx` (`faculty_id`),
  KEY `major_id_idx` (`major_id`),
  CONSTRAINT `classes9_id` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `faculty3_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `major_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user2_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2051052046','Lê Trường An','2002-10-04',1,'0979305883','0979305889','Nguyễn Kiệm 7',631,'DH20LU01','LUAT','MLUAT'),('2051052047','Nguyễn Thị Minh Anh','2002-10-05',1,'0979305884','0979305890','Nguyễn Kiệm 8',632,'DH20LU01','LUAT','MLUAT'),('2051052048','Lê Huy Bắc','2002-10-06',1,'0979305885','0979305891','Nguyễn Kiệm 9',633,'DH20LU01','LUAT','MLUAT'),('2051052049','Triệu Văn Bảo','2002-10-07',1,'0979305886','0979305892','Nguyễn Kiệm 10',634,'DH20LU01','LUAT','MLUAT'),('2051052050','Hồ Chung Bảo','2002-10-09',1,'0979305887','0979305893','Nguyễn Kiệm 11',635,'DH20LU01','LUAT','MLUAT'),('2051052051','Lương Xuân Bảo','2002-10-09',1,'0979305888','0979305894','Nguyễn Kiệm 12',636,'DH20LU01','LUAT','MLUAT'),('2051052052','Nguyễn Thanh Bình','2002-10-09',1,'0979305889','0979305895','Nguyễn Kiệm 13',637,'DH20LU01','LUAT','MLUAT'),('2051052053','Doãn Thị Linh Chi','2002-10-09',1,'0979305890','0979305896','Nguyễn Kiệm 14',638,'DH20LU01','LUAT','MLUAT'),('2051052055','Trần Văn Đạt','2002-10-09',1,'0979305892','0979305898','Nguyễn Kiệm 16',640,'DH20LU01','LUAT','MLUAT'),('2051052056','Vương Qui Đạt','2002-10-09',1,'0979305893','0979305899','Nguyễn Kiệm 17',641,'DH20LU01','LUAT','MLUAT'),('2051052057','Phan Văn Đạt','2002-10-09',1,'0979305894','0979305900','Nguyễn Kiệm 18',642,'DH20LU01','LUAT','MLUAT'),('2051052058','Nguyễn Văn Đạt','2002-10-09',1,'0979305895','0979305901','Nguyễn Kiệm 19',643,'DH20LU01','LUAT','MLUAT'),('2051052059','Nguyễn Ngọc Diễm','2002-10-09',1,'0979305896','0979305902','Nguyễn Kiệm 20',644,'DH20LU01','LUAT','MLUAT'),('2051052060','Lý Nguyễn Thanh Hoa','2002-10-09',1,'0979305897','0979305903','Nguyễn Kiệm 21',645,'DH20LU01','LUAT','MLUAT'),('2051052061','Võ Phú Hoài','2002-10-09',1,'0979305898','0979305904','Nguyễn Kiệm 22',646,'DH20LU01','LUAT','MLUAT'),('2051052062','Bùi Xuân Hoàn','2002-10-09',1,'0979305899','0979305905','Nguyễn Kiệm 23',647,'DH20LU01','LUAT','MLUAT'),('2051052063','Nguyễn Mạnh Khang','2002-10-09',1,'0979305900','0979305906','Nguyễn Kiệm 24',648,'DH20LU01','LUAT','MLUAT'),('2051052064','Hoàng Ngọc Khanh','2002-10-09',1,'0979305901','0979305907','Nguyễn Kiệm 25',649,'DH20LU01','LUAT','MLUAT'),('2051052065','Vũ Văn Khiêm','2002-10-09',1,'0979305902','0979305908','Nguyễn Kiệm 26',650,'DH20LU01','LUAT','MLUAT'),('2051052066','Trần Đặng Công Minh','2002-10-09',1,'0979305903','0979305909','Nguyễn Kiệm 27',651,'DH20LU01','LUAT','MLUAT'),('2051052067','Đỗ Nhật Minh','2002-10-09',1,'0979305904','0979305910','Nguyễn Kiệm 28',652,'DH20LU01','LUAT','MLUAT'),('2051052068','Nguyễn Công Quang Minh','2002-10-09',1,'0979305905','0979305911','Nguyễn Kiệm 29',653,'DH20LU01','LUAT','MLUAT'),('2051052069','Đoàn Hồng Ngọc','2002-10-09',1,'0979305906','0979305912','Nguyễn Kiệm 30',654,'DH20LU01','LUAT','MLUAT'),('2051052070','Tán Vũ Phi Nguyên','2002-10-09',1,'0979305907','0979305913','Nguyễn Kiệm 31',655,'DH20LU01','LUAT','MLUAT'),('2051052071','Trần Tấn Thanh Nhàn','2002-10-09',1,'0979305908','0979305914','Nguyễn Kiệm 32',656,'DH20LU01','LUAT','MLUAT'),('2051052072','Phan Hoàng Nhân','2002-10-09',1,'0979305909','0979305915','Nguyễn Kiệm 33',657,'DH20LU01','LUAT','MLUAT'),('2051052073','Nguyễn Hoàng Minh Nhật','2002-10-09',1,'0979305910','0979305916','Nguyễn Kiệm 34',658,'DH20LU01','LUAT','MLUAT'),('2051052074','Điểu Thị Thu Oanh','2002-11-01',1,'0979305911','0979305917','Nguyễn Kiệm 35',659,'DH20LU01','LUAT','MLUAT'),('2051052075','Trương Hoài Phong','2002-11-02',1,'0979305912','0979305918','Nguyễn Kiệm 36',660,'DH20LU01','LUAT','MLUAT'),('2051052076','Trương Minh Phong','2002-11-03',1,'0979305913','0979305919','Nguyễn Kiệm 37',661,'DH20LU01','LUAT','MLUAT'),('2051052077','Nguyễn Hoàng Phúc','2002-11-04',1,'0979305914','0979305920','Nguyễn Kiệm 38',662,'DH20LU01','LUAT','MLUAT'),('2051052078','Đáng Sỹ Tuân','2002-11-05',1,'0979305915','0979305921','Nguyễn Kiệm 39',663,'DH20LU01','LUAT','MLUAT'),('2051052079','Trần Ngọc Tuấn','2002-11-06',1,'0979305916','0979305922','Nguyễn Kiệm 40',664,'DH20LU01','LUAT','MLUAT'),('2051052080','Nguyễn Minh Tuệ','2002-11-07',1,'0979305917','0979305923','Nguyễn Kiệm 41',665,'DH20LU01','LUAT','MLUAT'),('2051052081','Nguyễn Thanh Tùng','2002-11-09',1,'0979305918','0979305924','Nguyễn Kiệm 42',666,'DH20LU01','LUAT','MLUAT'),('2051052082','Lê Ngọc Tỷ','2002-11-09',1,'0979305919','0979305925','Nguyễn Kiệm 43',667,'DH20LU01','LUAT','MLUAT'),('2051052083','Phan Thị Yến Vi','2002-11-09',1,'0979305920','0979305926','Nguyễn Kiệm 44',668,'DH20LU01','LUAT','MLUAT'),('2051052084','Tôn Thất Vinh','2002-11-09',1,'0979305921','0979305927','Nguyễn Kiệm 45',669,'DH20LU01','LUAT','MLUAT'),('2051052085','Nguyễn Quang Vinh','2002-11-09',1,'0979305922','0979305928','Nguyễn Kiệm 46',670,'DH20LU01','LUAT','MLUAT'),('2051052086','Thái Bình Cơ','2002-10-09',1,'0979305891','0979305897','Nguyễn Kiệm 15',639,'DH20LU01','LUAT','MLUAT');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_subject`
--

DROP TABLE IF EXISTS `student_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint DEFAULT NULL,
  `student_id` varchar(10) NOT NULL,
  `subject_id` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student1_id_idx` (`student_id`),
  KEY `subject3_id_idx` (`subject_id`),
  CONSTRAINT `student1_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject3_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_subject`
--

LOCK TABLES `student_subject` WRITE;
/*!40000 ALTER TABLE `student_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credit` int NOT NULL,
  `major_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major3_id_idx` (`major_id`),
  CONSTRAINT `major3_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('CNMLN','Chủ nghĩa Mác - Lenin',3,'TCT'),('CSDL','Cơ sở dữ liệu',4,'MCNTT'),('CSLT','Cơ sở lập trình',4,'MCNTT'),('DCSVN','Đảng Cộng Sản Việt Nam',3,'TCT'),('DSTT','Đại số tuyến tính',3,'TCT'),('GT','Giải tích',3,'TCT'),('KN','Khởi nghiệp',3,'MQTKD'),('KTLT','Kỹ thuật lập trình',4,'MCNTT'),('KTMT','Kiến trúc máy tính',3,'MCNTT'),('KTVM','Kinh tế vi mô',3,'MKT'),('LTDD','Lập trình trên thiết bị di động	',3,'MCNTT'),('LTMQT','Luật thương mại quốc tế',3,'MLUAT'),('LUATKT','Luật Kinh Tế',3,'MLUAT'),('MMT','Mạng máy tính',3,'MCNTT'),('NMTH','Nhập môn tin học',3,'TH'),('OOP','Lập trình hướng đối tượng',4,'MCNTT'),('QPAN201','Giáo dục quốc phòng – An ninh: Quân sự chung',1,'MQPAN'),('QPAN202','Giáo dục quốc phòng – An ninh: Công tác quốc phòng an ninh',2,'MQPAN'),('QPAN203','Giáo dục quốc phòng – An ninh: Kỹ thuật chiến đấu bộ binh và chiến thuật',2,'MQPAN'),('QPAN204','Giáo dục quốc phòng – An ninh: Đường lối quốc phòng và an ninh của Đảng Cộng sản Việt Nam',3,'MQPAN'),('TANC1','Tiếng Anh Nâng Cao 1',3,'MNNA'),('TANC2','Tiếng Anh Nâng Cao 2',3,'MNNA'),('TANC3','Tiếng Anh Nâng Cao 3',3,'MNNA'),('TANC4','Tiếng Anh Nâng Cao 4',3,'MNNA'),('TANC5','Tiếng Anh Nâng Cao 5',3,'MNNA'),('THVP','Tin học văn phòng',4,'TH'),('TKW','Thiết kế web',4,'MCNTT');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition_fee`
--

DROP TABLE IF EXISTS `tuition_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuition_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tuition_fee` double DEFAULT NULL,
  `done` tinyint DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `semester_id` varchar(5) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `semester3_id_idx` (`semester_id`),
  KEY `student9_id_idx` (`student_id`),
  CONSTRAINT `semester3_id` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student9_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition_fee`
--

LOCK TABLES `tuition_fee` WRITE;
/*!40000 ALTER TABLE `tuition_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuition_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=671 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (109,'giaovu','$2a$10$mYC5eF4R0oHmGvF0/Vx80.FPrVhSfHBViD1YzBaP283QYU7ELrR4i','giaovu@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605310/dsshxrekvd0ui5o0ov6q.png'),(618,'anh.phch','$2a$10$nuUSQ/SqlnATHAaX2CB2bue42NfwLFN/jdSvM0MEs4ItitFzeUIiy','anh.phch@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269603/azjctjaytwekxmncz06m.png'),(619,'bay.nv','$2a$10$IkIvkJahklX2wSAQn.vKZuDfo2CoP8xiqhgw./WSmLAFAn5EJymxC','bay.nv@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269620/tzmiamuuebvpnoscdcvv.png'),(620,'bich.nd','$2a$10$sPpLcoMH2mJA2l0pW3BAs.sO4.xPeef1AeNKsDRZ4dVPwCMlFHtD2','bich.nd@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269632/esjh0hyxq8vtylk3yyls.png'),(621,'dat.nt','$2a$10$ie4ZudgHIJRMBPTTCY7zkuY.QFxfXq/mS/TrHZrmZ3ZU15lWKsx/a','dat.nt@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269643/u3cm9itznxc3sp3jjaxu.png'),(622,'khai.hq','$2a$10$yCWvjLVXCObMWbX0ao6Zk.JYcqPM4F5WF7gipDSJVnxYEmSsJvUW2','khai.hq@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269656/bfzuwmo5jl31hlzmdaf6.png'),(623,'khue.ptm','$2a$10$NlNXB5yQI4k/9UJE/LLhguv1EgIRRA97kKdQzcHJqkaZTkrL8Bu/6','khue.ptm@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269665/lrjjflknjwrssm5c1dnx.png'),(624,'minh.lq','$2a$10$qha8Cb3NOEx5023duepDsOwfc05w1XezSQYKNke/Po1jhUUiv1tOe','minh.lq@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269674/j80ytj23jzim3bar2dbq.png'),(625,'phuong.lq','$2a$10$VG9rgZ7MKtYRxzXTxsKARu2hW2LiVxtgp.AJg6bIiSFlW.wtGYA/O','phuong.lq@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269684/rvhyn8p04c6haeylrkzu.png'),(626,'sinh.nh','$2a$10$9MOfu8J2.T1F8exTlE52OOVTv7bNtHF26HoSsUNNduZO9aZnVT.we','sinh.nh@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269695/jdowynk8pg79dcic0wld.png'),(627,'thanh.dh','$2a$10$OFhHXRodSjQ/4UpB8J7qvezgKTFYe5kNcLpJOPqzRe1eRLLVCyk.2','thanh.dh@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269704/qibcqi8co0bursfw66wv.png'),(628,'trang.ntm','$2a$10$0QGbHmQw3LZuuX4IjkSCJuETkZpFiIRxi/7c8BA1uhdrxpVf8NtBi','trang.ntm@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269714/nevxfbgwysgamk8ewgic.png'),(629,'tuan.lv','$2a$10$.bfCiTu3PBS5JsBgBIqT2.RxvVO7BjjQgp1H8vzkFerevnLG6HgbO','tuan.lv@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269724/buirltaqsduwsapayglv.png'),(630,'vinh.th','$2a$10$OidW9TNNk80do4OFnNfAtuOTZ7iJU8RkhLhaW89CY8YGvstoSTI4C','vinh.th@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269734/uyu0bim6ck0tmujqybtb.png'),(631,'2051052046','$2a$10$fIXwVGB2IxEx8m32RsFsoejQveQpBR3MJC7YhfkgjSc6Z/JZTYPE.','2051052046@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(632,'2051052047','$2a$10$A/1zZtb8ToH8w9qvZ0rkbuERqitromAAt9Ure/jb9EVFh6kRd0Mh2','2051052047@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(633,'2051052048','$2a$10$fQVhwyrhTEyA6TxTy/IpU.dmRLdK0FTDvZKDsMObTbg4V8YM2IJve','2051052048@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(634,'2051052049','$2a$10$4aStxO4xj/RazK9eXeJEk.oEMqXUk15DmqKr0M0AM49SKXBhrIgnK','2051052049@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(635,'2051052050','$2a$10$./CNCvMZIOC9r/k3Rdzzje8pagtsszKYw1x66paIG5Br4qFqbWiTy','2051052050@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(636,'2051052051','$2a$10$l868sh.zO9hxWYxGzuIaZ.2D8cJl0KNu1aROiW.2Gt0eB2GcTSh9W','2051052051@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(637,'2051052052','$2a$10$GMkkRe9D.2NaVe2Lk.fKjedLUPKhYWlsJyZr3d103vqpp2q4I9b9K','2051052052@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(638,'2051052053','$2a$10$IiMBNM.35vLR0Eyvrs/wM.7sxI46lVLCPRufu65FS5m.sjvYSasba','2051052053@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(639,'2051052086','$2a$10$7rc5icbO/y7dDJjYZaPXtOvK8AqSt2v1eK.ya9lawT2De77k9NMEC','2051052086@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(640,'2051052055','$2a$10$FwIDPqsHwXuIDOmbQAAkYubZAK7f6oXywxokdJvGwGNhnepp9rf0C','2051052055@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(641,'2051052056','$2a$10$W4uua9pRvyZ4fBE/LC3QJulpBgtKaV8RkDEs3XXgeFpYDS23jZG8u','2051052056@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(642,'2051052057','$2a$10$CaEEo0POJgYXKheLbHG64Ow6LwAoUEn34ULebD79JZLkrEcHVqOgy','2051052057@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(643,'2051052058','$2a$10$3xsW94Ji5I95Mqv2efVkrOcQ4hY6nPJWtS6mOfBz0AmQFJ6f.jgHG','2051052058@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(644,'2051052059','$2a$10$W07s69evxHI3OCr5Mh8cxu2OXYSiUpGpGN6DnkbQGw8.bs1bbeKG.','2051052059@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(645,'2051052060','$2a$10$WHCfUnMqSywxWvbgym87f.cZUTjaZCMzpytMu2eiVihdFitAIkW/S','2051052060@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(646,'2051052061','$2a$10$xFGv6.okmie6GHRyDmBN4.CziYGB7MzU46st3XdRHksrxRHxfGxOm','2051052061@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(647,'2051052062','$2a$10$8fOXalKlOjmxvrXSYhDgjePV1EpAm4N54MBmy0HyhweHjMLokCjdO','2051052062@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(648,'2051052063','$2a$10$HssK2OFqB/B2PqQVshefnOd77WrTXMuhBx0PhKKhif5vog4IdI6J6','2051052063@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(649,'2051052064','$2a$10$w4xKWIdB9UEBGr.87Vjqte9L.AfrBfnXL2fjGO72uaNWM1nY4QC12','2051052064@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(650,'2051052065','$2a$10$waRHy9MYOlxAdsedsenZJOalv7/Mql/aKuXvqNMU7TTmU8SEeNvc2','2051052065@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(651,'2051052066','$2a$10$gOXeRupPKcpEf7fKsaMgb.Mume8xCPha5qScbLID4vjQuo62KLVRW','2051052066@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(652,'2051052067','$2a$10$SpXAcMWkkf4yYlROmVqR1u/yXN12UpKWHzSlJ9FbZOsqT2TN9AQrm','2051052067@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(653,'2051052068','$2a$10$n/iOxXAfkxcNXuYSzASL/.0E1dCJX3U4IZ05SiIQ1brkbm0z/BQjS','2051052068@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(654,'2051052069','$2a$10$GgKRL5cfYbK7G15DBtK05eh3i7JvgEivLAX.U4zSm9WvFy6EvaNYy','2051052069@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(655,'2051052070','$2a$10$xOsF2vSW5gbSF9ZjdwyyOu8HkEqqsGVMeHgMNDARopNzXukU817Iu','2051052070@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(656,'2051052071','$2a$10$3CQKgivS77p/oMCTYzfNq.gn7dSiVStHAeo6QsHUk3kiezNEB5mx6','2051052071@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(657,'2051052072','$2a$10$5GNUQCTZvIyKDad1BIoZmuxm0sDc9gG.kj1Ars8QyepUxOqWpP7vi','2051052072@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(658,'2051052073','$2a$10$TU4uXGLHHL24F9/6M0WNy.3GdgWS1qHMYSIsgeryZn1ZyeYcsbeu6','2051052073@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(659,'2051052074','$2a$10$DvwNoKXcX5Ol3dSnmQhOP./biIoEIvc2qpeUDm8nkM1ADEzNpUnty','2051052074@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(660,'2051052075','$2a$10$G06xmXeZjKsa/sH6rCqDjOswCJQbrJuGLqYYGdczX79Otu7fozU0i','2051052075@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(661,'2051052076','$2a$10$lux68NGe7y3RPtlaDlX1ruOx8DEPZ2t1loljgxCJG03V7Vyay3a9G','2051052076@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(662,'2051052077','$2a$10$7d2PTmdBDQVluAaTzDZjmO9m/GI6zjhoGagAJJKPRRy8XrlItxAke','2051052077@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(663,'2051052078','$2a$10$mpzUHix/gJ9zjQoI6BpgwOhLmxLZjQS8rHdNp8E1gccVIUMxvABSC','2051052078@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(664,'2051052079','$2a$10$bbeoroto9orQFz8HuM03ReQvUyTfuHC1rbhguvzoZbg99nVReFY.S','2051052079@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(665,'2051052080','$2a$10$UtYIC0UgV.p8uNbNlVYYe.icmn3Zy9BHlX42g3McrKW/3fiTyGZOK','2051052080@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(666,'2051052081','$2a$10$svTq/0Pdtmu7ig5YdGYgqu2HhKl5Qr7CRPpdx7Y8Ot01Q6t3T99Nm','2051052081@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(667,'2051052082','$2a$10$EvXCgwFW2ItIa5m4kuaBfOqtDDV252zmF/71/I5QY.DB/3DcCGcj6','2051052082@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(668,'2051052083','$2a$10$gqDN2IUVPSIE63FFclqWA.WL8jNvpLmKRSLtuyJceyeX.gOHYQdDy','2051052083@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(669,'2051052084','$2a$10$sCEOnj433eFN.ATLfkMVWu8BwurYswTKlOs5lI54ubGZrgj/0bDh.','2051052084@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(670,'2051052085','$2a$10$sUjJu0TNqPvYPe6F9PTlxelGMCcm35OPCY/lRHjoC9PzjhBuYQgda','2051052085@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 22:51:36
