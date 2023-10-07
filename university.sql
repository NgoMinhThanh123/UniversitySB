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
INSERT INTO `classes` VALUES ('DH20IT01','CNTT'),('DH20IT02','CNTT'),('DH20LU01','LUAT'),('DH20LU02','LUAT');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_subject`
--

DROP TABLE IF EXISTS `classes_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(12) NOT NULL,
  `class_id` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id_idx` (`class_id`),
  KEY `subject_id_idx` (`subject_id`),
  CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_subject`
--

LOCK TABLES `classes_subject` WRITE;
/*!40000 ALTER TABLE `classes_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_subject` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (15,'Bad request','2023-10-08',113,19),(16,'Sai dữ liệu đầu vào','2023-10-08',113,19),(17,'Lên tiện ích coi nhé bạn','2023-10-08',113,20);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
INSERT INTO `faculty` VALUES ('CNSH','Công nghệ sinh học '),('CNTT','Công nghệ thông tin'),('KINHTE','Kinh Tế'),('LUAT','Luật'),('NN','Ngoại ngữ');
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
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `faculty_id` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `classes_id` varchar(8) DEFAULT NULL,
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
INSERT INTO `lecturer` VALUES ('GV1','Dương Hữu Thành','1985-01-02',1,'0976106185','Thủ Đức','thanh.dh@gmail.com','CNTT',161,'DH20IT02'),('GV2','Nguyễn Thị Tuyết','1987-01-29',0,'0976106185','Bình Tân','tuyet@gmail.com','CNTT',163,NULL),('GV3','Trương Hoàng Vinh','1980-05-06',1,'0976106185','Tam Bình','vinh@gmail.com','CNTT',163,'DH20IT01'),('GV4','Nguyễn Văn Bảo','1990-05-11',1,'0976106185','GV12','bao@gmail.com','LUAT',164,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_subject`
--

LOCK TABLES `lecturer_subject` WRITE;
/*!40000 ALTER TABLE `lecturer_subject` DISABLE KEYS */;
INSERT INTO `lecturer_subject` VALUES (6,'GV1','OOP'),(7,'GV2','CSLT'),(8,'GV3','KTLT'),(9,'GV4','LUATKT'),(10,'GV1','TKW');
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
  `faculty_id` varchar(12) NOT NULL,
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
INSERT INTO `major` VALUES ('MCNSH','Công nghệ sinh học','CNSH'),('MCNTT','Công nghệ thông tin','CNTT'),('MLUAT','Luật','LUAT'),('MNN','Ngôn ngữ Nhật','NN'),('NNT','Ngôn ngữ Trung','NN');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (19,'Lỗi 400','Cho em hỏi lỗi 400 là lỗi gì, sửa như thế nào ạ?','2023-10-08',110),(20,'Hạn đóng học phí','Cho em hỏi hạn đóng học phí kì 1 - 2024 là khi nào ạ?','2023-10-08',110);
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
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (206,'32023',113),(230,'32023',29),(231,'32023',30),(232,'32023',31),(233,'32023',32),(234,'32023',33),(235,'32023',34),(236,'32023',35),(237,'32023',36),(238,'32023',37),(239,'32023',38),(240,'32023',39),(241,'32023',40),(242,'32023',41),(243,'32023',42),(244,'32023',43),(245,'32023',44),(246,'32023',45),(247,'32023',46),(248,'32023',47),(249,'32023',48),(250,'32023',49),(251,'32023',50),(252,'32023',51),(253,'12023',52),(254,'12023',53),(255,'12023',54),(256,'12023',55),(257,'12023',56),(258,'12023',57),(259,'12023',58),(260,'12023',59),(261,'12023',60),(262,'12023',61),(263,'12023',62),(264,'12023',63),(265,'12023',64),(266,'12023',65),(267,'12023',66),(268,'12023',67),(269,'12023',68),(270,'12023',69),(271,'12023',70),(272,'12023',71),(273,'12023',72),(274,'12023',73),(275,'12023',74),(276,'12023',75),(277,'12024',76),(278,'12024',77),(279,'12024',78),(280,'12024',79),(281,'12024',80),(282,'12024',81),(283,'12024',82),(284,'12024',83),(285,'12024',84),(286,'12024',85),(287,'12024',86),(288,'12024',87),(289,'12024',88),(290,'12024',89),(291,'12024',90),(292,'12024',91),(293,'12024',92),(294,'12024',93),(295,'12024',94),(296,'12024',95),(297,'12024',96),(298,'12024',97),(299,'12024',98),(300,'12024',99),(342,'22023',114),(343,'22023',115),(344,'22023',116),(345,'22023',117),(346,'22023',118),(347,'22023',119),(348,'22023',120),(349,'22023',121),(350,'22023',122),(351,'22023',123),(352,'22023',124),(353,'22023',125),(354,'22023',126),(355,'22023',127),(356,'22023',128),(357,'22023',129),(358,'22023',130),(359,'22023',131),(360,'22023',132),(361,'22023',133),(362,'22023',134);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_column`
--

LOCK TABLES `score_column` WRITE;
/*!40000 ALTER TABLE `score_column` DISABLE KEYS */;
INSERT INTO `score_column` VALUES (1,'Quá trình'),(2,'Giữa kì'),(3,'Cuối kì'),(6,'Điểm cộng');
/*!40000 ALTER TABLE `score_column` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_value`
--

LOCK TABLES `score_value` WRITE;
/*!40000 ALTER TABLE `score_value` DISABLE KEYS */;
INSERT INTO `score_value` VALUES (183,10,278,1),(184,10,277,1),(185,10,281,1),(186,10,283,1),(187,10,282,1),(188,10,279,1),(189,10,286,1),(190,10,284,1),(191,10,280,1),(192,10,288,1),(193,10,287,1),(194,10,285,1),(195,10,293,1),(196,10,289,1),(197,10,291,1),(198,10,292,1),(199,10,294,1),(200,10,290,1),(201,10,296,1),(202,10,297,1),(203,10,299,1),(204,10,300,1),(205,10,298,1),(206,10,295,1),(207,8,278,2),(208,9,277,2),(209,5,281,2),(210,6,280,2),(211,4,282,2),(212,7,279,2),(213,9,288,2),(214,7,286,2),(215,1,285,2),(216,8,287,2),(217,2,284,2),(218,3,283,2),(219,3,290,2),(220,2,292,2),(221,10,291,2),(222,8,293,2),(223,5,294,2),(224,6,289,2),(225,7,300,2),(226,8,299,2),(227,3,297,2),(228,5,298,2),(229,5,296,2),(230,4,295,2),(231,5,279,3),(232,5,278,3),(233,8,277,3),(234,5,281,3),(235,5,280,3),(236,7,282,3),(237,5,288,3),(238,5,284,3),(239,5,286,3),(240,5,287,3),(241,5,283,3),(242,5,285,3),(243,5,291,3),(244,5,289,3),(245,5,292,3),(246,5,290,3),(247,5,293,3),(248,5,294,3),(249,5,299,3),(250,5,300,3),(251,5,296,3),(252,5,295,3),(253,5,298,3),(254,5,297,3);
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
INSERT INTO `semester` VALUES ('12023','Học kì 1',2023,'2023-01-12','2023-03-22'),('12024','Học kì 1',2024,'2023-01-12','2024-03-22'),('22023','Học kì 2',2023,'2023-03-28','2023-04-04'),('32023','Học kì 3',2023,'2023-06-06','2023-08-24');
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
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `classes_id` varchar(8) NOT NULL,
  `faculty_id` varchar(10) NOT NULL,
  `major_id` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user2_id_idx` (`user_id`),
  KEY `classes2_id_idx` (`classes_id`),
  KEY `faculty3_id_idx` (`faculty_id`),
  KEY `major_id_idx` (`major_id`),
  CONSTRAINT `classes2_id` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
INSERT INTO `student` VALUES ('2051052000','Lê Quang Tới','2023-09-27',1,'0976106185','Nhà Bè',113,'DH20IT02','CNTT','MCNTT'),('2051052001','Cao Nguyên Thụy','2023-10-09',0,'0976106185','Phú Nhuận',112,'DH20IT02','CNTT','MCNTT'),('2051052002','Trần Nhật Tiến','2023-10-03',1,'0353894917','Nguyễn Kiệm',114,'DH20IT02','CNTT','MCNTT'),('2051052003','Trần Đức Hiếu','2023-10-03',1,'0976106185','Tân Bình',115,'DH20IT02','CNTT','MCNTT'),('2051052004','Trần Nhật Nam','2023-10-09',1,'0976106185','Tân Bình',116,'DH20IT02','CNTT','MCNTT'),('2051052005','Nguyễn Văn A','2023-09-26',1,'0354472852','GV12',117,'DH20IT02','CNTT','MCNTT'),('2051052006','Nguyễn Văn B','2023-10-03',1,'0976106185','Thủ Đức',118,'DH20IT02','CNTT','MCNTT'),('2051052007','Nguyễn Văn C','2023-09-27',1,'0976106185','Tân Bình',119,'DH20IT02','CNTT','MCNTT'),('2051052008','Nguyễn Văn D','2023-09-27',1,'0353894917','Tân Bình',120,'DH20IT01','CNTT','MCNTT'),('2051052009','Nguyễn Thị F','2023-10-31',0,'0976106185','Tân Bình',121,'DH20IT01','CNTT','MCNTT'),('2051052010','Lê Văn Lâm','2023-09-26',1,'0353894917','Nguyễn Kiệm',122,'DH20IT01','CNTT','MCNTT'),('2051052011','Trần Văn A','2023-10-12',1,'0353894917','Tân Bình',123,'DH20IT01','CNTT','MCNTT'),('2051052012','Trần Thị B','2023-09-26',1,'0976106185','SS',124,'DH20IT01','CNTT','MCNTT'),('2051052013','Trần Văn C','2023-10-31',1,'0976106185','Tân Bình',125,'DH20IT01','CNTT','MCNTT'),('2051052014','Trần Văn D','2019-05-07',1,'0976106185','Tân Bình',126,'DH20IT01','CNTT','MCNTT'),('2051052015','Trằn Thị E','2023-09-29',1,'0353894917','SS',127,'DH20IT01','CNTT','MCNTT'),('2051052016','Trần Văn F','2023-09-27',1,'0976106185','SS',128,'DH20IT01','CNTT','MCNTT'),('2051052017','Lê Văn A','2023-10-11',1,'0354472852','GV12',129,'DH20IT01','CNTT','MCNTT'),('2051052018','Lê Thị B','2023-09-26',0,'0354472852','Tân Bình',130,'DH20IT01','CNTT','MCNTT'),('2051052019','Lê Văn B','2023-09-27',1,'0354472852','GV12',131,'DH20IT01','CNTT','MCNTT'),('2051052020','Lê Văn C','2023-09-29',1,'0976106185','Tam Bình',132,'DH20IT01','CNTT','MCNTT'),('2051052021','Lê Văn D','2023-10-08',1,'0353894917','SS',133,'DH20IT01','CNTT','MCNTT'),('2051052022','Lê Văn E','2023-09-04',1,'0354472852','SS',134,'DH20IT01','CNTT','MCNTT'),('2051052023','Lê Văn F','2023-09-05',1,'0353894917','GV12',135,'DH20IT01','CNTT','MCNTT'),('2051052024','Nguyễn Văn G','2023-10-02',1,'0976106185','Nguyễn Kiệm',136,'DH20IT01','CNTT','MCNTT'),('2051052025','Trần Thị N','2023-09-27',0,'0976106185','DDD',137,'DH20IT01','CNTT','MCNTT'),('2051052026','Nguyễn Thị Vân Anh','2023-09-26',1,'0976106185','Quận 3',138,'DH20IT02','CNTT','MCNTT'),('2051052027','Trần Nhật Minh','2023-09-25',0,'0354472852','Bình Chánh',139,'DH20IT02','CNTT','MCNTT'),('2051052028','Trần Nhật Minh Đạt','2023-09-26',1,'0354472852','SS',140,'DH20IT02','CNTT','MCNTT'),('2051052029','Bùi Thanh Tâm','2023-10-26',1,'0354472852','Nguyễn Kiệm',140,'DH20LU01','LUAT','MLUAT'),('2051052030','Hồ Quang Văn','2023-09-27',1,'0353894917','Tam Bình',142,'DH20LU01','LUAT','MLUAT'),('2051052031','Bùi Tiến Phát','2023-09-25',1,'0353894917','Tân Bình',143,'DH20LU01','LUAT','MLUAT'),('2051052032','Lê Hồng Thuận','2023-10-18',1,'0354472852','SS',144,'DH20LU01','LUAT','MLUAT'),('2051052033','Bùi Mỹ Linh','2023-10-26',0,'0354472852','Tân Bình',145,'DH20LU01','LUAT','MLUAT'),('2051052034','Phan Lê Hồ','2023-10-06',1,'0976106185','GV12',146,'DH20LU01','LUAT','MLUAT'),('2051052035','Lê Nguyễn Tiễn Vững','2023-09-26',1,'0354472852','GV12',147,'DH20LU01','LUAT','MLUAT'),('2051052036','Trần Thanh Tâm','2023-10-12',1,'0354472852','Tam Bình',148,'DH20LU01','LUAT','MLUAT'),('2051052037','Nguyễn Quang Tiến','2023-01-03',1,'0354472852','GV12',149,'DH20LU01','LUAT','MLUAT'),('2051052038','Đào Minh Phố','2023-09-05',1,'0353894917','GV12',150,'DH20LU01','LUAT','MLUAT'),('2051052039','Nguyễn Hoàng Vũ','2021-04-30',1,'0354472852','Tam Bình',151,'DH20LU01','LUAT','MLUAT'),('2051052040','Trần Nguyễn Phương Anh','2023-09-28',0,'0976106185','Tam Bình',152,'DH20LU01','LUAT','MLUAT'),('2051052041','Lâm Quỳnh Như','2023-09-27',0,'0353894917','Thủ Đức',153,'DH20IT02','CNTT','MCNTT'),('2051052042','Nguyễn Huỳnh Huy','2014-04-11',0,'0354472852','Bình Thạnh',154,'DH20IT02','CNTT','MCNTT'),('2051052043','Nguyễn Thị Trúc Mai','2023-09-27',1,'0976106185','Tân Bình',155,'DH20IT02','CNTT','MCNTT'),('2051052044','Nguyễn Thị Thanh','2023-09-27',1,'0976106185','DDD',156,'DH20IT02','CNTT','MCNTT'),('2051052045','Võ Phú Phát','2019-01-03',1,'0976106185','Gò Vấp',157,'DH20IT02','CNTT','MCNTT'),('2051052046','Phan Anh Quân','2023-09-26',1,'0353894917','Tân Bình',158,'DH20IT02','CNTT','MCNTT'),('2051052047','Bùi Xuân Phái','2023-09-28',1,'0976106185','SS',159,'DH20IT02','CNTT','MCNTT'),('2051052048','Nguyễn Văn Hoàng','2023-09-25',1,'0354472852','GV12',160,'DH20IT02','CNTT','MCNTT'),('2051052054','Đoàn Gia Huy','2002-01-03',1,'0353894917','Bình Tân',111,'DH20IT02','CNTT','MCNTT'),('2051052127','Ngô Minh Thành','2002-01-13',1,'0354472852','Nguyễn Văn Công',110,'DH20IT02','CNTT','MCNTT');
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
  `student_id` varchar(10) NOT NULL,
  `subject_id` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student1_id_idx` (`student_id`),
  KEY `subject3_id_idx` (`subject_id`),
  CONSTRAINT `student1_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject3_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_subject`
--

LOCK TABLES `student_subject` WRITE;
/*!40000 ALTER TABLE `student_subject` DISABLE KEYS */;
INSERT INTO `student_subject` VALUES (29,'2051052000','OOP'),(30,'2051052001','OOP'),(31,'2051052002','OOP'),(32,'2051052003','OOP'),(33,'2051052004','OOP'),(34,'2051052005','OOP'),(35,'2051052006','OOP'),(36,'2051052007','OOP'),(37,'2051052008','OOP'),(38,'2051052009','OOP'),(39,'2051052010','OOP'),(40,'2051052011','OOP'),(41,'2051052026','OOP'),(42,'2051052027','OOP'),(43,'2051052028','OOP'),(44,'2051052042','OOP'),(45,'2051052043','OOP'),(46,'2051052044','OOP'),(47,'2051052045','OOP'),(48,'2051052046','OOP'),(49,'2051052047','OOP'),(50,'2051052048','OOP'),(51,'2051052054','OOP'),(52,'2051052127','CSLT'),(53,'2051052000','CSLT'),(54,'2051052001','CSLT'),(55,'2051052002','CSLT'),(56,'2051052003','CSLT'),(57,'2051052004','CSLT'),(58,'2051052005','CSLT'),(59,'2051052006','CSLT'),(60,'2051052007','CSLT'),(61,'2051052008','CSLT'),(62,'2051052009','CSLT'),(63,'2051052010','CSLT'),(64,'2051052011','CSLT'),(65,'2051052026','CSLT'),(66,'2051052027','CSLT'),(67,'2051052028','CSLT'),(68,'2051052042','CSLT'),(69,'2051052043','CSLT'),(70,'2051052044','CSLT'),(71,'2051052045','CSLT'),(72,'2051052046','CSLT'),(73,'2051052047','CSLT'),(74,'2051052048','CSLT'),(75,'2051052054','CSLT'),(76,'2051052127','TKW'),(77,'2051052000','TKW'),(78,'2051052001','TKW'),(79,'2051052002','TKW'),(80,'2051052003','TKW'),(81,'2051052004','TKW'),(82,'2051052005','TKW'),(83,'2051052006','TKW'),(84,'2051052007','TKW'),(85,'2051052008','TKW'),(86,'2051052009','TKW'),(87,'2051052010','TKW'),(88,'2051052011','TKW'),(89,'2051052026','TKW'),(90,'2051052027','TKW'),(91,'2051052028','TKW'),(92,'2051052042','TKW'),(93,'2051052043','TKW'),(94,'2051052044','TKW'),(95,'2051052045','TKW'),(96,'2051052046','TKW'),(97,'2051052047','TKW'),(98,'2051052048','TKW'),(99,'2051052054','TKW'),(113,'2051052127','OOP'),(114,'2051052127','KTLT'),(115,'2051052000','KTLT'),(116,'2051052001','KTLT'),(117,'2051052002','KTLT'),(118,'2051052003','KTLT'),(119,'2051052004','KTLT'),(120,'2051052005','KTLT'),(121,'2051052006','KTLT'),(122,'2051052007','KTLT'),(123,'2051052008','KTLT'),(124,'2051052009','KTLT'),(125,'2051052010','KTLT'),(126,'2051052011','KTLT'),(127,'2051052026','KTLT'),(128,'2051052027','KTLT'),(129,'2051052028','KTLT'),(130,'2051052042','KTLT'),(131,'2051052043','KTLT'),(132,'2051052044','KTLT'),(133,'2051052045','KTLT'),(134,'2051052046','KTLT'),(135,'2051052047','KTLT'),(136,'2051052048','KTLT');
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
  `faculty_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `falculty4_id_idx` (`faculty_id`),
  CONSTRAINT `faculty4_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('CSDL','Cơ sở dữ liệu',4,'CNTT'),('CSLT','Cơ sở lập trình',4,'CNTT'),('KTLT','Kỹ thuật lập trình',4,'CNTT'),('LUATKT','Luật Kinh Tế',3,'KINHTE'),('OOP','Lập trình hướng đối tượng',4,'CNTT'),('TKW','Thiết kế web',4,'CNTT');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_semester`
--

DROP TABLE IF EXISTS `subject_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(12) NOT NULL,
  `semester_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject4_id_idx` (`subject_id`),
  KEY `semester_id_idx` (`semester_id`),
  CONSTRAINT `semester1_id` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject4_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_semester`
--

LOCK TABLES `subject_semester` WRITE;
/*!40000 ALTER TABLE `subject_semester` DISABLE KEYS */;
INSERT INTO `subject_semester` VALUES (5,'CSLT','12023'),(6,'KTLT','22023'),(7,'CSDL','32023'),(8,'OOP','32023'),(11,'TKW','12024');
/*!40000 ALTER TABLE `subject_semester` ENABLE KEYS */;
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
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (109,'giaovu','$2a$10$mYC5eF4R0oHmGvF0/Vx80.FPrVhSfHBViD1YzBaP283QYU7ELrR4i','giaovu@ou.edu.vn','ROLE_GIAOVU','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605310/dsshxrekvd0ui5o0ov6q.png'),(110,'2051052127','$2a$10$Qr8xCBkrzbj1K1BSm1NXq.foSOmtNOXTp76dpY7vAf05sJkP0CrMi','2051052127thanh@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605352/nu3tydv0im9w7twuthl2.png'),(111,'2051052054','$2a$10$Mlmimql1joTes90pe4aNDuxzsSy46lt2hTiqsKqWu9I96hH6RrAZK','2051052054huy@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605374/n2ly3caujtngcfcfqxsc.png'),(112,'2051052001','$2a$10$Kclta8Hnx5Ez5xUFU2niguqDvtejeWHr/irzbrTh2NN1lTOw2OuJi','2051052001minh@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605395/tivyskp6ufsmicmnbltu.png'),(113,'2051052000','$2a$10$9R3/APINvPFL8/cHlUsAJO1xxFz7YgXrrfRSBVz4A437DEhcKTiOq','2051052000nguyen@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605419/bf6eonqo7t8z63bdhqee.png'),(114,'2051052002','$2a$10$uVXS1WwlJF7ZoskW8G7XrOopZCZb3CwxVPyYPeJ0KTujKCE2h7Lq2','2051052002thuy@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605442/sghjykgm6cfcw8ahlglv.png'),(115,'2051052003','$2a$10$YyahITDfccLSiohawv2vX.JyW29LerzqlMhVr.64Cf8gIClJ8orme','2051052003@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605515/shqgnvtfqujvooefv4a4.png'),(116,'2051052004','$2a$10$nqEBBa2v5/SHGEHqWU3woOOR.aKwApjuNSlaUPC3fW5Mof4MdNET2','2051052004@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605540/jqkrq7ldthx4puz0cfyk.png'),(117,'2051052005','$2a$10$34tMj277WzGlSV36s74IGeYjj0o8BgyKK9AVphIoG5XQ1dulSSvYi','2051052005@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605571/gosq3bu0x0gfflrqtz8h.png'),(118,'2051052006','$2a$10$w07kTSaSnztm2iyNvXujc.XbsZuSWdNUhCrbe6IRhv17UgbKJHVhG','2051052006@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605592/lucpubw7xfhuggibkih9.png'),(119,'2051052007','$2a$10$66PbtrXkyljecHj4y914ouU5qbnKtucpUt1zBq8m7K3UNqRmVlQaW','2051052007@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605609/nbmbidmlndbs0fpglwlx.png'),(120,'2051052008','$2a$10$PVjBoEcvfZ3Q14n6luLxUe1D/okD3q3gd9cMNw9jdKHx.ayvNqVZ2','2051052008@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605625/j4iqeyibbabcjpxsen45.png'),(121,'2051052009','$2a$10$1X4nWHrqWPMG5jJTMu0B9./WiKSX1p7iXh0uTD39ZFdAMqzVdjGkm','2051052009@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605644/tpcv17qtzz0uns6hs6se.webp'),(122,'2051052010','$2a$10$5lnXoTURwUSmQuS1ix8aYuy9hksOioXEq6iLAQ8ZtwDMomLSQvUw.','2051052010@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605662/dedvzdzvwzwcmsneydzs.jpg'),(123,'2051052011','$2a$10$sWQ71LkTA5UrvcVyjkj7b.TZwwtRsABfNvPfRFlMC3tRxTh0kKxhW','2051052011@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605687/xn9my0unnj0yyqas7gsf.webp'),(124,'2051052012','$2a$10$euG56/lvW9fKwQTZj4aMvunfPOJklioE3BTtVPzsl6ufH.0Qhc8PS','2051052012@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605706/hrdzaauvveqlzozidple.webp'),(125,'2051052013','$2a$10$UKY9ft0pEefhA/woBCK5JOGiEqDLb/grtd8ZRo0HYbXFzyJqdeK6.','2051052013@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605724/p5wmvpyquh4esyv5st2f.jpg'),(126,'2051052014','$2a$10$vcQZb9tdU4t6tNfd4eCOZuW2g/El6dm0om7PoQ42KrWJ18qPMOsVy','2051052014@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605741/rjhvsk8xvzpuraqesenk.jpg'),(127,'2051052015','$2a$10$/wOMqm.2sIeReaDHzMhuSu/zkgNc.X8rj3p8yXAFU//buxFlv2hD2','2051052015@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605759/alslfu6bgpkgoxcxhns9.webp'),(128,'2051052016','$2a$10$EXSy5rMoiNJHJfSmaniYLu.CWq5L4En28NSIs74iCFd3g7wPXj2UO','2051052016@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605775/ktrgamltotbjkhnq0gwv.png'),(129,'2051052017','$2a$10$1hI5Scz.SN9Nx6HTHXiwKuC2FidDEZsgT6MtGQ7PR7dkyYI9LwHD2','2051052017@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605791/ecgm69bg7l0adhbybxks.webp'),(130,'2051052018','$2a$10$lavGgOJdr1UNPIY3/CYvYetGxSD9gX1zGZtUE6D.V3ebwdrttXdMC','2051052018@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605822/li66wdjcsdearzlmdrf6.jpg'),(131,'2051052019','$2a$10$lzkMpmsT1CPopQrRug7nL.WUcclV18ZgJbRIFct6S.ERTngqcOQSO','2051052019@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605837/fwr8khnfrde9rl8nhgvn.jpg'),(132,'2051052020','$2a$10$5B5h4ZIKeXchnA1w2svjq.ZrivkAEwzrmoFNe.VpS1.0sIu45BUqK','2051052020@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605859/fh4keir8oq6qtjr2fdel.png'),(133,'2051052021','$2a$10$IyeBlQRAsAHt3X0DUJawVuaLEeseq5V.KSySzhgxPFeogPhTBmCQ2','2051052021@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605875/eewhp4nn5fkc0nunu1dh.png'),(134,'2051052022','$2a$10$FLeU6X70rxCXTVOYrZCrSu//WjsLiiG41.obRBcmN/356ah02VMXW','2051052022@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605896/cypvytzdm9prro0wum4l.webp'),(135,'2051052023','$2a$10$VnRmX1kyo5//LSaRTY6IPembv3c67nRisLbqRU7XCbXeTwiX5WVUm','2051052023@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605913/nne9jio9b95q5jlwib4w.jpg'),(136,'2051052024','$2a$10$/GAgTRfpfThEJ5MfGCidUeIsWjobBSUiYPQ4yhTw30MTyAPDP0uta','2051052024@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605932/ydfnt7fi36fbvfdugngz.webp'),(137,'2051052025','$2a$10$BdlUVDDZVNUC0GrdqIzT.u/Jka6jsQAFn2ZoEcTwQb6Pnt4p2V3FO','2051052025@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605955/v2q2saervlil2gnxw8jq.jpg'),(138,'2051052026','$2a$10$gQufGstfpbBctBcyqmYuk.mDB9VXjSuxaJESGmaYgKJ4eSqCuI.92','2051052026@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605978/zvpysfr7yez0eelzjb6s.png'),(139,'2051052027','$2a$10$URjcWzYSAR0drEsKMkPaXukSLZrRdkPFn1RcJDdJSGtDv8SaZD33i','2051052027@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696605996/u2bgxhndtzwzvxfv6zzg.webp'),(140,'2051052028','$2a$10$H1wSG.ddtSKw4DLdIi1QnuS3.uN7YPgfO5M78qSfAWdLmK3WknRou','2051052028@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606012/kdzo83hnqovr7peptptn.webp'),(141,'2051052029','$2a$10$8HMx.VJN3J9xUD2F3Ak6VOwPFAaR/uti9B.sjE1EVlaknXPe6C.4G','2051052029@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606027/iylkjzonkt0jldaadxax.jpg'),(142,'2051052030','$2a$10$DK018WkJnGyNV4xnEh4Hau9RXu8kVdQ.qxbewJIoPZSGRWzvOlr7u','2051052030@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606047/aqvc5hxcsvthewufyvti.jpg'),(143,'2051052031','$2a$10$qQBAh8citmbSoCp2KtdkSOFzp.D9JYK.dcqX9FJzLi.ILLLoCfuja','2051052031@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606066/pubvvrrtzrzdequvibjg.jpg'),(144,'2051052032','$2a$10$Db03BrP8KrJ89ka78Mez/eaymuYcVvkXBUGKtdPFmAi93tKsv1E/S','2051052032@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606084/x3uwgx70q25c8io5zggq.webp'),(145,'2051052033','$2a$10$vX.KcB7U5zVMxZZBTDPqLeGhVsXhYEoa5pvk.MeshbJRz60e/ecL6','2051052033@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606098/hqf0iaes9g4e5gvnyuof.png'),(146,'2051052034','$2a$10$FNaxTlUTsTPP4tu8v5Yq0uTcPjcSGWP/T9PsQhmfWxmAvD7Pr7Ylu','2051052034@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606119/wm4ochxqfmjdxhwtwgqe.jpg'),(147,'2051052035','$2a$10$.tXUJ3Kt5mbDJZ1mcki/VeK6D4H0VpuFw5us44AFlujjnql.ux2hm','2051052035@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606136/nzzqgw6icu6axki2rac2.png'),(148,'2051052036','$2a$10$7ZZnYZI1LMKqIUisANiFIugPPlu9bIHp35xH3xTgdD.c2KdER4GF2','2051052036@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606158/huy3ypai6oexc3ybfakf.jpg'),(149,'2051052037','$2a$10$VDKOeUmItIo.AqDji0.gguANK32Z9QiWXn3WXD/0msifa.YznW69K','2051052037@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606173/n5xuoylvivl6e0so22qg.webp'),(150,'2051052038','$2a$10$8ktAYQfoPNrD6/Xy9rJ.DetnGFWQKtHlkU2F2.ivCJMQ4uS57V85u','2051052038@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606189/lv3c4n2r2pdreu7q43vr.webp'),(151,'2051052039','$2a$10$rAeh6AQSovzz8tVpCEIMvOWkZZ6GBwE3rzAgldcr4qy17yRbM3l7q','2051052039@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606204/rfqft2tuziqeyx7ysj08.webp'),(152,'2051052040','$2a$10$13PsuyKVCQMZpG9EaIBKY.e4I/RJg.jj5gdMUCnb.NEcWZLx3u/tq','2051052040@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606223/qdhe8fxgbrdt3hrry4sl.webp'),(153,'2051052041','$2a$10$EIhzxmw0Dyhyn/bIay8tJOH/lrtnrzcOYFCMIFATluMvGKkoTrvj2','2051052041@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606239/so5nas0ptozbis8a4sec.webp'),(154,'2051052042','$2a$10$sOi8wf2qZcvKeP/K5oooNuQ3HLSSLr3VMYtxD9ufjYxooa5HU64Ii','2051052042@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606264/htz4haszdkvspiwb7ihr.png'),(155,'2051052043','$2a$10$9XM2iZ9ieC.vY2WVjosZAOChY637jKKdftDol3FAxORUd0K2oKwiu','2051052043@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606281/gxow9g9gkgr3jyoymetr.jpg'),(156,'2051052044','$2a$10$8ZA232odKKtxilWy1gnzQu9DZREjrdUMH.jZMTCSvZk6CGik/95v2','2051052044@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606299/p9o8f0enfdpnwqudhvk2.webp'),(157,'2051052045','$2a$10$9TthoHxDFD6IugUrKKLevuW8VUmj.OfX49fr51Eo/c.Gc3SPAYED.','2051052045@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606314/cffjqpwj6tt4qgznp8sv.png'),(158,'2051052046','$2a$10$IUJDEDR20M92VrSILVI/7urohdk7ojqv1WGd133GMqGmat7E0FR86','2051052046@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606331/ij78xxeroqln4h5rulyu.webp'),(159,'2051052047','$2a$10$OIRSpZN76bakvO2/rd4NPOQ5B7727KE3Z/d7KZZ9wDqJSIEzWMZxO','2051052047@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606349/em01vwrjsbbwh4a41hjx.webp'),(160,'2051052048','$2a$10$JmjY57a3IiJGuOithiUyjO4wF7W2H0L.Qd6g4wirn8vemcznL6gGq','2051052048@ou.edu.vn','ROLE_SINHVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606367/urk91vnodpxbcllxt2ht.jpg'),(161,'duonghuuthanh','$2a$10$Wsm7M75bgRUMAFXQFV1fKuqX9C3HNKlFp7OqdsZIZbYYNr.9iBIg.','duonghuuthanh@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606470/fwdvsw4qfbq1b694ywat.webp'),(162,'truonghoangvinh','$2a$10$rvjhBKhcpfBuYZbdLIpppum7NhkaNN8wCTXJZS58i/GWib.ogv6sa','truonghoangvinh@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606489/bmmvxnfujybbsipm3biq.webp'),(163,'nguyenthituyet','$2a$10$cA3Gl5ekPeTpVqJJuxBnMeHQNJvbP/bocd5Ghizy4JOSRjfXV6URe','nguyenthituyet@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606522/ep3mlieqbmlovfmxagp1.webp'),(164,'nguyenvanbao','$2a$10$F9kGl/fQw1PwxohM6B8n/uDGDaOFnpa4ihAdS0PsuVzViFthcd9K2','nguyenvanbao@ou.edu.vn','ROLE_GIANGVIEN','https://res.cloudinary.com/dp1am0vsj/image/upload/v1696606545/oqalmsvk34p3imidklzb.jpg');
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

-- Dump completed on 2023-10-08  0:44:50
