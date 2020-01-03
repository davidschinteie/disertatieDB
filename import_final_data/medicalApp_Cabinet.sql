CREATE DATABASE  IF NOT EXISTS `medicalApp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `medicalApp`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: 0.0.0.0    Database: medicalApp
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `Cabinet`
--

DROP TABLE IF EXISTS `Cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cabinet` (
  `id_cabinet` int(3) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(50) DEFAULT NULL,
  `specialitate_id` int(3) DEFAULT NULL,
  `policlinica_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_cabinet`),
  KEY `specialitate_id` (`specialitate_id`),
  KEY `policlinica_id` (`policlinica_id`),
  CONSTRAINT `Cabinet_ibfk_1` FOREIGN KEY (`specialitate_id`) REFERENCES `SpecialitateMedicala` (`id_specialitate`),
  CONSTRAINT `Cabinet_ibfk_2` FOREIGN KEY (`policlinica_id`) REFERENCES `Policlinica` (`id_policlinica`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cabinet`
--

LOCK TABLES `Cabinet` WRITE;
/*!40000 ALTER TABLE `Cabinet` DISABLE KEYS */;
INSERT INTO `Cabinet` VALUES (1,'Cabinet 1',5,1),(2,'Cabinet 2',24,1),(3,'Cabinet 3',26,1),(4,'Cabinet 4',5,1),(5,'Cabinet 5',1,1),(6,'Cabinet 6',15,1),(7,'Cabinet 7',18,1),(8,'Cabinet 8',20,1),(9,'Cabinet 9',18,1),(10,'Cabinet 10',4,1),(11,'Cabinet 1',18,2),(12,'Cabinet 2',1,2),(13,'Cabinet 3',26,2),(14,'Cabinet 4',22,2),(15,'Cabinet 5',7,2),(16,'Cabinet 6',21,2),(17,'Cabinet 7',4,2),(18,'Cabinet 8',10,2),(19,'Cabinet 9',12,2),(20,'Cabinet 10',2,2),(21,'Cabinet 1',26,3),(22,'Cabinet 2',18,3),(23,'Cabinet 3',13,3),(24,'Cabinet 4',10,3),(25,'Cabinet 5',11,3),(26,'Cabinet 6',24,3),(27,'Cabinet 7',9,3),(28,'Cabinet 8',26,3),(29,'Cabinet 9',22,3),(30,'Cabinet 10',7,3),(31,'Cabinet 1',22,4),(32,'Cabinet 2',7,4),(33,'Cabinet 3',23,4),(34,'Cabinet 4',14,4),(35,'Cabinet 5',3,4),(36,'Cabinet 6',24,4),(37,'Cabinet 7',6,4),(38,'Cabinet 8',10,4),(39,'Cabinet 9',5,4),(40,'Cabinet 10',21,4),(41,'Cabinet 1',10,5),(42,'Cabinet 2',13,5),(43,'Cabinet 3',10,5),(44,'Cabinet 4',10,5),(45,'Cabinet 5',21,5),(46,'Cabinet 6',21,5),(47,'Cabinet 7',17,5),(48,'Cabinet 8',20,5),(49,'Cabinet 9',23,5),(50,'Cabinet 10',4,5),(51,'Cabinet 1',26,6),(52,'Cabinet 2',15,6),(53,'Cabinet 3',22,6),(54,'Cabinet 4',11,6),(55,'Cabinet 5',14,6),(56,'Cabinet 6',13,6),(57,'Cabinet 7',21,6),(58,'Cabinet 8',13,6),(59,'Cabinet 9',2,6),(60,'Cabinet 10',22,6),(61,'Cabinet 1',25,7),(62,'Cabinet 2',8,7),(63,'Cabinet 3',14,7),(64,'Cabinet 4',21,7),(65,'Cabinet 5',11,7),(66,'Cabinet 6',15,7),(67,'Cabinet 7',18,7),(68,'Cabinet 8',18,7),(69,'Cabinet 9',11,7),(70,'Cabinet 10',24,7),(71,'Cabinet 1',11,8),(72,'Cabinet 2',7,8),(73,'Cabinet 3',1,8),(74,'Cabinet 4',8,8),(75,'Cabinet 5',13,8),(76,'Cabinet 6',14,8),(77,'Cabinet 7',6,8),(78,'Cabinet 8',13,8),(79,'Cabinet 9',19,8),(80,'Cabinet 10',3,8),(81,'Cabinet 1',9,9),(82,'Cabinet 2',12,9),(83,'Cabinet 3',6,9),(84,'Cabinet 4',17,9),(85,'Cabinet 5',17,9),(86,'Cabinet 6',6,9),(87,'Cabinet 7',4,9),(88,'Cabinet 8',2,9),(89,'Cabinet 9',25,9),(90,'Cabinet 10',13,9),(91,'Cabinet 1',18,10),(92,'Cabinet 2',22,10),(93,'Cabinet 3',5,10),(94,'Cabinet 4',9,10),(95,'Cabinet 5',2,10),(96,'Cabinet 6',12,10),(97,'Cabinet 7',25,10),(98,'Cabinet 8',11,10),(99,'Cabinet 9',5,10),(100,'Cabinet 10',17,10),(101,'Cabinet 1',20,11),(102,'Cabinet 2',21,11),(103,'Cabinet 3',18,11),(104,'Cabinet 4',3,11),(105,'Cabinet 5',10,11),(106,'Cabinet 6',16,11),(107,'Cabinet 7',22,11),(108,'Cabinet 8',10,11),(109,'Cabinet 9',10,11),(110,'Cabinet 10',20,11);
/*!40000 ALTER TABLE `Cabinet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 19:39:35
