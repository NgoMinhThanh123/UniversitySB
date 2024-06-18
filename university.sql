-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: db_example
-- ------------------------------------------------------
-- Server version	8.4.0

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
  `content` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` date NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_idx` (`post_id`),
  KEY `user6_id_idx` (`user_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user6_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (21,'Mình cũng đồng ý với bạn.','2024-05-11',714,31),(23,'drsgdfg','2024-05-21',627,33),(26,'test ','2024-06-14',715,34),(31,'hay quá','2024-06-16',619,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_program`
--

LOCK TABLES `education_program` WRITE;
/*!40000 ALTER TABLE `education_program` DISABLE KEYS */;
INSERT INTO `education_program` VALUES (1,'NMTH','12023','MCNTT'),(2,'CSLT','12023','MCNTT'),(3,'DSTT','12023','MCNTT'),(4,'KTMT','22023','MCNTT'),(5,'KTLT','22023','MCNTT'),(6,'GT','22023','MCNTT'),(7,'OOP','32023','MCNTT'),(8,'CSDL','32023','MCNTT'),(9,'CNMLN','32023','MCNTT'),(10,'LUATKT','12024','MCNTT'),(11,'TKW','12024','MCNTT'),(12,'DCSVN','12024','MCNTT'),(13,'LTDD','12024','MCNTT'),(18,'KN','12024','MCNTT'),(25,'QTM','22024','MCNTT'),(26,'LTJV','22024','MCNTT'),(27,'PLDC','22024','MCNTT'),(28,'ATHTTT','32024','MCNTT'),(29,'KTPM','32024','MCNTT');
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
INSERT INTO `faculty` VALUES ('CNSH','Công nghệ sinh học '),('CNTT','Công nghệ thông tin'),('KINHTE','Kinh tế và Quản lý công'),('KTKT','Kế toán - Kiểm toán'),('LUAT','Luật'),('NN','Ngoại ngữ'),('NT','Nghệ thuật'),('QTKD','Quản trị kinh doanh'),('TCNH','Tài chính - Ngân hàng'),('TCT','Toán, Lý luận chính trị'),('test','test1'),('XD','Xây dựng'),('XHHCTXHDNA','XHH - CTXH - DNA');
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
  `position` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `classes_id` varchar(8) DEFAULT NULL,
  `faculty_id` varchar(10) NOT NULL,
  `degree` varchar(50) DEFAULT NULL,
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
INSERT INTO `lecturer` VALUES ('anh.phch','Phạm Hùng Cẩm Huyên Anh','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm 1','anh.phch@gmail.com','Chuyên viên CTĐT',618,NULL,'CNTT','Cử nhân'),('bay.nv','Nguyễn Văn Bảy','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 2','bay.nv@gmail.com','Chuyên viên CTSV',619,NULL,'CNTT','Thạc sĩ'),('bich.nd','Dư Ngọc Bích','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm','bich.nd@gmail.com','Giảng viên',620,NULL,'LUAT','Tiến sĩ'),('dat.nt','Nguyễn Tiến Đạt','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','dat.nt@gmail.com','Trưởng bộ môn Hệ thống thông tin',621,NULL,'CNTT','Tiến sĩ'),('khai.hq','Hồ Quang Khải','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','khai.hq@gmail.com','Giảng viên',622,NULL,'CNTT','Thạc sĩ'),('khue.ptm','Phan Trần Minh Khuê','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','khue.ptm@gmail.com','Trưởng bộ môn Khoa học dữ liệu',623,NULL,'CNTT','Tiến sĩ'),('minh.lq','Lê Minh Quang','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','minh.lq@gmail.com','Giảng viên',624,NULL,'CNTT','Tiến sĩ'),('phuong.lq','Lưu Quang Phương','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','phuong.lq@gmail.com','Giảng viên',625,NULL,'CNTT','Thạc sĩ'),('sinh.nh','Nguyễn Hoàng Sinh','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','sinh.nh@gmail.com','Phụ trách Khoa Quản trị Kinh doanh',625,NULL,'QTKD','Tiến sĩ'),('thanh.dh','Dương Hữu Thành','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','thanh.dh@gmail.com','Phó Trưởng Bộ môn Cơ sở ngành',627,NULL,'CNTT','Thạc sĩ'),('trang.ntm','Nguyễn Thị Mai Trang','1990-09-27',0,'0979305882','0979305882','Nguyễn Kiệm 1','trang.ntm@gmail.com','Giảng viên',628,NULL,'CNTT','Thạc sĩ'),('tuan.lv','Lê Viết Tuấn','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm 1','tuan.lv@gmail.com','Trưởng Bộ môn Trí tuệ nhân tạo',629,NULL,'CNTT','Tiến sĩ'),('vinh.th','Trương Hoàng Vinh','1990-09-27',1,'0979305882','0979305882','Nguyễn Kiệm','vinh.th@gmail.com','Phụ trách khoa',630,NULL,'CNTT','Tiến sĩ');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_subject`
--

LOCK TABLES `lecturer_subject` WRITE;
/*!40000 ALTER TABLE `lecturer_subject` DISABLE KEYS */;
INSERT INTO `lecturer_subject` VALUES (12,'bich.nd','CNMLN'),(13,'dat.nt','OOP'),(14,'khai.hq','CSDL'),(15,'khue.ptm','LTDD'),(16,'minh.lq','DSTT'),(17,'phuong.lq','MMT'),(18,'sinh.nh','KN'),(19,'thanh.dh','TKW'),(20,'thanh.dh','KTLT'),(21,'vinh.th','KTMT'),(22,'thanh.dh','CSLT');
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_time` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user5_id_idx` (`user_id`),
  CONSTRAINT `user7_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (30,'Test','Test','2024-05-09',632),(31,'Ý kiến về thời gian học tập?','Em thấy thời gian thực tập nay khá khó cho sinh viên.\n','2024-05-11',714),(32,'Kim tài','Tester 1','2024-05-15',702),(33,'Ý kiến','test','2024-05-21',714),(34,'Test','Test demo','2024-06-04',714);
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
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (393,'32023',181),(394,'32023',182),(395,'32023',183),(396,'32023',184),(397,'32023',185),(398,'32023',186),(399,'32023',187),(400,'32023',188),(401,'32023',189),(402,'32023',190),(403,'32023',191),(404,'32023',192),(405,'32023',193),(406,'32023',194),(407,'32023',195),(408,'32023',196),(409,'32023',197),(410,'32023',198),(411,'32023',199),(412,'32023',200),(413,'32023',201),(414,'32023',202),(415,'32023',203),(416,'32023',204),(417,'32023',205),(418,'32023',206),(419,'32023',207),(420,'32023',208),(421,'32023',209),(422,'32023',210),(423,'32023',211),(424,'32023',212),(425,'32023',213),(426,'32023',214),(427,'32023',215),(428,'32023',216),(429,'32023',217),(430,'32023',218),(431,'32023',219),(432,'32023',220),(433,'32023',221),(434,'32023',222),(435,'12023',223),(436,'12023',224),(437,'12023',225),(438,'12023',226),(439,'12023',227),(440,'12023',228),(441,'12023',229),(442,'12023',230),(443,'12023',231),(444,'12023',232),(445,'12023',233),(446,'12023',234),(447,'12023',235),(448,'12023',236),(449,'12023',237),(450,'12023',238),(451,'12023',239),(452,'12023',240),(453,'12023',241),(454,'12023',242),(455,'12023',243),(456,'12023',244),(457,'12023',245),(458,'12023',246),(459,'12023',247),(460,'12023',248),(461,'12023',249),(462,'12023',250),(463,'12023',251),(464,'12023',252),(465,'12023',253),(466,'12023',254),(467,'12023',255),(468,'12023',256),(469,'12023',257),(470,'12023',258),(471,'12023',259),(472,'12023',260),(473,'12023',261),(474,'12023',262),(475,'12023',263),(476,'12023',264),(477,'12024',265),(478,'12024',266),(479,'12024',267),(480,'12024',268),(481,'12024',269),(482,'12024',270),(483,'12024',271),(484,'12024',272),(485,'12024',273),(486,'12024',274),(487,'12024',275),(488,'12024',276),(489,'12024',277),(490,'12024',278),(491,'12024',279),(492,'12024',280),(493,'12024',281),(494,'12024',282),(495,'12024',283),(496,'12024',284),(497,'12024',285),(498,'12024',286),(499,'12024',287),(500,'12024',288),(501,'12024',289),(502,'12024',290),(503,'12024',291),(504,'12024',292),(506,'12024',294),(507,'12024',295),(508,'12024',296),(509,'12024',297),(510,'12024',298),(511,'12024',299),(512,'12024',300),(513,'12024',301),(514,'12024',302),(515,'12024',303),(516,'12024',304),(518,'12024',306),(523,'12023',311),(524,'12023',312),(525,'22023',313),(526,'22023',314),(527,'32023',315),(533,'12024',323),(534,'12024',324);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_value`
--

LOCK TABLES `score_value` WRITE;
/*!40000 ALTER TABLE `score_value` DISABLE KEYS */;
INSERT INTO `score_value` VALUES (412,3,394,1),(413,2,393,1),(414,10,403,1),(415,5,395,1),(416,5,400,1),(417,4,396,1),(418,8,407,1),(419,10,401,1),(420,6,420,1),(421,6,404,1),(422,10,402,1),(423,5,418,1),(424,5,397,1),(425,6,428,1),(426,7,399,1),(427,10,411,1),(428,6,430,1),(429,5,406,1),(430,5,419,1),(431,6,422,1),(432,5,410,1),(433,6,421,1),(434,6,429,1),(435,5,412,1),(436,5,413,1),(437,5,415,1),(438,6,425,1),(439,6,431,1),(440,5,416,1),(441,6,427,1),(442,5,417,1),(443,5,398,1),(444,0,405,1),(445,6,424,1),(446,8,434,1),(447,5,408,1),(448,5,414,1),(449,6,423,1),(450,8,432,1),(451,8,433,1),(452,6,426,1),(453,6,409,1),(454,6,418,2),(455,6,411,2),(456,6,421,2),(457,6,432,2),(458,6,399,2),(459,6,394,2),(460,6,402,2),(461,6,395,2),(462,6,397,2),(463,6,420,2),(464,6,427,2),(465,6,431,2),(466,6,433,2),(467,6,401,2),(468,6,417,2),(469,6,426,2),(470,6,407,2),(471,6,396,2),(472,6,400,2),(473,6,414,2),(474,6,398,2),(475,6,415,2),(476,6,429,2),(477,6,406,2),(478,6,428,2),(479,6,423,2),(480,6,408,2),(481,6,416,2),(482,6,422,2),(483,6,434,2),(484,6,393,2),(485,6,413,2),(486,6,403,2),(487,6,412,2),(488,6,419,2),(489,6,409,2),(490,6,425,2),(491,6,424,2),(492,6,430,2),(493,6,404,2),(494,6,405,2),(495,6,410,2),(496,10,404,3),(497,10,400,3),(498,10,395,3),(499,10,422,3),(500,10,417,3),(501,10,431,3),(502,10,428,3),(503,10,397,3),(504,10,394,3),(505,10,402,3),(506,10,432,3),(507,10,396,3),(508,10,433,3),(509,10,403,3),(510,10,427,3),(511,10,393,3),(512,10,423,3),(513,10,411,3),(514,10,405,3),(515,10,426,3),(516,10,429,3),(517,10,425,3),(518,10,408,3),(519,10,434,3),(520,10,421,3),(521,10,418,3),(522,10,415,3),(523,10,398,3),(524,10,413,3),(525,10,419,3),(526,10,410,3),(527,10,399,3),(528,10,412,3),(529,10,424,3),(530,10,406,3),(531,10,420,3),(532,10,414,3),(533,10,407,3),(534,10,401,3),(535,10,430,3),(536,10,409,3),(537,10,416,3),(538,8,435,2),(539,7,435,3),(540,9,436,2),(541,8,436,3),(542,5,437,2),(543,8,437,3),(544,7,438,2),(545,7,438,3),(546,8,439,2),(547,7,439,3),(548,9,440,2),(549,8,440,3),(550,5,441,2),(551,8,441,3),(552,7,442,2),(553,7,442,3),(554,8,443,2),(555,7,443,3),(556,9,444,2),(557,8,444,3),(558,8,475,1),(559,8,475,2),(560,8,475,3),(564,5,527,1),(565,7,527,2),(566,9,527,3),(567,8,477,2),(568,7,477,3),(569,9,478,2),(570,9,478,3),(571,9,478,2),(572,9,478,3),(573,9,479,1),(574,4,479,2),(575,5,479,3),(576,9,478,2),(577,9,478,3),(578,9,479,1),(579,4,479,2),(580,5,479,3),(581,9,478,2),(582,9,478,3),(583,9,479,1),(584,4,479,2),(585,5,479,3),(586,9,478,2),(587,9,478,3),(588,9,479,1),(589,4,479,2),(590,5,479,3),(591,9,478,2),(592,9,478,3),(593,9,479,1),(594,4,479,2),(595,5,479,3),(596,9,478,2),(597,9,478,3),(598,9,479,1),(599,4,479,2),(600,5,479,3),(601,9,478,2),(602,9,478,3),(603,9,479,1),(604,4,479,2),(605,5,479,3),(606,9,478,2),(607,9,478,3),(608,9,479,1),(609,4,479,2),(610,5,479,3),(611,9,478,2),(612,9,478,3),(613,9,479,1),(614,4,479,2),(615,5,479,3),(616,9,478,2),(617,9,478,3),(618,9,479,1),(619,4,479,2),(620,5,479,3),(621,9,478,2),(622,9,478,3),(629,9,525,2),(630,9,525,3);
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
INSERT INTO `semester` VALUES ('12020','Học kì 1',2020,'2020-09-12','2020-01-22'),('12021','Học kì 1',2021,'2021-09-12','2021-01-22'),('12022','Học kì 1',2022,'2022-09-12','2022-01-22'),('12023','Học kì 1',2023,'2023-09-12','2023-01-22'),('12024','Học kì 1',2024,'2024-09-12','2024-01-22'),('22020','Học kì 2',2020,'2020-02-12','2020-04-22'),('22021','Học kì 2',2021,'2021-02-12','2021-04-22'),('22022','Học kì 2',2022,'2022-02-12','2022-04-22'),('22023','Học kì 2',2023,'2023-02-12','2023-04-22'),('22024','Học kì 2',2024,'2024-02-12','2022-04-22'),('32020','Học kì 3',2020,'2020-05-12','2020-07-22'),('32021','Học kì 3',2021,'2021-05-12','2021-07-22'),('32022','Học kì 3',2022,'2022-05-12','2022-07-22'),('32023','Học kì 3',2023,'2023-05-12','2023-07-22'),('32024','Học kì 3',2024,'2024-05-12','2024-07-22');
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
INSERT INTO `student` VALUES ('2051052046','Lê Trường An','2002-10-04',1,'0979305883','0979305889','Nguyễn Kiệm 7',631,'DH20LU01','LUAT','MLUAT'),('2051052047','Nguyễn Thị Minh Anh','2002-10-05',1,'0979305884','0979305890','Nguyễn Kiệm 8',632,'DH20LU01','LUAT','MLUAT'),('2051052048','Lê Huy Bắc','2002-10-06',1,'0979305885','0979305891','Nguyễn Kiệm 9',633,'DH20LU01','LUAT','MLUAT'),('2051052049','Triệu Văn Bảo','2002-10-07',1,'0979305886','0979305892','Nguyễn Kiệm 10',634,'DH20LU01','LUAT','MLUAT'),('2051052050','Hồ Chung Bảo','2002-10-09',1,'0979305887','0979305893','Nguyễn Kiệm 11',635,'DH20LU01','LUAT','MLUAT'),('2051052051','Lương Xuân Bảo','2002-10-09',1,'0979305888','0979305894','Nguyễn Kiệm 12',636,'DH20LU01','LUAT','MLUAT'),('2051052052','Nguyễn Thanh Bình','2002-10-09',1,'0979305889','0979305895','Nguyễn Kiệm 13',637,'DH20LU01','LUAT','MLUAT'),('2051052053','Doãn Thị Linh Chi','2002-10-09',1,'0979305890','0979305896','Nguyễn Kiệm 14',638,'DH20LU01','LUAT','MLUAT'),('2051052055','Trần Văn Đạt','2002-10-09',1,'0979305892','0979305898','Nguyễn Kiệm 16',640,'DH20LU01','LUAT','MLUAT'),('2051052056','Vương Qui Đạt','2002-10-09',1,'0979305893','0979305899','Nguyễn Kiệm 17',641,'DH20LU01','LUAT','MLUAT'),('2051052057','Phan Văn Đạt','2002-10-09',1,'0979305894','0979305900','Nguyễn Kiệm 18',642,'DH20LU01','LUAT','MLUAT'),('2051052058','Nguyễn Văn Đạt','2002-10-09',1,'0979305895','0979305901','Nguyễn Kiệm 19',643,'DH20LU01','LUAT','MLUAT'),('2051052059','Nguyễn Ngọc Diễm','2002-10-09',1,'0979305896','0979305902','Nguyễn Kiệm 20',644,'DH20LU01','LUAT','MLUAT'),('2051052060','Lý Nguyễn Thanh Hoa','2002-10-09',1,'0979305897','0979305903','Nguyễn Kiệm 21',645,'DH20LU01','LUAT','MLUAT'),('2051052061','Võ Phú Hoài','2002-10-09',1,'0979305898','0979305904','Nguyễn Kiệm 22',646,'DH20LU01','LUAT','MLUAT'),('2051052062','Bùi Xuân Hoàn','2002-10-09',1,'0979305899','0979305905','Nguyễn Kiệm 23',647,'DH20LU01','LUAT','MLUAT'),('2051052063','Nguyễn Mạnh Khang','2002-10-09',1,'0979305900','0979305906','Nguyễn Kiệm 24',648,'DH20LU01','LUAT','MLUAT'),('2051052064','Hoàng Ngọc Khanh','2002-10-09',1,'0979305901','0979305907','Nguyễn Kiệm 25',649,'DH20LU01','LUAT','MLUAT'),('2051052065','Vũ Văn Khiêm','2002-10-09',1,'0979305902','0979305908','Nguyễn Kiệm 26',650,'DH20LU01','LUAT','MLUAT'),('2051052066','Trần Đặng Công Minh','2002-10-09',1,'0979305903','0979305909','Nguyễn Kiệm 27',651,'DH20LU01','LUAT','MLUAT'),('2051052067','Đỗ Nhật Minh','2002-10-09',1,'0979305904','0979305910','Nguyễn Kiệm 28',652,'DH20LU01','LUAT','MLUAT'),('2051052068','Nguyễn Công Quang Minh','2002-10-09',1,'0979305905','0979305911','Nguyễn Kiệm 29',653,'DH20LU01','LUAT','MLUAT'),('2051052069','Đoàn Hồng Ngọc','2002-10-09',1,'0979305906','0979305912','Nguyễn Kiệm 30',654,'DH20LU01','LUAT','MLUAT'),('2051052070','Tán Vũ Phi Nguyên','2002-10-09',1,'0979305907','0979305913','Nguyễn Kiệm 31',655,'DH20LU01','LUAT','MLUAT'),('2051052071','Trần Tấn Thanh Nhàn','2002-10-09',1,'0979305908','0979305914','Nguyễn Kiệm 32',656,'DH20LU01','LUAT','MLUAT'),('2051052072','Phan Hoàng Nhân','2002-10-09',1,'0979305909','0979305915','Nguyễn Kiệm 33',657,'DH20LU01','LUAT','MLUAT'),('2051052073','Nguyễn Hoàng Minh Nhật','2002-10-09',1,'0979305910','0979305916','Nguyễn Kiệm 34',658,'DH20LU01','LUAT','MLUAT'),('2051052074','Điểu Thị Thu Oanh','2002-11-01',1,'0979305911','0979305917','Nguyễn Kiệm 35',659,'DH20LU01','LUAT','MLUAT'),('2051052075','Trương Hoài Phong','2002-11-02',1,'0979305912','0979305918','Nguyễn Kiệm 36',660,'DH20LU01','LUAT','MLUAT'),('2051052076','Trương Minh Phong','2002-11-03',1,'0979305913','0979305919','Nguyễn Kiệm 37',661,'DH20LU01','LUAT','MLUAT'),('2051052077','Nguyễn Hoàng Phúc','2002-11-04',1,'0979305914','0979305920','Nguyễn Kiệm 38',662,'DH20LU01','LUAT','MLUAT'),('2051052078','Đáng Sỹ Tuân','2002-11-05',1,'0979305915','0979305921','Nguyễn Kiệm 39',663,'DH20LU01','LUAT','MLUAT'),('2051052079','Trần Ngọc Tuấn','2002-11-06',1,'0979305916','0979305922','Nguyễn Kiệm 40',664,'DH20LU01','LUAT','MLUAT'),('2051052080','Nguyễn Minh Tuệ','2002-11-07',1,'0979305917','0979305923','Nguyễn Kiệm 41',665,'DH20LU01','LUAT','MLUAT'),('2051052081','Nguyễn Thanh Tùng','2002-11-09',1,'0979305918','0979305924','Nguyễn Kiệm 42',666,'DH20LU01','LUAT','MLUAT'),('2051052082','Lê Ngọc Tỷ','2002-11-09',1,'0979305919','0979305925','Nguyễn Kiệm 43',667,'DH20LU01','LUAT','MLUAT'),('2051052083','Phan Thị Yến Vi','2002-11-09',1,'0979305920','0979305926','Nguyễn Kiệm 44',668,'DH20LU01','LUAT','MLUAT'),('2051052084','Tôn Thất Vinh','2002-11-09',1,'0979305921','0979305927','Nguyễn Kiệm 45',669,'DH20LU01','LUAT','MLUAT'),('2051052085','Nguyễn Quang Vinh','2002-11-09',1,'0979305922','0979305928','Nguyễn Kiệm 46',670,'DH20LU01','LUAT','MLUAT'),('2051052086','Thái Bình Cơ','2002-10-09',1,'0979305891','0979305897','Nguyễn Kiệm 15',639,'DH20LU01','LUAT','MLUAT'),('2051052087','Đặng Văn Mãi','2002-09-27',1,'0979305882','0979305882','Nguyễn Kiệm',674,'DH20IT02','CNTT','MCNTT'),('2051052088','Trịnh Quốc Thảo','2002-09-28',1,'0979305882','0979305883','Nguyễn Kiệm 1',675,'DH20IT02','CNTT','MCNTT'),('2051052089','Đặng Phạm Đình Chương','2002-09-29',1,'0979305882','0979305884','Nguyễn Kiệm 2',676,'DH20IT02','CNTT','MCNTT'),('2051052090','Phan Lê Hồ','2002-09-30',0,'0979305882','0979305885','Nguyễn Kiệm 3',677,'DH20IT02','CNTT','MCNTT'),('2051052091','Đậu Xuân Hoàng Hùng','2002-10-01',1,'0979305882','0979305886','Nguyễn Kiệm',678,'DH20IT02','CNTT','MCNTT'),('2051052092','Bùi Tiến Phát','2002-10-02',0,'0979305882','0979305887','Nguyễn Kiệm 4',679,'DH20IT02','CNTT','MCNTT'),('2051052093','Nguyễn Kim Bảo Ngân','2002-10-03',1,'0979305882','0979305888','Nguyễn Kiệm 5',680,'DH20IT02','CNTT','MCNTT'),('2051052094','Lê Hồng Phúc','2002-10-04',1,'0979305882','0979305889','Nguyễn Kiệm 6',681,'DH20IT02','CNTT','MCNTT'),('2051052095','Lê Quang Tới','2002-10-05',1,'0979305882','0979305890','Nguyễn Kiệm',682,'DH20IT02','CNTT','MCNTT'),('2051052096','Phan Nhựt Tân','2002-10-06',1,'0979305882','0979305891','Nguyễn Kiệm 7',683,'DH20IT02','CNTT','MCNTT'),('2051052097','Đinh Minh Hiếu','2002-10-07',1,'0979305882','0979305892','Nguyễn Kiệm 8',684,'DH20IT02','CNTT','MCNTT'),('2051052098','Lê Quang Đạt','2002-10-09',1,'0979305882','0979305893','Nguyễn Kiệm 9',685,'DH20IT02','CNTT','MCNTT'),('2051052099','Phạm Tấn Hoàng','2002-10-09',1,'0979305882','0979305894','Nguyễn Kiệm',686,'DH20IT02','CNTT','MCNTT'),('2051052100','Bùi Mạnh Linh','2002-10-09',1,'0979305882','0979305895','Nguyễn Kiệm 10',687,'DH20IT02','CNTT','MCNTT'),('2051052101','Võ Huy Nguyên','2002-10-09',1,'0979305882','0979305896','Nguyễn Kiệm 11',688,'DH20IT02','CNTT','MCNTT'),('2051052102','Nguyễn Thị Hồng Nhật','2002-10-09',0,'0979305882','0979305897','Nguyễn Kiệm 12',689,'DH20IT02','CNTT','MCNTT'),('2051052103','Nguyễn Văn Tài','2002-10-09',1,'0979305882','0979305898','Nguyễn Kiệm',690,'DH20IT02','CNTT','MCNTT'),('2051052104','Bùi Minh Trong','2002-10-09',1,'0979305882','0979305899','Nguyễn Kiệm 13',691,'DH20IT02','CNTT','MCNTT'),('2051052105','Nguyễn Duy Hải Anh','2002-10-09',1,'0979305882','0979305900','Nguyễn Kiệm 14',692,'DH20IT02','CNTT','MCNTT'),('2051052106','Huỳnh Gia Bảo','2002-10-09',1,'0979305882','0979305901','Nguyễn Kiệm 15',693,'DH20IT02','CNTT','MCNTT'),('2051052107','Trần Đức Trọng Hiền','2002-10-09',1,'0979305882','0979305902','Nguyễn Kiệm',694,'DH20IT02','CNTT','MCNTT'),('2051052108','Nguyễn Phạm Xuân Phúc','2002-10-09',1,'0979305882','0979305903','Nguyễn Kiệm 16',695,'DH20IT02','CNTT','MCNTT'),('2051052109','Phan Thị Hoài Thương','2002-10-09',0,'0979305882','0979305904','Nguyễn Kiệm 17',696,'DH20IT02','CNTT','MCNTT'),('2051052110','Nguyễn Anh Tuấn','2002-10-09',1,'0979305882','0979305905','Nguyễn Kiệm 18',697,'DH20IT02','CNTT','MCNTT'),('2051052111','Trần Thị Ngọc Lan','2002-10-09',0,'0979305882','0979305906','Nguyễn Kiệm',698,'DH20IT02','CNTT','MCNTT'),('2051052112','Lê Vĩnh Lâm','2002-10-09',1,'0979305882','0979305907','Nguyễn Kiệm 19',699,'DH20IT02','CNTT','MCNTT'),('2051052113','Nguyễn Hữu Nhật','2002-10-09',1,'0979305882','0979305908','Nguyễn Kiệm 20',700,'DH20IT02','CNTT','MCNTT'),('2051052114','Vương Thái Tường','2002-10-09',1,'0979305882','0979305909','Nguyễn Kiệm 21',701,'DH20IT02','CNTT','MCNTT'),('2051052115','Nguyễn Văn Minh Đức','2002-10-09',1,'0979305882','0979305910','Nguyễn Kiệm',702,'DH20IT02','CNTT','MCNTT'),('2051052116','Huỳnh Tấn Lợi','2002-10-09',1,'0979305882','0979305911','Nguyễn Kiệm 22',703,'DH20IT02','CNTT','MCNTT'),('2051052117','Huỳnh Thị Trang Nhung','2002-10-09',0,'0979305882','0979305912','Nguyễn Kiệm 23',704,'DH20IT02','CNTT','MCNTT'),('2051052118','Nguyễn Thành Dũng','2002-10-09',1,'0979305882','0979305913','Nguyễn Kiệm 24',705,'DH20IT02','CNTT','MCNTT'),('2051052119','Huỳnh Lê Bá Đạt','2002-10-09',1,'0979305882','0979305914','Nguyễn Kiệm',706,'DH20IT02','CNTT','MCNTT'),('2051052120','Lý Bội Đạt','2002-10-09',1,'0979305882','0979305915','Nguyễn Kiệm 25',707,'DH20IT02','CNTT','MCNTT'),('2051052121','Lê Văn Định','2002-10-09',1,'0979305882','0979305916','Nguyễn Kiệm 26',708,'DH20IT02','CNTT','MCNTT'),('2051052122','Hồ Nguyễn Công Sang','2002-11-01',1,'0979305882','0979305917','Nguyễn Kiệm 27',709,'DH20IT02','CNTT','MCNTT'),('2051052123','Nguyễn Thị Ngọc Uyên','2002-11-02',0,'0979305882','0979305918','Nguyễn Kiệm',710,'DH20IT02','CNTT','MCNTT'),('2051052124','Phan Nguyễn Quỳnh Như','2002-11-03',1,'0979305882','0979305919','Nguyễn Kiệm 28',711,'DH20IT02','CNTT','MCNTT'),('2051052125','Nguyễn Đặng Khương Duy','2002-11-04',1,'0979305882','0979305920','Nguyễn Kiệm 29',712,'DH20IT02','CNTT','MCNTT'),('2051052126','Trương Quang Thắng','2002-11-05',1,'0979305882','0979305921','Nguyễn Kiệm 30',713,'DH20IT02','CNTT','MCNTT'),('2051052127','Nguyễn Hoàng Trung Thông','2002-11-06',1,'0979305882','0979305922','Nguyễn Kiệm',714,'DH20IT02','CNTT','MCNTT'),('2051052128','Nguyễn Hữu Tiên','2002-11-07',1,'0979305882','0979305923','Nguyễn Kiệm 31',715,'DH20IT02','CNTT','MCNTT');
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
  `semester_id` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student1_id_idx` (`student_id`),
  KEY `subject3_id_idx` (`subject_id`),
  KEY `semester11_id_idx` (`semester_id`),
  CONSTRAINT `semester11_id` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`),
  CONSTRAINT `student1_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject3_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_subject`
--

LOCK TABLES `student_subject` WRITE;
/*!40000 ALTER TABLE `student_subject` DISABLE KEYS */;
INSERT INTO `student_subject` VALUES (181,1,'2051052087','OOP','32023'),(182,1,'2051052088','OOP','32023'),(183,1,'2051052089','OOP','32023'),(184,1,'2051052090','OOP','32023'),(185,1,'2051052091','OOP','32023'),(186,1,'2051052092','OOP','32023'),(187,1,'2051052093','OOP','32023'),(188,1,'2051052094','OOP','32023'),(189,1,'2051052095','OOP','32023'),(190,1,'2051052096','OOP','32023'),(191,1,'2051052097','OOP','32023'),(192,1,'2051052098','OOP','32023'),(193,1,'2051052099','OOP','32023'),(194,1,'2051052100','OOP','32023'),(195,1,'2051052101','OOP','32023'),(196,1,'2051052102','OOP','32023'),(197,1,'2051052103','OOP','32023'),(198,1,'2051052104','OOP','32023'),(199,1,'2051052105','OOP','32023'),(200,1,'2051052106','OOP','32023'),(201,1,'2051052107','OOP','32023'),(202,1,'2051052108','OOP','32023'),(203,1,'2051052109','OOP','32023'),(204,1,'2051052110','OOP','32023'),(205,1,'2051052111','OOP','32023'),(206,1,'2051052112','OOP','32023'),(207,1,'2051052113','OOP','32023'),(208,1,'2051052114','OOP','32023'),(209,1,'2051052115','OOP','32023'),(210,1,'2051052116','OOP','32023'),(211,1,'2051052117','OOP','32023'),(212,1,'2051052118','OOP','32023'),(213,1,'2051052119','OOP','32023'),(214,1,'2051052120','OOP','32023'),(215,1,'2051052121','OOP','32023'),(216,1,'2051052122','OOP','32023'),(217,1,'2051052123','OOP','32023'),(218,1,'2051052124','OOP','32023'),(219,1,'2051052125','OOP','32023'),(220,1,'2051052126','OOP','32023'),(221,1,'2051052127','OOP','32023'),(222,1,'2051052128','OOP','32023'),(223,1,'2051052087','CSLT','12023'),(224,1,'2051052088','CSLT','12023'),(225,1,'2051052089','CSLT','12023'),(226,1,'2051052090','CSLT','12023'),(227,1,'2051052091','CSLT','12023'),(228,1,'2051052092','CSLT','12023'),(229,1,'2051052093','CSLT','12023'),(230,1,'2051052094','CSLT','12023'),(231,1,'2051052095','CSLT','12023'),(232,1,'2051052096','CSLT','12023'),(233,1,'2051052097','CSLT','12023'),(234,1,'2051052098','CSLT','12023'),(235,1,'2051052099','CSLT','12023'),(236,1,'2051052100','CSLT','12023'),(237,1,'2051052101','CSLT','12023'),(238,1,'2051052102','CSLT','12023'),(239,1,'2051052103','CSLT','12023'),(240,1,'2051052104','CSLT','12023'),(241,1,'2051052105','CSLT','12023'),(242,1,'2051052106','CSLT','12023'),(243,1,'2051052107','CSLT','12023'),(244,1,'2051052108','CSLT','12023'),(245,1,'2051052109','CSLT','12023'),(246,1,'2051052110','CSLT','12023'),(247,1,'2051052111','CSLT','12023'),(248,1,'2051052112','CSLT','12023'),(249,1,'2051052113','CSLT','12023'),(250,1,'2051052114','CSLT','12023'),(251,1,'2051052115','CSLT','12023'),(252,1,'2051052116','CSLT','12023'),(253,1,'2051052117','CSLT','12023'),(254,1,'2051052118','CSLT','12023'),(255,1,'2051052119','CSLT','12023'),(256,1,'2051052120','CSLT','12023'),(257,1,'2051052121','CSLT','12023'),(258,1,'2051052122','CSLT','12023'),(259,1,'2051052123','CSLT','12023'),(260,1,'2051052124','CSLT','12023'),(261,1,'2051052125','CSLT','12023'),(262,1,'2051052126','CSLT','12023'),(263,1,'2051052127','CSLT','12023'),(264,1,'2051052128','CSLT','12023'),(265,1,'2051052087','TKW','12024'),(266,1,'2051052088','TKW','12024'),(267,1,'2051052089','TKW','12024'),(268,1,'2051052090','TKW','12024'),(269,1,'2051052091','TKW','12024'),(270,1,'2051052092','TKW','12024'),(271,1,'2051052093','TKW','12024'),(272,1,'2051052094','TKW','12024'),(273,1,'2051052095','TKW','12024'),(274,1,'2051052096','TKW','12024'),(275,1,'2051052097','TKW','12024'),(276,1,'2051052098','TKW','12024'),(277,1,'2051052099','TKW','12024'),(278,1,'2051052100','TKW','12024'),(279,1,'2051052101','TKW','12024'),(280,1,'2051052102','TKW','12024'),(281,1,'2051052103','TKW','12024'),(282,1,'2051052104','TKW','12024'),(283,1,'2051052105','TKW','12024'),(284,1,'2051052106','TKW','12024'),(285,1,'2051052107','TKW','12024'),(286,1,'2051052108','TKW','12024'),(287,1,'2051052109','TKW','12024'),(288,1,'2051052110','TKW','12024'),(289,1,'2051052111','TKW','12024'),(290,1,'2051052112','TKW','12024'),(291,1,'2051052113','TKW','12024'),(292,1,'2051052114','TKW','12024'),(294,1,'2051052116','TKW','12024'),(295,1,'2051052117','TKW','12024'),(296,1,'2051052118','TKW','12024'),(297,1,'2051052119','TKW','12024'),(298,1,'2051052120','TKW','12024'),(299,1,'2051052121','TKW','12024'),(300,1,'2051052122','TKW','12024'),(301,1,'2051052123','TKW','12024'),(302,1,'2051052124','TKW','12024'),(303,1,'2051052125','TKW','12024'),(304,1,'2051052126','TKW','12024'),(306,1,'2051052128','TKW','12024'),(311,1,'2051052127','DSTT','12023'),(312,1,'2051052127','NMTH','12023'),(313,1,'2051052127','KTLT','22023'),(314,1,'2051052127','GT','22023'),(315,1,'2051052127','CSDL','32023'),(323,1,'2051052127','TKW','12024'),(324,1,'2051052127','OOP','12024');
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
INSERT INTO `subject` VALUES ('ATHTTT','An toàn hệ thống thông tin',3,'MCNTT'),('CNMLN','Chủ nghĩa Mác - Lenin',3,'TCT'),('CSDL','Cơ sở dữ liệu',4,'MCNTT'),('CSLT','Cơ sở lập trình',4,'MCNTT'),('DCSVN','Đảng Cộng Sản Việt Nam',3,'TCT'),('DSTT','Đại số tuyến tính',3,'TCT'),('GT','Giải tích',3,'TCT'),('KN','Khởi nghiệp',3,'MQTKD'),('KTLT','Kỹ thuật lập trình',4,'MCNTT'),('KTMT','Kiến trúc máy tính',3,'MCNTT'),('KTPM','Kiểm thử phần mềm',3,'MCNTT'),('KTVM','Kinh tế vi mô',3,'MKT'),('LTDD','Lập trình trên thiết bị di động	',3,'MCNTT'),('LTJV','Lập trình Java',3,'MCNTT'),('LTMQT','Luật thương mại quốc tế',3,'MLUAT'),('LUATKT','Luật Kinh Tế',3,'MLUAT'),('MMT','Mạng máy tính',3,'MCNTT'),('NMTH','Nhập môn tin học',3,'TH'),('OOP','Lập trình hướng đối tượng',4,'MCNTT'),('PLDC','Pháp luật đại cương',3,'MLUAT'),('PTTKHT','Phân tích và thiết kế hệ thống',4,'MCNTT'),('QPAN201','Giáo dục quốc phòng – An ninh: Quân sự chung',1,'MQPAN'),('QPAN202','Giáo dục quốc phòng – An ninh: Công tác quốc phòng an ninh',2,'MQPAN'),('QPAN203','Giáo dục quốc phòng – An ninh: Kỹ thuật chiến đấu bộ binh và chiến thuật',2,'MQPAN'),('QPAN204','Giáo dục quốc phòng – An ninh: Đường lối quốc phòng và an ninh của Đảng Cộng sản Việt Nam',3,'MQPAN'),('QTM','Quản trị mạng',3,'MCNTT'),('TANC1','Tiếng Anh Nâng Cao 1',3,'MNNA'),('TANC2','Tiếng Anh Nâng Cao 2',3,'MNNA'),('TANC3','Tiếng Anh Nâng Cao 3',3,'MNNA'),('TANC4','Tiếng Anh Nâng Cao 4',3,'MNNA'),('TANC5','Tiếng Anh Nâng Cao 5',3,'MNNA'),('THVP','Tin học văn phòng',4,'TH'),('TKW','Thiết kế web',4,'MCNTT');
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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition_fee`
--

LOCK TABLES `tuition_fee` WRITE;
/*!40000 ALTER TABLE `tuition_fee` DISABLE KEYS */;
INSERT INTO `tuition_fee` VALUES (20,3360000,1,'2024-05-11','32023','2051052119'),(21,3360000,1,'2024-05-12','32023','2051052118'),(22,3360000,1,'2024-05-11','32023','2051052117'),(23,3360000,1,'2024-05-14','32023','2051052116'),(24,3360000,0,NULL,'32023','2051052115'),(25,3360000,0,NULL,'32023','2051052114'),(26,3360000,0,NULL,'32023','2051052113'),(27,3360000,0,NULL,'32023','2051052101'),(28,3360000,0,NULL,'32023','2051052123'),(29,3360000,0,NULL,'32023','2051052089'),(30,3360000,0,NULL,'32023','2051052100'),(31,3360000,0,NULL,'32023','2051052122'),(32,3360000,0,NULL,'32023','2051052088'),(33,3360000,0,NULL,'32023','2051052121'),(34,3360000,0,NULL,'32023','2051052087'),(35,3360000,0,NULL,'32023','2051052120'),(36,3360000,0,NULL,'32023','2051052109'),(37,3360000,0,NULL,'32023','2051052108'),(38,3360000,0,NULL,'32023','2051052107'),(39,3360000,0,NULL,'32023','2051052106'),(40,3360000,0,NULL,'32023','2051052128'),(41,3360000,0,NULL,'32023','2051052105'),(42,3360000,1,'2024-05-10','32023','2051052127'),(43,3360000,0,NULL,'32023','2051052104'),(44,3360000,0,NULL,'32023','2051052126'),(45,3360000,0,NULL,'32023','2051052103'),(46,3360000,0,NULL,'32023','2051052125'),(47,3360000,0,NULL,'32023','2051052102'),(48,3360000,0,NULL,'32023','2051052124'),(49,3360000,0,NULL,'32023','2051052093'),(50,3360000,0,NULL,'32023','2051052092'),(51,3360000,0,NULL,'32023','2051052091'),(52,3360000,0,NULL,'32023','2051052090'),(53,3360000,0,NULL,'32023','2051052112'),(54,3360000,0,NULL,'32023','2051052111'),(55,3360000,0,NULL,'32023','2051052099'),(56,3360000,0,NULL,'32023','2051052110'),(57,3360000,0,NULL,'32023','2051052098'),(58,3360000,0,NULL,'32023','2051052097'),(59,3360000,0,NULL,'32023','2051052096'),(60,3360000,0,NULL,'32023','2051052095'),(61,3360000,0,NULL,'32023','2051052094'),(62,3360000,0,NULL,'12023','2051052119'),(63,3360000,0,NULL,'12023','2051052118'),(64,3360000,1,'2024-05-12','12023','2051052117'),(65,3360000,0,NULL,'12023','2051052116'),(66,3360000,0,NULL,'12023','2051052115'),(67,3360000,0,NULL,'12023','2051052114'),(68,3360000,0,NULL,'12023','2051052113'),(69,3360000,0,NULL,'12023','2051052101'),(70,3360000,0,NULL,'12023','2051052123'),(71,3360000,0,NULL,'12023','2051052089'),(72,3360000,0,NULL,'12023','2051052100'),(73,3360000,0,NULL,'12023','2051052122'),(74,3360000,0,NULL,'12023','2051052088'),(75,3360000,0,NULL,'12023','2051052121'),(76,3360000,0,NULL,'12023','2051052087'),(77,3360000,0,NULL,'12023','2051052120'),(78,3360000,0,NULL,'12023','2051052109'),(79,3360000,0,NULL,'12023','2051052108'),(80,3360000,0,NULL,'12023','2051052107'),(81,3360000,0,NULL,'12023','2051052106'),(82,3360000,0,NULL,'12023','2051052128'),(83,3360000,0,NULL,'12023','2051052105'),(84,3360000,1,'2024-05-13','12023','2051052127'),(85,3360000,0,NULL,'12023','2051052104'),(86,3360000,0,NULL,'12023','2051052126'),(87,3360000,0,NULL,'12023','2051052103'),(88,3360000,0,NULL,'12023','2051052125'),(89,3360000,0,NULL,'12023','2051052102'),(90,3360000,0,NULL,'12023','2051052124'),(91,3360000,0,NULL,'12023','2051052093'),(92,3360000,0,NULL,'12023','2051052092'),(93,3360000,0,NULL,'12023','2051052091'),(94,3360000,0,NULL,'12023','2051052090'),(95,3360000,0,NULL,'12023','2051052112'),(96,3360000,0,NULL,'12023','2051052111'),(97,3360000,0,NULL,'12023','2051052099'),(98,3360000,0,NULL,'12023','2051052110'),(99,3360000,0,NULL,'12023','2051052098'),(100,3360000,0,NULL,'12023','2051052097'),(101,3360000,0,NULL,'12023','2051052096'),(102,3360000,0,NULL,'12023','2051052095'),(103,3360000,0,NULL,'12023','2051052094'),(104,3600000,0,NULL,'12024','2051052119'),(105,3600000,0,NULL,'12024','2051052118'),(106,3600000,0,NULL,'12024','2051052117'),(107,3600000,0,NULL,'12024','2051052116'),(108,3600000,0,NULL,'12024','2051052115'),(109,3600000,0,NULL,'12024','2051052114'),(110,3600000,0,NULL,'12024','2051052113'),(111,3600000,0,NULL,'12024','2051052101'),(112,3600000,0,NULL,'12024','2051052123'),(113,3600000,0,NULL,'12024','2051052089'),(114,3600000,0,NULL,'12024','2051052100'),(115,3600000,0,NULL,'12024','2051052122'),(116,3600000,0,NULL,'12024','2051052088'),(117,3600000,0,NULL,'12024','2051052121'),(118,3600000,0,NULL,'12024','2051052087'),(119,3600000,0,NULL,'12024','2051052120'),(120,3600000,0,NULL,'12024','2051052109'),(121,3600000,0,NULL,'12024','2051052108'),(122,3600000,0,NULL,'12024','2051052107'),(123,3600000,0,NULL,'12024','2051052106'),(124,3600000,0,NULL,'12024','2051052128'),(125,3600000,0,NULL,'12024','2051052105'),(126,3600000,1,'2024-05-13','12024','2051052127'),(127,3600000,0,NULL,'12024','2051052104'),(128,3600000,0,NULL,'12024','2051052126'),(129,3600000,0,NULL,'12024','2051052103'),(130,3600000,0,NULL,'12024','2051052125'),(131,3600000,0,NULL,'12024','2051052102'),(132,3600000,0,NULL,'12024','2051052124'),(133,3600000,0,NULL,'12024','2051052093'),(134,3600000,0,NULL,'12024','2051052092'),(135,3600000,0,NULL,'12024','2051052091'),(136,3600000,0,NULL,'12024','2051052090'),(137,3600000,0,NULL,'12024','2051052112'),(138,3600000,0,NULL,'12024','2051052111'),(139,3600000,0,NULL,'12024','2051052099'),(140,3600000,0,NULL,'12024','2051052110'),(141,3600000,0,NULL,'12024','2051052098'),(142,3600000,0,NULL,'12024','2051052097'),(143,3600000,0,NULL,'12024','2051052096'),(144,3600000,0,NULL,'12024','2051052095'),(145,3600000,0,NULL,'12024','2051052094'),(147,3600000,1,'2024-05-19','12024','2051052127'),(148,3600000,1,'2024-05-21','12024','2051052127'),(149,3600000,0,NULL,'12024','2051052127'),(150,1920000,0,NULL,'12023','2051052127'),(151,2520000,0,NULL,'12023','2051052127'),(152,3360000,0,NULL,'22023','2051052127'),(153,1920000,0,NULL,'22023','2051052127'),(154,3360000,1,'2024-05-21','32023','2051052127'),(155,3600000,0,NULL,'12024','2051052046'),(156,3600000,0,NULL,'12024','2051052127'),(157,3600000,0,NULL,'12024','2051052127'),(158,3600000,0,NULL,'12024','2051052127'),(159,3600000,0,NULL,'12024','2051052127'),(160,3600000,0,NULL,'12024','2051052127'),(161,3600000,0,NULL,'12024','2051052127'),(162,2100000,0,NULL,'32024','2051052127'),(163,2100000,0,NULL,'32024','2051052127'),(164,2100000,0,NULL,'32024','2051052127'),(165,2100000,0,NULL,'32024','2051052127'),(166,2100000,0,NULL,'32024','2051052127'),(167,2100000,0,NULL,'32024','2051052127'),(168,2100000,0,NULL,'32024','2051052127'),(169,2100000,0,NULL,'32024','2051052128'),(170,2100000,0,NULL,'32024','2051052128'),(171,2100000,0,NULL,'32024','2051052128'),(172,2700000,0,NULL,'32024','2051052128'),(173,2700000,0,NULL,'32024','2051052128');
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
) ENGINE=InnoDB AUTO_INCREMENT=716 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (109,'giaovu','$2a$10$mYC5eF4R0oHmGvF0/Vx80.FPrVhSfHBViD1YzBaP283QYU7ELrR4i','giaovu@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605310/dsshxrekvd0ui5o0ov6q.png'),(618,'anh.phch','$2a$10$nuUSQ/SqlnATHAaX2CB2bue42NfwLFN/jdSvM0MEs4ItitFzeUIiy','anh.phch@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269603/azjctjaytwekxmncz06m.png'),(619,'bay.nv','$2a$10$IkIvkJahklX2wSAQn.vKZuDfo2CoP8xiqhgw./WSmLAFAn5EJymxC','bay.nv@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269620/tzmiamuuebvpnoscdcvv.png'),(620,'bich.nd','$2a$10$sPpLcoMH2mJA2l0pW3BAs.sO4.xPeef1AeNKsDRZ4dVPwCMlFHtD2','bich.nd@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269632/esjh0hyxq8vtylk3yyls.png'),(621,'dat.nt','$2a$10$ie4ZudgHIJRMBPTTCY7zkuY.QFxfXq/mS/TrHZrmZ3ZU15lWKsx/a','dat.nt@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269643/u3cm9itznxc3sp3jjaxu.png'),(622,'khai.hq','$2a$10$yCWvjLVXCObMWbX0ao6Zk.JYcqPM4F5WF7gipDSJVnxYEmSsJvUW2','khai.hq@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269656/bfzuwmo5jl31hlzmdaf6.png'),(623,'khue.ptm','$2a$10$NlNXB5yQI4k/9UJE/LLhguv1EgIRRA97kKdQzcHJqkaZTkrL8Bu/6','khue.ptm@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269665/lrjjflknjwrssm5c1dnx.png'),(624,'minh.lq','$2a$10$qha8Cb3NOEx5023duepDsOwfc05w1XezSQYKNke/Po1jhUUiv1tOe','minh.lq@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269674/j80ytj23jzim3bar2dbq.png'),(625,'phuong.lq','$2a$10$VG9rgZ7MKtYRxzXTxsKARu2hW2LiVxtgp.AJg6bIiSFlW.wtGYA/O','phuong.lq@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269684/rvhyn8p04c6haeylrkzu.png'),(626,'sinh.nh','$2a$10$9MOfu8J2.T1F8exTlE52OOVTv7bNtHF26HoSsUNNduZO9aZnVT.we','sinh.nh@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269695/jdowynk8pg79dcic0wld.png'),(627,'thanh.dh','$2a$10$OFhHXRodSjQ/4UpB8J7qvezgKTFYe5kNcLpJOPqzRe1eRLLVCyk.2','thanh.dh@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269704/qibcqi8co0bursfw66wv.png'),(628,'trang.ntm','$2a$10$0QGbHmQw3LZuuX4IjkSCJuETkZpFiIRxi/7c8BA1uhdrxpVf8NtBi','trang.ntm@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269714/nevxfbgwysgamk8ewgic.png'),(629,'tuan.lv','$2a$10$.bfCiTu3PBS5JsBgBIqT2.RxvVO7BjjQgp1H8vzkFerevnLG6HgbO','tuan.lv@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269724/buirltaqsduwsapayglv.png'),(630,'vinh.th','$2a$10$OidW9TNNk80do4OFnNfAtuOTZ7iJU8RkhLhaW89CY8YGvstoSTI4C','vinh.th@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1715269734/uyu0bim6ck0tmujqybtb.png'),(631,'2051052046','$2a$10$fIXwVGB2IxEx8m32RsFsoejQveQpBR3MJC7YhfkgjSc6Z/JZTYPE.','2051052046@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(632,'2051052047','$2a$10$A/1zZtb8ToH8w9qvZ0rkbuERqitromAAt9Ure/jb9EVFh6kRd0Mh2','2051052047@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(633,'2051052048','$2a$10$fQVhwyrhTEyA6TxTy/IpU.dmRLdK0FTDvZKDsMObTbg4V8YM2IJve','2051052048@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(634,'2051052049','$2a$10$4aStxO4xj/RazK9eXeJEk.oEMqXUk15DmqKr0M0AM49SKXBhrIgnK','2051052049@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(635,'2051052050','$2a$10$./CNCvMZIOC9r/k3Rdzzje8pagtsszKYw1x66paIG5Br4qFqbWiTy','2051052050@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(636,'2051052051','$2a$10$l868sh.zO9hxWYxGzuIaZ.2D8cJl0KNu1aROiW.2Gt0eB2GcTSh9W','2051052051@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(637,'2051052052','$2a$10$GMkkRe9D.2NaVe2Lk.fKjedLUPKhYWlsJyZr3d103vqpp2q4I9b9K','2051052052@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(638,'2051052053','$2a$10$IiMBNM.35vLR0Eyvrs/wM.7sxI46lVLCPRufu65FS5m.sjvYSasba','2051052053@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(639,'2051052086','$2a$10$7rc5icbO/y7dDJjYZaPXtOvK8AqSt2v1eK.ya9lawT2De77k9NMEC','2051052086@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(640,'2051052055','$2a$10$FwIDPqsHwXuIDOmbQAAkYubZAK7f6oXywxokdJvGwGNhnepp9rf0C','2051052055@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(641,'2051052056','$2a$10$W4uua9pRvyZ4fBE/LC3QJulpBgtKaV8RkDEs3XXgeFpYDS23jZG8u','2051052056@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(642,'2051052057','$2a$10$CaEEo0POJgYXKheLbHG64Ow6LwAoUEn34ULebD79JZLkrEcHVqOgy','2051052057@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(643,'2051052058','$2a$10$3xsW94Ji5I95Mqv2efVkrOcQ4hY6nPJWtS6mOfBz0AmQFJ6f.jgHG','2051052058@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(644,'2051052059','$2a$10$W07s69evxHI3OCr5Mh8cxu2OXYSiUpGpGN6DnkbQGw8.bs1bbeKG.','2051052059@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(645,'2051052060','$2a$10$WHCfUnMqSywxWvbgym87f.cZUTjaZCMzpytMu2eiVihdFitAIkW/S','2051052060@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(646,'2051052061','$2a$10$xFGv6.okmie6GHRyDmBN4.CziYGB7MzU46st3XdRHksrxRHxfGxOm','2051052061@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(647,'2051052062','$2a$10$8fOXalKlOjmxvrXSYhDgjePV1EpAm4N54MBmy0HyhweHjMLokCjdO','2051052062@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(648,'2051052063','$2a$10$HssK2OFqB/B2PqQVshefnOd77WrTXMuhBx0PhKKhif5vog4IdI6J6','2051052063@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(649,'2051052064','$2a$10$w4xKWIdB9UEBGr.87Vjqte9L.AfrBfnXL2fjGO72uaNWM1nY4QC12','2051052064@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(650,'2051052065','$2a$10$waRHy9MYOlxAdsedsenZJOalv7/Mql/aKuXvqNMU7TTmU8SEeNvc2','2051052065@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(651,'2051052066','$2a$10$gOXeRupPKcpEf7fKsaMgb.Mume8xCPha5qScbLID4vjQuo62KLVRW','2051052066@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(652,'2051052067','$2a$10$SpXAcMWkkf4yYlROmVqR1u/yXN12UpKWHzSlJ9FbZOsqT2TN9AQrm','2051052067@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(653,'2051052068','$2a$10$n/iOxXAfkxcNXuYSzASL/.0E1dCJX3U4IZ05SiIQ1brkbm0z/BQjS','2051052068@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(654,'2051052069','$2a$10$GgKRL5cfYbK7G15DBtK05eh3i7JvgEivLAX.U4zSm9WvFy6EvaNYy','2051052069@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(655,'2051052070','$2a$10$xOsF2vSW5gbSF9ZjdwyyOu8HkEqqsGVMeHgMNDARopNzXukU817Iu','2051052070@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(656,'2051052071','$2a$10$3CQKgivS77p/oMCTYzfNq.gn7dSiVStHAeo6QsHUk3kiezNEB5mx6','2051052071@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(657,'2051052072','$2a$10$5GNUQCTZvIyKDad1BIoZmuxm0sDc9gG.kj1Ars8QyepUxOqWpP7vi','2051052072@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(658,'2051052073','$2a$10$TU4uXGLHHL24F9/6M0WNy.3GdgWS1qHMYSIsgeryZn1ZyeYcsbeu6','2051052073@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(659,'2051052074','$2a$10$DvwNoKXcX5Ol3dSnmQhOP./biIoEIvc2qpeUDm8nkM1ADEzNpUnty','2051052074@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(660,'2051052075','$2a$10$G06xmXeZjKsa/sH6rCqDjOswCJQbrJuGLqYYGdczX79Otu7fozU0i','2051052075@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(661,'2051052076','$2a$10$lux68NGe7y3RPtlaDlX1ruOx8DEPZ2t1loljgxCJG03V7Vyay3a9G','2051052076@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(662,'2051052077','$2a$10$7d2PTmdBDQVluAaTzDZjmO9m/GI6zjhoGagAJJKPRRy8XrlItxAke','2051052077@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(663,'2051052078','$2a$10$mpzUHix/gJ9zjQoI6BpgwOhLmxLZjQS8rHdNp8E1gccVIUMxvABSC','2051052078@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(664,'2051052079','$2a$10$bbeoroto9orQFz8HuM03ReQvUyTfuHC1rbhguvzoZbg99nVReFY.S','2051052079@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(665,'2051052080','$2a$10$UtYIC0UgV.p8uNbNlVYYe.icmn3Zy9BHlX42g3McrKW/3fiTyGZOK','2051052080@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(666,'2051052081','$2a$10$svTq/0Pdtmu7ig5YdGYgqu2HhKl5Qr7CRPpdx7Y8Ot01Q6t3T99Nm','2051052081@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(667,'2051052082','$2a$10$EvXCgwFW2ItIa5m4kuaBfOqtDDV252zmF/71/I5QY.DB/3DcCGcj6','2051052082@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(668,'2051052083','$2a$10$gqDN2IUVPSIE63FFclqWA.WL8jNvpLmKRSLtuyJceyeX.gOHYQdDy','2051052083@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(669,'2051052084','$2a$10$sCEOnj433eFN.ATLfkMVWu8BwurYswTKlOs5lI54ubGZrgj/0bDh.','2051052084@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(670,'2051052085','$2a$10$sUjJu0TNqPvYPe6F9PTlxelGMCcm35OPCY/lRHjoC9PzjhBuYQgda','2051052085@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(674,'2051052087','$2a$10$eriClY6sGILOM8.OEOG3te22g4pgz1CABQpeTQ8WeFtSD5ZGoeewC','2051052087@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(675,'2051052088','$2a$10$Kstjeu1M.qpdXH46EMTmdeynFM7q87JEGza1pS.NZzujqecs/pNoK','2051052088@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(676,'2051052089','$2a$10$TMiwemyyHxgmjhrjrXR1LubY40RxwBIVEqLllScJeEXYG0GUvdZqS','2051052089@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(677,'2051052090','$2a$10$wc.v41cnNJmB6rP/Nfu1v.sJepcCdec29jNzFOqT15EAIS6HIlxCq','2051052090@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(678,'2051052091','$2a$10$UsqB5grHmHVZyN48DfH3yuo6JJozpK3LlCI4CJaXoUBi5UhNguBmO','2051052091@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(679,'2051052092','$2a$10$87nlwgK5ODcrNOp3kmCVPOw9gMDYdrBC2mPGr14wQK5rAHj5h3lfK','2051052092@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(680,'2051052093','$2a$10$1rsBS3gOLQqkvj8mHpklpujXCCrRku60Cy5fwdngBdskD1iQ1XN9q','2051052093@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(681,'2051052094','$2a$10$U4wTgvbsUld9VGTxX6rpSO70nrvruA51RUMGUIxL9cFtF600fuY8i','2051052094@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(682,'2051052095','$2a$10$ZZr.GfwSbVbl6TsBE9z76eAes5jbWwVmQCfShDOOi3FVuDs6ljS9C','2051052095@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(683,'2051052096','$2a$10$fUueiPMs6Kf1lFv0u4bxUenP.x3FwsK0xIjbLcLMk82dlGF8RmN2m','2051052096@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(684,'2051052097','$2a$10$x0LBD1bdUc5Wxl2KMXQSJeiqgQtyEE0imapLhEIXGvyEPAaOJjypm','2051052097@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(685,'2051052098','$2a$10$VtfkHhSluJZqYE.sDKrRQ.wtTJcClRcVsh05mcFNGSewVsNnR6fFu','2051052098@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(686,'2051052099','$2a$10$hqcnWpBd1S367lj1OggtTezleDgCaL4mboih8hpp2HJxikCRSl5O2','2051052099@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(687,'2051052100','$2a$10$CnCtGIX78SPuol0Ra4y5OeXaUznmOfcJOo2XxbQxGalW6/3eIJuSW','2051052100@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(688,'2051052101','$2a$10$d2r57uiH76kNIhXqOouMs./ADBgmwGqm9jPQ/pH91n9s64SqytryS','2051052101@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(689,'2051052102','$2a$10$TEe8gPpe2oUGMxNOw/75qul9BGm5EUMM2ihKI//DtPW/Ld5a6oWga','2051052102@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(690,'2051052103','$2a$10$jhQ1II8US0zTBMxfA4u4w.I81T5pCo9XPD8SNMD9KOHfxt.tiN7Ly','2051052103@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(691,'2051052104','$2a$10$G8mtPkGq/HouSbWhC.UGyum3FEMAGuPB/s6Us9tGnXY/kzU47p/Sm','2051052104@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(692,'2051052105','$2a$10$UF/hy3Jp1mxq5TSB5gUDcu73FO9UHDLRC5xYzQVh9iGsTuuOqyAwm','2051052105@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(693,'2051052106','$2a$10$rPpb2CJpsTXVaQwQ0C/YHuAi5FISH2hnT2/gnf0rrBK45jnj9VC72','2051052106@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(694,'2051052107','$2a$10$0e7DUdSCZkNAAwoleVftLetLvWGYXACvuIRslK8WD6O.DihgemGJq','2051052107@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(695,'2051052108','$2a$10$NQTb81q91GGe/Mix/bTB9uHzQP4Ps8hGO0Ywrj.HkEyurGqCmKC7u','2051052108@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(696,'2051052109','$2a$10$fJaNFCg4cMfd4Ms3rdDre.7K1oTmw44Zt5SZ5uLZ3jLZtEvnZ9Q8i','2051052109@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(697,'2051052110','$2a$10$jB1PYZ.21cGiJBEwiTOVe.GeGCcbXef/PtolNbB1mdIt3tarBdWx.','2051052110@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(698,'2051052111','$2a$10$OO/u2Me9caXBG0b96OMIge4ydFK25t2H3vib0TSPmg1XBcQ4gI4oS','2051052111@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(699,'2051052112','$2a$10$cKisPaoktLTPFXRtw/yq7ulrFl9R32MrOZCNwK9KN3OvRcAXiM./2','2051052112@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(700,'2051052113','$2a$10$eYAsRV3Sx9dfDtoQilCRZOpDSPxu8DI9kvSc51HP3/YcjrENGEPuW','2051052113@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(701,'2051052114','$2a$10$RMw1GdHR/Rp09LdKjHtOj.Jr8S8CKNFU4PLwKqkr8jc/1iF.9f7NG','2051052114@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(702,'2051052115','$2a$10$G7RSRKHosWFXYXBCZNdaNe0VhbFx0U.w31cuUkO8WxmYu4VLbu96G','2051052115@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(703,'2051052116','$2a$10$axARqM8VPOLRQfS5NxF2KOOwdGHAZwekHHoqxZF0QVqOp12VxHQBO','2051052116@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(704,'2051052117','$2a$10$E8Kc8ZiNrZNJWvv.3GbXOe6q9SGR2D3HT2j6Lj/yC4OdsiTR8o5zm','2051052117@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(705,'2051052118','$2a$10$mCmbgMwAPUSbe8uhHDhq/.mEuo1FarjETYRlt0bSIl8wkxSxQw6m6','2051052118@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(706,'2051052119','$2a$10$/PU/OHqNO2Ia/W6LTrz8Oeygl.0FCVXFYfsMzFiqmFhhX28nTTPBG','2051052119@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(707,'2051052120','$2a$10$NAj8zYdLq1X46guYQ2RThO83cZW0WG/0RXQfwzrPNQVpITuZjbgJa','2051052120@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(708,'2051052121','$2a$10$XwfmrmfYhR3wdIkDXt1nnOrAeGs8r7jiGNtWGU1zR3.JHQ2pkGCvS','2051052121@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(709,'2051052122','$2a$10$icRSDS1xFhqv25sxqhHlx.v3G4FcZBrlcFBDm.QS6.to4tw5vi8MK','2051052122@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(710,'2051052123','$2a$10$14FwB11tRADalP0TjA/55uzzgafsp0dxwl8/RQF9saCmoohveTlqG','2051052123@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(711,'2051052124','$2a$10$vdIbRAOjTACBivB8ujRide7t21SttqGpeOqf6th1vkHj6dd3k9sq.','2051052124@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(712,'2051052125','$2a$10$/ykpNvBOmtQNFPvQziaCl.rhDtsK4.xhqSBVZoPgr/phPwonXuijG','2051052125@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(713,'2051052126','$2a$10$naipX713m3FfqBq2jzh7vuIQMQczGM3Tq7j0ldcGj1oo0qwMEmu4C','2051052126@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(714,'2051052127','$2a$10$G/hFOzPaPSqEYzMi96yAZe/zkm8uy7Y0oEK7ps44a1SkPTPsXb3Cq','2051052127@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(715,'2051052128','$2a$10$xZXpasgt8R3PXxFPp4KQmOTjtZ2JQHxCci3Z1zHbuEwlbHQDc4fPS','2051052128@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp');
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

-- Dump completed on 2024-06-18 21:03:19
