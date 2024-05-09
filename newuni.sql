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
  `degree` varchar(255) DEFAULT NULL,
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
INSERT INTO `lecturer` VALUES ('anh.phch','Phạm Hùng Cẩm Huyên Anh','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm 1','anh.phch@gmail.com','Cử nhân','Chuyên viên CTĐT',246,NULL,'CNTT',NULL),('bay.nv','Nguyễn Văn Bảy','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 2','bay.nv@gmail.com','Thạc sĩ','Chuyên viên CTSV',247,NULL,'CNTT',NULL),('bich.nd','Dư Ngọc Bích','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm','bich.nd@gmail.com','Tiến sĩ','Giảng viên',573,NULL,'LUAT',NULL),('dat.nt','Nguyễn Tiến Đạt','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','dat.nt@gmail.com','Tiến sĩ','Trưởng bộ môn Hệ thống thông tin',248,NULL,'CNTT',NULL),('khai.hq','Hồ Quang Khải','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','khai.hq@gmail.com','Thạc sĩ','Giảng viên',252,NULL,'CNTT',NULL),('khue.ptm','Phan Trần Minh Khuê','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','khue.ptm@gmail.com','Tiến sĩ','Trưởng bộ môn Khoa học dữ liệu',250,NULL,'CNTT',NULL),('minh.lq','Lê Minh Quang','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','minh.lq@gmail.com','Tiến sĩ','Giảng viên',575,NULL,'CNTT',NULL),('phuong.lq','Lưu Quang Phương','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','phuong.lq@gmail.com','Thạc sĩ','Giảng viên',254,NULL,'CNTT',NULL),('sinh.nh','Nguyễn Hoàng Sinh','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','sinh.nh@gmail.com','Tiến sĩ','Phụ trách Khoa Quản trị Kinh doanh',577,NULL,'QTKD',NULL),('thanh.dh','Dương Hữu Thành','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','thanh.dh@gmail.com','Thạc sĩ','Phó Trưởng Bộ môn Cơ sở ngành',251,NULL,'CNTT',NULL),('trang.ntm','Nguyễn Thị Mai Trang','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm 1','trang.ntm@gmail.com','Thạc sĩ','Giảng viên',253,NULL,'CNTT',NULL),('tuan.lv','Lê Viết Tuấn','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','tuan.lv@gmail.com','Tiến sĩ','Trưởng Bộ môn Trí tuệ nhân tạo',249,NULL,'CNTT',NULL),('vinh.th','Trương Hoàng Vinh','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','vinh.th@gmail.com','Tiến sĩ','Phụ trách khoa',245,NULL,'CNTT',NULL);
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
INSERT INTO `student` VALUES ('1851050062','Nguyễn Trung Vũ','2000-09-27',1,'0979305882','0979305882','Nguyễn Kiệm',382,'DH19IT01','CNTT','MCNTT'),('1851050063','Huỳnh Nhật Vỹ','2000-09-28',1,'0979305882','0979305883','Nguyễn Kiệm 1',383,'DH19IT01','CNTT','MCNTT'),('1851050064','Hoàng Công Chính','2000-09-29',1,'0979305882','0979305884','Nguyễn Kiệm 2',384,'DH19IT01','CNTT','MCNTT'),('1851050065','Lê Thị Hồng Đào','2001-09-30',0,'0979305882','0979305885','Nguyễn Kiệm 3',385,'DH19IT01','CNTT','MCNTT'),('1851050066','Bùi Khánh Huy','2001-09-30',1,'0979305882','0979305886','Nguyễn Kiệm',386,'DH19IT01','CNTT','MCNTT'),('1851050067','Nguyễn Văn Thu','2001-09-30',0,'0979305882','0979305887','Nguyễn Kiệm 4',387,'DH19IT01','CNTT','MCNTT'),('1851050068','Nguyễn Trường An','2001-09-30',1,'0979305882','0979305888','Nguyễn Kiệm 5',388,'DH19IT01','CNTT','MCNTT'),('1851050069','Nguyễn Thành Danh','2001-09-30',1,'0979305882','0979305889','Nguyễn Kiệm 6',389,'DH19IT01','CNTT','MCNTT'),('1851050070','Nguyễn Đức Đức','2001-09-30',1,'0979305882','0979305890','Nguyễn Kiệm',390,'DH19IT01','CNTT','MCNTT'),('1851050071','La Trung Hiếu','2001-09-30',1,'0979305882','0979305891','Nguyễn Kiệm 7',391,'DH19IT01','CNTT','MCNTT'),('1851050072','Nguyễn Minh Hiếu','2001-09-30',1,'0979305882','0979305892','Nguyễn Kiệm 8',392,'DH19IT01','CNTT','MCNTT'),('1851050073','Võ Minh Hùng','2001-09-30',1,'0979305882','0979305893','Nguyễn Kiệm 9',393,'DH19IT01','CNTT','MCNTT'),('1851050074','Võ Kế Khoa','2001-09-30',1,'0979305882','0979305894','Nguyễn Kiệm',394,'DH19IT01','CNTT','MCNTT'),('1851050075','Bùi Mạnh Linh','2001-09-30',1,'0979305882','0979305895','Nguyễn Kiệm 10',395,'DH19IT01','CNTT','MCNTT'),('1851050076','Võ Huy Nguyên','2001-09-30',1,'0979305882','0979305896','Nguyễn Kiệm 11',396,'DH19IT01','CNTT','MCNTT'),('1851050077','Nguyễn Thị Hồng Nhật','2001-09-30',0,'0979305882','0979305897','Nguyễn Kiệm 12',397,'DH19IT01','CNTT','MCNTT'),('1851050078','Nguyễn Văn Tài','2001-09-30',1,'0979305882','0979305898','Nguyễn Kiệm',398,'DH19IT01','CNTT','MCNTT'),('1851050079','Bùi Minh Trong','2001-09-30',1,'0979305882','0979305899','Nguyễn Kiệm 13',399,'DH19IT01','CNTT','MCNTT'),('1851050080','Nguyễn Duy Hải Anh','2001-09-30',1,'0979305882','0979305900','Nguyễn Kiệm 14',400,'DH19IT01','CNTT','MCNTT'),('1851050081','Huỳnh Gia Bảo','2001-09-30',1,'0979305882','0979305901','Nguyễn Kiệm 15',401,'DH19IT01','CNTT','MCNTT'),('1851050082','Trần Đức Trọng Hiền','2001-09-30',1,'0979305882','0979305902','Nguyễn Kiệm',402,'DH19IT01','CNTT','MCNTT'),('1851050083','Nguyễn Phạm Xuân Phúc','2001-09-30',1,'0979305882','0979305903','Nguyễn Kiệm 16',403,'DH19IT01','CNTT','MCNTT'),('1851050084','Phan Thị Hoài Thương','2001-09-30',0,'0979305882','0979305904','Nguyễn Kiệm 17',404,'DH19IT01','CNTT','MCNTT'),('1851050085','Nguyễn Anh Tuấn','2001-09-30',1,'0979305882','0979305905','Nguyễn Kiệm 18',405,'DH19IT01','CNTT','MCNTT'),('1851050086','Trần Thị Ngọc Lan','2001-09-30',0,'0979305882','0979305906','Nguyễn Kiệm',406,'DH19IT01','CNTT','MCNTT'),('1851050087','Lê Vĩnh Lâm','2000-09-29',1,'0979305882','0979305907','Nguyễn Kiệm 19',407,'DH19IT01','CNTT','MCNTT'),('1851050088','Nguyễn Hữu Nhật','2001-09-30',1,'0979305882','0979305908','Nguyễn Kiệm 20',408,'DH19IT01','CNTT','MCNTT'),('1851050089','Vương Thái Tường','2001-09-30',1,'0979305882','0979305909','Nguyễn Kiệm 21',409,'DH19IT01','CNTT','MCNTT'),('1851050090','Nguyễn Văn Minh Đức','2001-09-30',1,'0979305882','0979305910','Nguyễn Kiệm',410,'DH19IT01','CNTT','MCNTT'),('1851050091','Huỳnh Tấn Lợi','2001-09-30',1,'0979305882','0979305911','Nguyễn Kiệm 22',411,'DH19IT01','CNTT','MCNTT'),('1851050092','Huỳnh Thị Trang Nhung','2001-09-30',0,'0979305882','0979305912','Nguyễn Kiệm 23',412,'DH19IT01','CNTT','MCNTT'),('1851050093','Nguyễn Thành Dũng','2001-09-30',1,'0979305882','0979305913','Nguyễn Kiệm 24',413,'DH19IT01','CNTT','MCNTT'),('1851050094','Huỳnh Lê Bá Đạt','2001-09-30',1,'0979305882','0979305914','Nguyễn Kiệm',414,'DH19IT01','CNTT','MCNTT'),('1851050095','Lý Bội Đạt','2001-09-30',1,'0979305882','0979305915','Nguyễn Kiệm 25',415,'DH19IT01','CNTT','MCNTT'),('1851050096','Lê Văn Định','2001-09-30',1,'0979305882','0979305916','Nguyễn Kiệm 26',416,'DH19IT01','CNTT','MCNTT'),('1851050097','Hồ Nguyễn Công Sang','2001-09-30',1,'0979305882','0979305917','Nguyễn Kiệm 27',417,'DH19IT01','CNTT','MCNTT'),('1851050098','Nguyễn Thị Ngọc Uyên','2001-09-30',0,'0979305882','0979305918','Nguyễn Kiệm',418,'DH19IT01','CNTT','MCNTT'),('1851050099','Phan Nguyễn Quỳnh Như','2001-09-30',0,'0979305882','0979305919','Nguyễn Kiệm 28',419,'DH19IT01','CNTT','MCNTT'),('1851050100','Nguyễn Đặng Khương Duy','2001-09-30',1,'0979305882','0979305920','Nguyễn Kiệm 29',420,'DH19IT01','CNTT','MCNTT'),('1851050101','Trương Quang Thắng','2001-09-30',1,'0979305882','0979305921','Nguyễn Kiệm 30',421,'DH19IT01','CNTT','MCNTT'),('1851050102','Nguyễn Hoàng Trung Thông','2001-09-30',1,'0979305882','0979305922','Nguyễn Kiệm',422,'DH19IT01','CNTT','MCNTT'),('1851050103','Nguyễn Hữu Tiên','2001-09-30',1,'0979305882','0979305923','Nguyễn Kiệm 31',423,'DH19IT01','CNTT','MCNTT'),('2051052001','Đặng Văn Mãi','2002-09-27',1,'0979305882','0979305882','Nguyễn Kiệm',479,'DH20IT02','CNTT','MCNTT'),('2051052002','Trịnh Quốc Thảo','2002-09-28',1,'0979305882','0979305883','Nguyễn Kiệm 1',480,'DH20IT02','CNTT','MCNTT'),('2051052003','Đặng Phạm Đình Chương','2002-09-29',1,'0979305882','0979305884','Nguyễn Kiệm 2',481,'DH20IT02','CNTT','MCNTT'),('2051052004','Phan Lê Hồ','2002-09-30',0,'0979305882','0979305885','Nguyễn Kiệm 3',482,'DH20IT02','CNTT','MCNTT'),('2051052005','Nguyễn Hồng Phúc','2002-10-04',1,'0979305882','0979305889','Nguyễn Kiệm 7',483,'DH20IT02','CNTT','MCNTT'),('2051052006','Lê Quang Tới','2002-10-05',1,'0979305882','0979305890','Nguyễn Kiệm 8',484,'DH20IT02','CNTT','MCNTT'),('2051052007','Phan Nhựt Tân','2002-10-06',1,'0979305882','0979305891','Nguyễn Kiệm 9',485,'DH20IT02','CNTT','MCNTT'),('2051052008','Đinh Minh Hiếu','2002-10-07',1,'0979305882','0979305892','Nguyễn Kiệm 10',486,'DH20IT02','CNTT','MCNTT'),('2051052009','Lê Quang Đạt','2002-10-09',1,'0979305882','0979305893','Nguyễn Kiệm 11',487,'DH20IT02','CNTT','MCNTT'),('2051052010','Phạm Tấn Hoàng','2002-10-09',1,'0979305882','0979305894','Nguyễn Kiệm 12',488,'DH20IT02','CNTT','MCNTT'),('2051052011','Trần Đăng Khoa','2002-10-09',1,'0979305882','0979305895','Nguyễn Kiệm 13',489,'DH20IT02','CNTT','MCNTT'),('2051052012','Lê Văn Lâm','2002-10-09',1,'0979305882','0979305896','Nguyễn Kiệm 14',490,'DH20IT02','CNTT','MCNTT'),('2051052013','Trần Nhật Minh','2002-10-09',0,'0979305882','0979305897','Nguyễn Kiệm 15',491,'DH20IT02','CNTT','MCNTT'),('2051052014','Đinh Hoàng Thanh Trúc','2002-10-09',1,'0979305882','0979305898','Nguyễn Kiệm 16',492,'DH20IT02','CNTT','MCNTT'),('2051052015','Võ Bùi Minh Hoàng','2002-10-09',1,'0979305882','0979305899','Nguyễn Kiệm 17',493,'DH20IT02','CNTT','MCNTT'),('2051052016','Trần Nhật Nam','2002-10-09',1,'0979305882','0979305900','Nguyễn Kiệm 18',494,'DH20IT02','CNTT','MCNTT'),('2051052017','Nguyễn Huy Tú','2002-10-09',1,'0979305882','0979305901','Nguyễn Kiệm 19',495,'DH20IT02','CNTT','MCNTT'),('2051052018','Hồ Đắc Nguyên','2002-10-09',1,'0979305882','0979305909','Nguyễn Kiệm 27',496,'DH20IT02','CNTT','MCNTT'),('2051052019','Nguyễn Minh Quân','2002-10-09',1,'0979305882','0979305910','Nguyễn Kiệm 28',497,'DH20IT02','CNTT','MCNTT'),('2051052020','Nguyễn Minh Tài','2002-10-09',1,'0979305882','0979305911','Nguyễn Kiệm 29',498,'DH20IT02','CNTT','MCNTT'),('2051052021','Nguyễn Huỳnh Minh Trí','2002-10-09',1,'0979305882','0979305912','Nguyễn Kiệm 30',499,'DH20IT02','CNTT','MCNTT'),('2051052024','Trần Đức Hiếu','2002-11-05',1,'0979305885','0979305915','Nguyễn Kiệm 33',502,'DH20IT02','CNTT','MCNTT'),('2051052025','Phạm Gia Tiến','2002-11-05',1,'0979305886','0979305916','Nguyễn Kiệm 34',503,'DH20IT02','CNTT','MCNTT'),('2051052026','Ngô Thị Kim Tài','2002-11-05',0,'0979305882','0979305921','Nguyễn Kiệm 39',504,'DH20IT02','CNTT','MCNTT'),('2051052027','Lương Viết Anh','2002-11-06',1,'0979305882','0979305922','Nguyễn Kiệm 40',505,'DH20IT01','CNTT','MCNTT'),('2051052028','Nguyễn Hoàng Hảo','2002-10-09',1,'0979305882','0979305913','Nguyễn Kiệm 31',506,'DH20IT01','CNTT','MCNTT'),('2051052029','Thái Tấn Phát','2002-10-09',1,'0979305882','0979305914','Nguyễn Kiệm 32',507,'DH20IT01','CNTT','MCNTT'),('2051052030','Nguyễn Thanh Thuyền','2002-10-09',1,'0979305882','0979305915','Nguyễn Kiệm 33',508,'DH20IT01','CNTT','MCNTT'),('2051052031','Trần Nguyễn Hồng Ân','2002-10-09',0,'0979305882','0979305916','Nguyễn Kiệm 34',509,'DH20IT01','CNTT','MCNTT'),('2051052032','Huỳnh Minh Hoàng','2002-11-01',1,'0979305882','0979305917','Nguyễn Kiệm 35',510,'DH20IT01','CNTT','MCNTT'),('2051052033','Nguyễn Thị Thanh','2002-11-02',0,'0979305882','0979305918','Nguyễn Kiệm 36',511,'DH20IT01','CNTT','MCNTT'),('2051052034','Đỗ Văn An','2002-11-03',1,'0979305882','0979305919','Nguyễn Kiệm 37',512,'DH20IT01','CNTT','MCNTT'),('2051052035','Trương Thị Kim Hoa','2002-11-04',1,'0979305882','0979305920','Nguyễn Kiệm 38',513,'DH20IT01','CNTT','MCNTT'),('2051052036','Đoàn Trung Phong','2002-10-09',1,'0979305882','0979305902','Nguyễn Kiệm 20',514,'DH20IT01','CNTT','MCNTT'),('2051052037','Đặng Thái Sơn','2002-10-09',1,'0979305882','0979305903','Nguyễn Kiệm 21',515,'DH20IT01','CNTT','MCNTT'),('2051052038','Cao Nguyên Thụy','2002-10-09',0,'0979305882','0979305904','Nguyễn Kiệm 22',516,'DH20IT01','CNTT','MCNTT'),('2051052039','Huỳnh Nguyễn','2002-10-09',1,'0979305882','0979305905','Nguyễn Kiệm 23',517,'DH20IT01','CNTT','MCNTT'),('2051052040','Nguyễn Nhật Sang','2002-10-09',1,'0979305882','0979305906','Nguyễn Kiệm 24',518,'DH20IT01','CNTT','MCNTT'),('2051052041','Cái Hoàng Huynh','2002-10-09',1,'0979305882','0979305907','Nguyễn Kiệm 25',519,'DH20IT01','CNTT','MCNTT'),('2051052042','Mai Thanh Bình','2002-10-09',1,'0979305882','0979305908','Nguyễn Kiệm 26',520,'DH20IT01','CNTT','MCNTT'),('2051052043','Đậu Xuân Hoàng Hùng','2002-10-01',1,'0979305882','0979305886','Nguyễn Kiệm 4',521,'DH20IT01','CNTT','MCNTT'),('2051052044','Bùi Tiến Phát','2002-10-02',1,'0979305882','0979305887','Nguyễn Kiệm 5',522,'DH20IT01','CNTT','MCNTT'),('2051052045','Nguyễn Kim Bảo Ngân','2002-10-03',0,'0979305882','0979305888','Nguyễn Kiệm 6',523,'DH20IT01','CNTT','MCNTT'),('2051052046','Lê Trường An','2002-10-04',1,'0979305883','0979305889','Nguyễn Kiệm 7',533,'DH20LU01','LUAT','MLUAT'),('2051052047','Nguyễn Thị Minh Anh','2002-10-05',0,'0979305884','0979305890','Nguyễn Kiệm 8',534,'DH20LU01','LUAT','MLUAT'),('2051052048','Lê Huy Bắc','2002-10-06',1,'0979305885','0979305891','Nguyễn Kiệm 9',535,'DH20LU01','LUAT','MLUAT'),('2051052049','Triệu Văn Bảo','2002-10-07',1,'0979305886','0979305892','Nguyễn Kiệm 10',536,'DH20LU01','LUAT','MLUAT'),('2051052050','Hồ Chung Bảo','2002-10-09',1,'0979305887','0979305893','Nguyễn Kiệm 11',537,'DH20LU01','LUAT','MLUAT'),('2051052051','Lương Xuân Bảo','2002-10-09',1,'0979305888','0979305894','Nguyễn Kiệm 12',538,'DH20LU01','LUAT','MLUAT'),('2051052052','Nguyễn Thanh Bình','2002-10-09',1,'0979305889','0979305895','Nguyễn Kiệm 13',539,'DH20LU01','LUAT','MLUAT'),('2051052053','Doãn Thị Linh Chi','2002-10-09',0,'0979305890','0979305896','Nguyễn Kiệm 14',540,'DH20LU01','LUAT','MLUAT'),('2051052054','Đoàn Gia Huy','2002-01-03',1,'0979305884','0979305914','Nguyễn Kiệm 32',501,'DH20IT02','CNTT','MCNTT'),('2051052055','Trần Văn Đạt','2002-10-09',1,'0979305892','0979305898','Nguyễn Kiệm 16',542,'DH20LU01','LUAT','MLUAT'),('2051052056','Vương Qui Đạt','2002-10-09',1,'0979305893','0979305899','Nguyễn Kiệm 17',543,'DH20LU01','LUAT','MLUAT'),('2051052057','Phan Văn Đạt','2002-10-09',1,'0979305894','0979305900','Nguyễn Kiệm 18',544,'DH20LU01','LUAT','MLUAT'),('2051052058','Nguyễn Văn Đạt','2002-10-09',1,'0979305895','0979305901','Nguyễn Kiệm 19',545,'DH20LU01','LUAT','MLUAT'),('2051052059','Nguyễn Ngọc Diễm','2002-10-09',0,'0979305896','0979305902','Nguyễn Kiệm 20',546,'DH20LU01','LUAT','MLUAT'),('2051052060','Lý Nguyễn Thanh Hoa','2002-10-09',1,'0979305897','0979305903','Nguyễn Kiệm 21',547,'DH20LU01','LUAT','MLUAT'),('2051052061','Võ Phú Hoài','2002-10-09',1,'0979305898','0979305904','Nguyễn Kiệm 22',548,'DH20LU01','LUAT','MLUAT'),('2051052062','Bùi Xuân Hoàn','2002-10-09',1,'0979305899','0979305905','Nguyễn Kiệm 23',549,'DH20LU01','LUAT','MLUAT'),('2051052063','Nguyễn Mạnh Khang','2002-10-09',1,'0979305900','0979305906','Nguyễn Kiệm 24',550,'DH20LU01','LUAT','MLUAT'),('2051052064','Hoàng Ngọc Khanh','2002-10-09',1,'0979305901','0979305907','Nguyễn Kiệm 25',551,'DH20LU01','LUAT','MLUAT'),('2051052065','Vũ Văn Khiêm','2002-10-09',1,'0979305902','0979305908','Nguyễn Kiệm 26',552,'DH20LU01','LUAT','MLUAT'),('2051052066','Trần Đặng Công Minh','2002-10-09',1,'0979305903','0979305909','Nguyễn Kiệm 27',553,'DH20LU01','LUAT','MLUAT'),('2051052067','Đỗ Nhật Minh','2002-10-09',1,'0979305904','0979305910','Nguyễn Kiệm 28',554,'DH20LU01','LUAT','MLUAT'),('2051052068','Nguyễn Công Quang Minh','2002-10-09',1,'0979305905','0979305911','Nguyễn Kiệm 29',555,'DH20LU01','LUAT','MLUAT'),('2051052069','Đoàn Hồng Ngọc','2002-10-09',0,'0979305906','0979305912','Nguyễn Kiệm 30',556,'DH20LU01','LUAT','MLUAT'),('2051052070','Tán Vũ Phi Nguyên','2002-10-09',1,'0979305907','0979305913','Nguyễn Kiệm 31',557,'DH20LU01','LUAT','MLUAT'),('2051052071','Trần Tấn Thanh Nhàn','2002-10-09',1,'0979305908','0979305914','Nguyễn Kiệm 32',558,'DH20LU01','LUAT','MLUAT'),('2051052072','Phan Hoàng Nhân','2002-10-09',1,'0979305909','0979305915','Nguyễn Kiệm 33',559,'DH20LU01','LUAT','MLUAT'),('2051052073','Nguyễn Hoàng Minh Nhật','2002-10-09',1,'0979305910','0979305916','Nguyễn Kiệm 34',560,'DH20LU01','LUAT','MLUAT'),('2051052074','Điểu Thị Thu Oanh','2002-11-01',0,'0979305911','0979305917','Nguyễn Kiệm 35',561,'DH20LU01','LUAT','MLUAT'),('2051052075','Trương Hoài Phong','2002-11-02',1,'0979305912','0979305918','Nguyễn Kiệm 36',562,'DH20LU01','LUAT','MLUAT'),('2051052076','Trương Minh Phong','2002-11-03',1,'0979305913','0979305919','Nguyễn Kiệm 37',563,'DH20LU01','LUAT','MLUAT'),('2051052077','Nguyễn Hoàng Phúc','2002-11-04',1,'0979305914','0979305920','Nguyễn Kiệm 38',564,'DH20LU01','LUAT','MLUAT'),('2051052078','Đáng Sỹ Tuân','2002-11-05',1,'0979305915','0979305921','Nguyễn Kiệm 39',565,'DH20LU01','LUAT','MLUAT'),('2051052079','Trần Ngọc Tuấn','2002-11-06',1,'0979305916','0979305922','Nguyễn Kiệm 40',566,'DH20LU01','LUAT','MLUAT'),('2051052080','Nguyễn Minh Tuệ','2002-11-07',1,'0979305917','0979305923','Nguyễn Kiệm 41',567,'DH20LU01','LUAT','MLUAT'),('2051052081','Nguyễn Thanh Tùng','2002-11-09',1,'0979305918','0979305924','Nguyễn Kiệm 42',568,'DH20LU01','LUAT','MLUAT'),('2051052082','Lê Ngọc Tỷ','2002-11-09',1,'0979305919','0979305925','Nguyễn Kiệm 43',569,'DH20LU01','LUAT','MLUAT'),('2051052083','Phan Thị Yến Vi','2002-11-09',0,'0979305920','0979305926','Nguyễn Kiệm 44',570,'DH20LU01','LUAT','MLUAT'),('2051052084','Tôn Thất Vinh','2002-11-09',1,'0979305921','0979305927','Nguyễn Kiệm 45',571,'DH20LU01','LUAT','MLUAT'),('2051052085','Nguyễn Quang Vinh','2002-11-09',1,'0979305922','0979305928','Nguyễn Kiệm 46',572,'DH20LU01','LUAT','MLUAT'),('2051052086','Thái Bình Cơ','2002-10-09',1,'0979305891','0979305897','Nguyễn Kiệm 15',541,'DH20LU01','LUAT','MLUAT'),('2051052127','Ngô Minh Thành','2002-01-13',1,'0979305883','0979305913','Nguyễn Kiệm 31',500,'DH20IT02','CNTT','MCNTT');
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
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (109,'giaovu','$2a$10$mYC5eF4R0oHmGvF0/Vx80.FPrVhSfHBViD1YzBaP283QYU7ELrR4i','giaovu@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605310/dsshxrekvd0ui5o0ov6q.png'),(245,'vinh.th','$2a$10$95RQPl7buBOvmy.XMmG9oerGc8lS31H5173ZlBP63DV9FSyE3ld56','vinh.th@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(246,'anh.phch','$2a$10$w8w1PCtpR4EM/1p7hULRcOcTkjrhz8BIk03jshiCjIxnsQ1dKalMi','anh.phch@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(247,'bay.nv','$2a$10$NnyQYo56jo0KrpEQVxohT.Z9YO4Vi3riLjrrZvcmD09B.DSMoHD5i','bay.nv@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(248,'dat.nt','$2a$10$.sZU4hR7ySDjs3cN7EPPI.MBtpydR.LJUMaTplRPUGQeq0MO8fX62','dat.nt@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(249,'tuan.lv','$2a$10$xyNFYb4sGX2JvD.LLdKz6e8nfXoiuDqggjePQKhPuTcZgWm5mummC','tuan.lv@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(250,'khue.ptm','$2a$10$ffS.WXVPFnJaL2tBuTL6reRM3BGW3pMWhWwMx0xoiCFcXU7P9Psva','khue.ptm@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(251,'thanh.dh','$2a$10$FHwNyO4.mVrH62Q/QqONAuqX6.5AXb6r6HLLsch9U1vON8E1Y8WIW','thanh.dh@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(252,'khai.hq','$2a$10$CysgjCQe910D9s/f0XK.eu6/5atJadltPtnGHoWnITvqkt8d7oZWW','khai.hq@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(253,'trang.ntm','$2a$10$u7MnslanOBTARLTyzyazTubvkkQRiYRmpz6FV8b0T.xlvPPHLBEOa','trang.ntm@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(254,'phuong.lq','$2a$10$67n2C/bAD2.7dWY20vxyLuNOb/w5L5ViBO6hqap5Ke2brUaUJdFUq','phuong.lq@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(382,'1851050062','$2a$10$ZswZacXsx7x6fgJesamEnO8v5eje6HNvn7c.2asuGh9XhFXppIFH6','1851050062@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(383,'1851050063','$2a$10$02PBkzp6qDHdgQ3TP4Zw0uEZtFuyKvkLsQTA2WGOsnBrmwnbyatDS','1851050063@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(384,'1851050064','$2a$10$zbAaEUXm0Maj9eGutIOAz.OHo/IkRkeHr8xUr/VdHi9RX8/pPxVzO','1851050064@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(385,'1851050065','$2a$10$csx98rzHSVyp8V2TR0hgFexxeqYroQ5pqKAWi68p1iHJoJSYXvXrm','1851050065@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(386,'1851050066','$2a$10$vfiLGTZE6j14bT/AL1ABLep1Ig30OAzJgNeYdz3WDwqmrpIYP2IcC','1851050066@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(387,'1851050067','$2a$10$mBqNtbokb69X4Bi1eAMSIuKyUBxB5poce4j3lXZtyYPQ/5SkjUh0G','1851050067@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(388,'1851050068','$2a$10$z9.ywyQ5wliYSrf528wX2.LFFEckvBnpY1Hzsrk0Yccbu/EirMmB.','1851050068@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(389,'1851050069','$2a$10$ewLNCEqhheQr1CrWrYK9OuMMT.agUkqTBnMvHdL3HMKkbGvRujTBq','1851050069@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(390,'1851050070','$2a$10$5wnJ18ZxNqFgVzABgyIZ8.GnEn0entotK/ri5nRw./yA8.JELOumy','1851050070@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(391,'1851050071','$2a$10$P.nkONHUZoq7RMGUcEs.E.E4DDvdkyVZl3BZ.sDRpwWm8EBG0qwOO','1851050071@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(392,'1851050072','$2a$10$Wwgdm7WdqFh9pDTxJwUBBerk/dS4qUbFcNZc2zGBZiHpTZq95em2y','1851050072@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(393,'1851050073','$2a$10$5cL4ekKmLprTQxnGQJrBD.NNNDmB1yRQE.oADk9om7rrNmedzfhsm','1851050073@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(394,'1851050074','$2a$10$Dee0IPV5ZtBs5bc/aYtbMOUQAbyEguy9.Fk3hv72z.aAtKzwod.HC','1851050074@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(395,'1851050075','$2a$10$b/cUrkOsfr/hCYSxiHqyle.ZYvqgMrOIrWM/.IFA9r.xd..WrzGyC','1851050075@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(396,'1851050076','$2a$10$Soj59TazlFniLqw/E.zRwu.NPKZmIrxS8/8fPZZ5wb/ut/rN9BjgS','1851050076@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(397,'1851050077','$2a$10$dPeJqPUROYTFVI23aylEK.zntTicZDL.cMlBalS6JqyMsegaGNkuy','1851050077@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(398,'1851050078','$2a$10$OjKX4oANx0AL3ootiG4MR.yZZRj5xQPBZXzqGssKMFYBXj4WSefd2','1851050078@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(399,'1851050079','$2a$10$VMKAgQ9lIlfAnzhQQQDK/eE0C52q8qniqWg2GiCCJLFag3Wmyt5kO','1851050079@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(400,'1851050080','$2a$10$pqEAlbpvW1Kc9tpulPKA8eyfCK7q5VFNL2KyFlU0cGm/3YpbiIWri','1851050080@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(401,'1851050081','$2a$10$hhm5uT28YGYrhD.bQD20VeiagLkgGcJ/t8yQ5OxlSkuGbUKmeV9KK','1851050081@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(402,'1851050082','$2a$10$MjMBU07iCPIojhgBQENHr.g64Ym4z6e571yiEFXLll99OvVv2rfe.','1851050082@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(403,'1851050083','$2a$10$4AzvifL3ZUDV/aqWhtcsE.lwN5uuZKHYxJ1ETT2irB12aYq0NM1ii','1851050083@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(404,'1851050084','$2a$10$HuRDClSuUuYRr7gDQ.EsY.87pqDSqSyoovaLGBdrIpXzvXUV4ilWm','1851050084@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(405,'1851050085','$2a$10$MWijoEv5P555S.YdzWPbxO7EtpkQCGdDMeX8w6b6Kdnh69RBjLFhy','1851050085@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(406,'1851050086','$2a$10$5tRprqNaiqES7N2QTsjP5e7Y8aaTFmWB5RUJO3SPXriqUQ7poam2m','1851050086@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(407,'1851050087','$2a$10$zx4ZbYO7sDC4E5XA8VkRkOvWhymn9fVCkGmqZe74xMPkXB94JNeqa','1851050087@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(408,'1851050088','$2a$10$JNhKFMFPpuuri4ZCA./ZL.mwCGqjWHBaE57w2TMnnwEZcrugRSDgq','1851050088@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(409,'1851050089','$2a$10$yN.2eYeJu4p3aG0DGuOD9O1T/u2.f42PGpyDfnnr951vBITSq0fqS','1851050089@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(410,'1851050090','$2a$10$rE2heCzWlDGmQqBtTLGdzO2UGrkWxJfmcw1SQNKFVymn3Kap8L.OS','1851050090@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(411,'1851050091','$2a$10$KxZyRT1sUQ.hUq0aoybsiusD9FjoN4hhMGQ0XvmnymdVus/Oe/uj6','1851050091@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(412,'1851050092','$2a$10$j2NWV.1iszZvkIMBk20WnOqP4YOpFQZ8DOLkLCSWmaJT1dJSOcbBi','1851050092@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(413,'1851050093','$2a$10$.rYZmlU8TIHk.s7zaqLlKemjeI0Us.KQCuZnGmVFdAkge/hrQjPKy','1851050093@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(414,'1851050094','$2a$10$c10Qp3e59JgA/2Iw1ywlueKxXNZ9zAJ33vs4wS14JwEEEosEuVQRu','1851050094@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(415,'1851050095','$2a$10$bQ9xk7Jg197vKajwq3sg1eWn7Eeakm7zc2p0ZOVctIjWIAhaOTmli','1851050095@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(416,'1851050096','$2a$10$qW1uNZb3HHQdQZrH1V3P4eQWsvr0lVorrldBt9jOXkhUqEicr39ai','1851050096@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(417,'1851050097','$2a$10$ybh7zgydXf3gYIZguvbHFOmXPzFEl6FXZhERWO8I88ZxrTuLtxj5K','1851050097@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(418,'1851050098','$2a$10$4R1dcz9TUcrlmfKs93rKJu.m0j6dY0sfXS8BHm38EMKztCnMsKhD2','1851050098@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(419,'1851050099','$2a$10$dDc3QlGfsi7lj3Lz4oXe2.mm7SOQKdUO0ZIezsEjGkaWef2C31Woq','1851050099@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(420,'1851050100','$2a$10$Oviy1CKDg9w6ZZPFLtvKde8aqfCBCaEXxG99VAExalmldp.zEiAg.','1851050100@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(421,'1851050101','$2a$10$oWIO/XJYBNe9m0YO23nuoenvIvvhqP9Y.rdH7LDGwZI0bzLznJ/ay','1851050101@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(422,'1851050102','$2a$10$Q77K2PcI0pqJ7pnJSZkajeL09OEzPhm91yJIVMtxDDSEeoIJ8ksra','1851050102@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(423,'1851050103','$2a$10$4uj4FzLICEhnHA9/hY8sWOshJs.6iAQZDyEc1jGWwR7OyX67n6pD.','1851050103@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(479,'2051052001','$2a$10$3ddNhC.d6PT7T/lhSL6G3usuQVGh6j4h6Dskh.27gsllSkbvXSV5y','2051052001@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(480,'2051052002','$2a$10$k67EijRvMc1R0OCiEnQAQO9XTi3D8EuDE8rm6EnEpBaxLoSJG.8/i','2051052002@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(481,'2051052003','$2a$10$eP1PsBZ8DNE3ikmc2Lr9I.HbIyuqsjwY0bPUe8rrbAnZN/LH7JxFu','2051052003@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(482,'2051052004','$2a$10$Y4wP/eldjCKxNh1QjubkzuYYXd7gvSMx55Ahlm.kqSSfHJ9orRmry','2051052004@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(483,'2051052005','$2a$10$mHVZNBdWYC3ElGLoeOHWiuhXqCjwcm5Rdp8.qg9nmoJCUU/WscD9.','2051052005@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(484,'2051052006','$2a$10$t2ZylwmOQzniu.hbfF0PoOQKIFJ56qR6RKyAQvN75LqcjOAXo0ww6','2051052006@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(485,'2051052007','$2a$10$UklWS2zS/z1r1Fq2KaJRZOWy97eln7Y5pDQjNMVxB8BBLXb62sw5q','2051052007@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(486,'2051052008','$2a$10$uvxZoaVXMWqcovOj9qRZIe08toOdP1BtLXe4XSt4IgKCZbjzpQEZ2','2051052008@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(487,'2051052009','$2a$10$wS4GzmWzzcjtw8qFNZDzvuzM7JGlUalv6ew9EQzU3gDiNShmM/3ze','2051052009@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(488,'2051052010','$2a$10$Zhvy/IXQRYH/mTlfrJUqT.vCHCJuzafZIv2cAS65.R6zZ9yBf7.ye','2051052010@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(489,'2051052011','$2a$10$Ds96SJ/i8DIHRqSyK.mre.6yTKJdIwz.qBP1s/acMqmgnGKmNh6VG','2051052011@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(490,'2051052012','$2a$10$0EwwVg8CDfS7l/88lrgwlu/Ozmwgw2doY.fpwiqx/tr66Esj8YYOi','2051052012@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(491,'2051052013','$2a$10$f.2KtJXaZLYLeJMgkaEITO.VFl2GSC9E8je5zf1hPHmrJdycidPve','2051052013@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(492,'2051052014','$2a$10$SEXmy62WN7lzQJpTgeIiWu.LdVkzx.VoRFEKgKP70OZMjkpkjt0vW','2051052014@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(493,'2051052015','$2a$10$kf9WbJqVZ1w19SCNgX1a5.zL0wnO2fBmiBj4EEvCV//281JjDk2ay','2051052015@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(494,'2051052016','$2a$10$9UBnF1sN7fj7vTtiYu9uQeANF2YSsFe.q7W8yb304IUEGYPJlM.q2','2051052016@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(495,'2051052017','$2a$10$f0MU/k662LtPOeWPwvHQ/ehZUQRgREop3Bf9awptPIMfnbEOVW5EG','2051052017@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(496,'2051052018','$2a$10$gqkQLRYbv0d3b/uEEMlDYePWQwWlhG/eXU1Yj1xpzYxBlXxO2NFNW','2051052018@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(497,'2051052019','$2a$10$RvALNg97r2vBXA/C8EeU4OzphY5ZOYQozi795Hfe6l8tA46ZgAuP.','2051052019@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(498,'2051052020','$2a$10$nWD4qhcebihXF.iT1SAnUunLmEDqCrk7EhL9pnsU4TKwZW746s0rm','2051052020@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(499,'2051052021','$2a$10$VFbPOaTlfM/2chafUMhtgOzfTqW9nYIj9cyJ5kxiHOQ6UQjTSG5Ma','2051052021@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(500,'2051052127','$2a$10$fubyeMXSXiBNxKTfqbIWluAKT9Ivl6LVjmfMewtHIYlX4Lb1B3JIG','2051052127@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(501,'2051052054','$2a$10$XIBa.mmI.XS/BrKStx7jBuu0fqrJDKCHHRNfAy0DA3FVKgRjieICC','2051052054@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(502,'2051052024','$2a$10$SbV0um0PtdBkQbuHk7FXxuRNihMRm39EoflDouF9hmjsTAhg.FfOS','2051052024@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(503,'2051052025','$2a$10$S5ywHzWjh8EIdLcpqiFnLOjquhFgG96BNFe/9.kJk/jJe0oO3Ez6.','2051052025@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(504,'2051052026','$2a$10$o015icQ9l/oqqJ1TGRsmG.x5DI4Z7fls5GOQPGTy9E93p..Xraozm','2051052026@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(505,'2051052027','$2a$10$OzCjy1uy8WchlKxh./y.he0Kk7Am7a6INxbYXM4oFMc3hGc6WUfeu','2051052027@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(506,'2051052028','$2a$10$UFuesv8oCzo4UYThlHe72.CRkcOdQy03qOmFN5Ngw.wIGwhxhAC9m','2051052028@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(507,'2051052029','$2a$10$ns1Zj1.jfRz3hpwc8KWpVeH/N4KKhUWo5s3zCwfOX3fQ3wF.tCRcy','2051052029@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(508,'2051052030','$2a$10$VL/b2eKiztsIRjsjwD95yeWKJifJPvYF6LkwSn0ll82dbpI64J85u','2051052030@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(509,'2051052031','$2a$10$G8C7tCTwpelHvEPRoY4HNOR7cOkm4rLz/dtMC3CHRux54qPsFzcm2','2051052031@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(510,'2051052032','$2a$10$zkmcmCiDjgxsoBrKneg.We0JTDrdDy/OY8HNdXbu8YiQwQv7u9wBS','2051052032@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(511,'2051052033','$2a$10$lYObZlYYep.pwv4V1DoNJ.fXgDq6t.qCrvlnkTqywZTosfVV92LMC','2051052033@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(512,'2051052034','$2a$10$wSWuK/w25mbJK7UbL3E6t.7qiVOnurP3HA7QY8VfHu3JvTZ1oBb2G','2051052034@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(513,'2051052035','$2a$10$5CwDTVU5G6oSmuXveSsOauKGkx/yKRg.Hr4g96/QzkoiuCEPZiJ/u','2051052035@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(514,'2051052036','$2a$10$nGy1IHgcLLCmUSR0q3/iSOLxUGlSGam5540ANmWE38/q.Igdf8b5a','2051052036@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(515,'2051052037','$2a$10$W0crI2RUnD6C5PRelskxlufYiKqHMziao3GZig5UkI7Jr8.CFkOQa','2051052037@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(516,'2051052038','$2a$10$Ho0H83XfHlbIK.4eC7odK.ziJ9wUCMbKhIztQCySfJj5KWeObP.G2','2051052038@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(517,'2051052039','$2a$10$LKWhTe5M8O88txpexPgzX.CDTp6H97jInQDGOJMX07mXiBcEhjjeK','2051052039@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(518,'2051052040','$2a$10$O49b6Lgxrv0SasVpBuAUXuvVgUOCXGLVPbkZXi5PHXft.s4f7KhaW','2051052040@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(519,'2051052041','$2a$10$LS7mUZWbnhZ/Z1tsQaCRT.pxiB1315c9GrBFC4O7jbntr0jH8CoSK','2051052041@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(520,'2051052042','$2a$10$GXo8nHES.jZiQV0sOQDWv.pf1fH7iKVTXhcS2Bv7pvCihQwMU5dyW','2051052042@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(521,'2051052043','$2a$10$yutlxtYVQzN4gTC0l3oxxOT6Fjb/b4uIUtI/I9pQ8GHCRA2WSEFPy','2051052043@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(522,'2051052044','$2a$10$pOyBPgGeMdRJlzVLI4.x5u5/k5MYz0ZGrPBh2ZaH0FmqbdTnhfewy','2051052044@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(523,'2051052045','$2a$10$KMwWZaDB8LgKF7UiOxq7COUChX.7IxIGw.4KdKTDmaossoa5iBCsK','2051052045@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(533,'2051052046','$2a$10$OBvxtn38IUwd6IXfMbjo6e6R7VlSaBKQRkx6CPYLEseofPXCPbAUy','2051052046@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(534,'2051052047','$2a$10$F1Cg3Q./1wBK1TmGAan/3u/jpOU2s.jy/SQkVWfTQ049fX2xpfW2y','2051052047@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(535,'2051052048','$2a$10$tTvg3jhMyLcLe6Va6us38OxVxj8xvbFTszrM71lRulaKlT7OCsvAm','2051052048@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(536,'2051052049','$2a$10$H5KmW9W6fDwq4Yirga24nuEdz4r4PoD2F2/B4H8WZ8UZvvysNdCMm','2051052049@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(537,'2051052050','$2a$10$.alkAbYXChJOEJELDicaEuhMgLvYl895MJLK4GA3pzhyOrILbUQoK','2051052050@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(538,'2051052051','$2a$10$MqQegL5fgB/fQBykcxHMOOCgX9I5iAePAFZxTnIf7rmP/zTAgbPIa','2051052051@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(539,'2051052052','$2a$10$RDf2ffARgAV6dupsxc3ViuIaoQAixyGzPET4v0W2VXkO8jb5oAz7i','2051052052@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(540,'2051052053','$2a$10$Su45sFIGtr0ePz9w46lXYe1EgQEJ5vMUszgG5.otIs6EZGYfV2c0W','2051052053@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(541,'2051052086','$2a$10$8iiTc.c4in90hdViflvCx.Le4YqdQxltwYPDdH/KuuKbzZrynSrki','2051052086@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(542,'2051052055','$2a$10$/Bs.blPQFQZiNRUOczb2.epu6ZDpE0lnr0HwP2AOEvppvk0HpY8JS','2051052055@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(543,'2051052056','$2a$10$cP5vb/FD/hu9NY0d5G15xOkK9I.fsBcTwxbJxwfz652lSuQ4UY/0q','2051052056@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(544,'2051052057','$2a$10$kSrCilkoo7iu8ROihku1n.XvcAOFKHXKb1ioKerWWNwwGTUYVaJHi','2051052057@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(545,'2051052058','$2a$10$f9IEf6mQEU7zcB3u8n62Je1Acz3a0gvd2T39eSKMOVyufF2Pp6XaW','2051052058@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(546,'2051052059','$2a$10$AMHDFcdC4xmnHMJgUaM1MONbUowjx1nWYsM6ZOPK/izGxXP6B380K','2051052059@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(547,'2051052060','$2a$10$oF7q/5UMfvTL0Kfm5JQtBeSFyas1Uhgefw0fXkzsBRVIvfatn.5Ga','2051052060@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(548,'2051052061','$2a$10$Krjm.c2Dmc40Mh8QjT8rNu9bf3bfiTbLG2fNP5htu49MRLJ0gwKLO','2051052061@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(549,'2051052062','$2a$10$ETTDK6Pfw.sLdZnEDQD9Z.hxMC1sDhSfT0Gx4V7iRaTCTFzES0Mba','2051052062@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(550,'2051052063','$2a$10$ZtwzmRsx9nhfxcsiWuK8K.AFppC0LktpmOVBYdJ7/KRydOAf8JL9C','2051052063@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(551,'2051052064','$2a$10$G1c8Ns5yfdbomZl1q85G.uSD2WTyGY0n299DMQvpNxlco7REEurDu','2051052064@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(552,'2051052065','$2a$10$SkN4lqQ2KOO1k4.5XO6W0.bXZbK2OnybgSzinmQD/7GJQwLyNWvvS','2051052065@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(553,'2051052066','$2a$10$axVmKziHSeL3XbZJgS5VNeH.UIrspUmYDvEvRZ/Adw9hwXASSbB.G','2051052066@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(554,'2051052067','$2a$10$NXB3RilQ7.7iYO.FicZkte4qTKcoR8kD9pNhiUFVMeVgCi4FDwpxq','2051052067@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(555,'2051052068','$2a$10$3AE/6AaxjB3R4U.w/KP8LuTDrOR7CGnGD.jKjVSznnjOSO3lqWIMS','2051052068@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(556,'2051052069','$2a$10$CgrG2K32OvPpE1YjGrGl..3ZjGP5nU22o4wfkYqyuHQfhFZWSOhoC','2051052069@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(557,'2051052070','$2a$10$iN8Ruys7m1Sv25X1I8umWOqunQB4dkvn.CaKyUnJBbDl7l7j1Ryc.','2051052070@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(558,'2051052071','$2a$10$42.BloXUejW2aODOrTzKmuAvA0lvWasOhaYLfEPaDhh/88nTyM/Ti','2051052071@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(559,'2051052072','$2a$10$WLl9LA6guXFBODRPfQlJSOxoESe.AQbtM7LWRaju.dQl26SvOZX3i','2051052072@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(560,'2051052073','$2a$10$pRTn8UF9ppcd0Eek0gyODe1gLaVadI6/sYpsU8CE3W1EBnY1DHdY2','2051052073@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(561,'2051052074','$2a$10$SkbeO//KkrGtRCjsy.CU.uJUbR9YgKmSKcgf8vX0CBQMt4vs2LJ5a','2051052074@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(562,'2051052075','$2a$10$VflihWRZ/zuCiET8LMKXAeBO6q85xmQl8prLnO.u1qFA5RU7x/kWe','2051052075@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(563,'2051052076','$2a$10$U9AXb7moCZKt9IdnB8IQJuQdvQdVcWED8ZfqMJohu6KUm4P1p.0Qm','2051052076@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(564,'2051052077','$2a$10$7Ufz8VzOydbKLenLu6155.na1pPxnI02SOh0QUMZ6lxgLkuySa3hG','2051052077@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(565,'2051052078','$2a$10$TGN/FkLhk6GV85c5F8btG.IZau6jKcCxiO.8bgVapvsYQ7iIzIzRm','2051052078@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(566,'2051052079','$2a$10$LKJjy.acFcROmcTAG2pkrOJTUwJXvFHd0bjF57cKkfeENagpmBkp.','2051052079@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(567,'2051052080','$2a$10$Y680Vg5BF9G6DmOX1hIbMeyJHISgov5E/GfSJdSaRxMHM9cqK801e','2051052080@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(568,'2051052081','$2a$10$.U4D8xfP2C4Cv9sDUTR/ruhraTljJJglidLJ6PXdUioBBeh8Qb0Z.','2051052081@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(569,'2051052082','$2a$10$J48CN2So/u4DqWvVmzEQz.ozHlHl2OM3ncx0sIpcaaE98YtYo38vW','2051052082@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(570,'2051052083','$2a$10$yaQR2oV8ywh.WLQSNoYGEePoG17W8wq7fZB9AN7TcwAC3eANy3Ea2','2051052083@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(571,'2051052084','$2a$10$yWUX/UoHTia0BkGiJx6MgOAUBsuvRJWqSRZPpLp3cEFWqFxjx.IB2','2051052084@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(572,'2051052085','$2a$10$V7q7RlZAiWNcXtyDp93Pqu18nRSWECz6QJw0Z8WrfVRoORGTlXHei','2051052085@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(573,'bich.nd','$2a$10$KJjlU6SkH388xgJ269NaGOdQaYcf3KDh2gew/xlh2qR.NQEgJ4PwC','bich.nd@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715264689/shxlnock5fpdf566af3d.webp'),(574,'trang.lt','$2a$10$rSxiD3AZbLuFzBDBZnDYxuEfD/0r0LPWDpiwqS5iSitVATOP39.Ge','trang.lt@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715264740/sje3zgm6qf7uqsfyh6zk.webp'),(575,'minh.lq','$2a$10$Bdvm5wB94kcoOxeZd244o.szclJ9Ril.6j79ruQfTKfLgCNFbdcsG','minh.lq@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715264808/glmkzajiclqxkdgmddjf.jpg'),(577,'sinh.nh','$2a$10$lwoc9HSDJqUcoboBCQFTseQ6/kLYpDFExwSE7av/dJJHRKBokFQxS','sinh.nh@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715265010/xe6v8weivmzqy2iskv9f.jpg');
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

-- Dump completed on 2024-05-09 21:58:48
