-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sda_scd
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `medicspecialist`
--

DROP TABLE IF EXISTS `medicspecialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicspecialist` (
  `id_medic` int(3) DEFAULT NULL,
  `id_specializare` int(3) DEFAULT NULL,
  KEY `id_medic` (`id_medic`),
  KEY `id_specializare` (`id_specializare`),
  CONSTRAINT `medicspecialist_ibfk_1` FOREIGN KEY (`id_medic`) REFERENCES `medic` (`id_medic`),
  CONSTRAINT `medicspecialist_ibfk_2` FOREIGN KEY (`id_specializare`) REFERENCES `specializaremedic` (`id_specializare`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicspecialist`
--

LOCK TABLES `medicspecialist` WRITE;
/*!40000 ALTER TABLE `medicspecialist` DISABLE KEYS */;
INSERT INTO `medicspecialist` VALUES (1,1),(2,2),(3,2),(4,3),(5,4),(6,5),(7,1),(8,1),(9,6),(10,1),(11,1),(12,7),(13,2),(14,8),(15,9),(16,5),(17,10),(18,11),(19,12),(20,2),(21,2),(22,13),(23,14),(24,15),(25,16),(26,2),(27,17),(28,18),(29,17),(30,2),(31,18),(32,19),(33,14),(34,14),(35,10),(36,2),(37,20),(38,2),(39,14),(40,15),(41,21),(42,3),(43,20),(44,5),(45,13),(46,15),(47,4),(48,8),(49,8),(50,21),(51,22),(52,3),(53,2),(54,23),(55,2),(56,15),(57,2),(58,2),(59,22),(60,8),(61,17),(62,14),(63,3),(64,2),(65,24),(66,10),(67,15),(68,21),(69,2),(70,4),(71,17),(72,2),(73,25),(74,14),(75,2),(76,1),(77,1),(78,20),(79,15),(80,26),(81,2),(82,6),(83,4),(84,6),(85,1),(86,8),(87,16),(88,1),(89,15),(90,27),(91,13),(92,4),(93,28),(94,19),(95,29),(96,13),(97,30),(98,15),(99,10),(100,2),(101,8),(102,30),(103,31),(104,2),(105,17),(106,19),(107,8),(108,2),(109,8),(110,2),(111,15),(112,2),(113,2),(114,32),(115,22),(116,22),(117,17),(118,2),(119,33);
/*!40000 ALTER TABLE `medicspecialist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-13 17:37:44
