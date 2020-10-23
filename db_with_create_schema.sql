CREATE DATABASE  IF NOT EXISTS `tsi_kw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tsi_kw`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: tsi_kw
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(20) DEFAULT NULL,
  `contact_surname` varchar(20) DEFAULT NULL,
  `address` varchar(25) DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (14,'Ren','Zhengfei','China','Huawei','huawei@huawei.ch','77712377'),(15,'Darth','Vader','Aristida briana 9 iela','Imperus','darth.v@gmail.com','12475561'),(16,'Zinaida','Gippius','Aristida briana 5 iela','Yomobile','zina.g@yandex.ru','12475561'),(21,'Edvard','Totemisio','Florence','Roberto Inc.','edvard@gmail.com','+34875157'),(22,'Tony','Chen','China','Oppo','tone.c@oppo.com','+787454785'),(27,'Ivita','Sondore','Līksnas iela','Mega Corp','iventa.s@gmail.com','77712377'),(29,'Tom','Tomich','mage iela','MegaCorp','tom.t@gmail.com','744548489');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `id_team` int DEFAULT NULL,
  `id_position` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `id_team` (`id_team`),
  KEY `id_position` (`id_position`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id_position`) REFERENCES `position` (`id_position`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `team` (`id_team`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (2,1,2,'Ilja','Pozdejevs','ilja@gmail.com','784584585'),(3,3,2,'Aiden','Pears','aiden19@gmail.com','77712377'),(6,2,2,'Tom','Delton','tom.d@gmail.com','12475561'),(17,1,8,'Olya','Dobronravova','ilja.kungs@gmail.com','77712377'),(19,2,5,'Rick','Rickovich','rick@gmail.com','774454848'),(20,1,2,'Ezio','Galacio','ezio.g@gmail.com','787874541'),(21,3,6,'Palo','Romanio','palo@gmail.com','12314153');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id_position` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`id_position`),
  KEY `id_position` (`id_position`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Junior DEV'),(2,'DEV'),(3,'Senior DEV'),(4,'Junior PM'),(5,'PM'),(6,'Senior PM'),(7,'Junior HR'),(8,'HR');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id_project` int NOT NULL AUTO_INCREMENT,
  `id_team` int NOT NULL,
  `id_client` int NOT NULL,
  `title` varchar(25) NOT NULL,
  `start_date` varchar(20) DEFAULT NULL,
  `deadline_date` varchar(20) DEFAULT NULL,
  `finish_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_project`),
  KEY `id_client` (`id_client`),
  KEY `id_team` (`id_team`),
  KEY `id_project` (`id_project`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `team` (`id_team`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (13,3,16,'Super Project','2020-05-25','2020-10-30','2021-02-28'),(30,2,14,'RicottoManeo','2020-05-24','2020-11-06','2020-07-31'),(31,1,27,'Mega Inc. Project','2020-05-25','2020-09-30','2020-09-29');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id_task` int NOT NULL AUTO_INCREMENT,
  `id_project` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `id_employee_reporter` int NOT NULL,
  `id_employee_assignee` int NOT NULL,
  `estimated_time` varchar(15) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `id_status` int NOT NULL,
  PRIMARY KEY (`id_task`),
  KEY `id_project` (`id_project`),
  KEY `id_task` (`id_task`),
  KEY `id_employee_reporter` (`id_employee_reporter`,`id_employee_assignee`),
  KEY `id_employee_assignee` (`id_employee_assignee`),
  KEY `id_status` (`id_status`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`id_employee_reporter`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`id_employee_assignee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `task_status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (33,30,'Critical bug on backend','Please solve issue with client entity on backend.',2,19,'3h','25.5.2020',1),(34,13,'Error with validation on frontend','Some description...',2,6,'5h','25.5.2020',5),(35,31,'Issue with accounts','Please solve it.',3,17,'2h 40m','25.5.2020',2),(36,13,'Issue with animations','Please solve it.',6,2,'5h','27.5.2020',1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `id_status` int NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id_status`),
  KEY `id_status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'TO DO'),(2,'IN PROGRESS'),(3,'CR'),(4,'QA'),(5,'DONE');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id_team` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_team`),
  KEY `id_team` (`id_team`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Alfa team'),(2,'Betta team'),(3,'Gama team'),(4,'Epsilon team - HR'),(5,'Delta team - HR');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_time`
--

DROP TABLE IF EXISTS `work_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_time` (
  `id_work_time` int NOT NULL AUTO_INCREMENT,
  `id_task` int NOT NULL,
  `id_employee` int NOT NULL,
  `time` varchar(15) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id_work_time`),
  KEY `id_employee` (`id_employee`),
  KEY `id_task` (`id_task`),
  KEY `id_work_time` (`id_work_time`),
  CONSTRAINT `work_time_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_time_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_time`
--

LOCK TABLES `work_time` WRITE;
/*!40000 ALTER TABLE `work_time` DISABLE KEYS */;
INSERT INTO `work_time` VALUES (36,33,2,'1h 10m','2020-05-25'),(37,34,2,'7h 7m','2020-05-26'),(38,33,3,'30m','2020-05-26'),(39,34,2,'3h 30m','2020-05-24');
/*!40000 ALTER TABLE `work_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 15:40:13
