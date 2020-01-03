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
-- Table structure for table `Policlinica`
--

DROP TABLE IF EXISTS `Policlinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policlinica` (
  `id_policlinica` int(3) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `adresa` varchar(225) DEFAULT NULL,
  `link_google_map` varchar(225) DEFAULT NULL,
  `zona_id` int(3) DEFAULT NULL,
  `data_deschiderii` date DEFAULT NULL,
  `chirie_lunara` int(6) DEFAULT NULL,
  PRIMARY KEY (`id_policlinica`),
  KEY `zona_id` (`zona_id`),
  CONSTRAINT `Policlinica_ibfk_1` FOREIGN KEY (`zona_id`) REFERENCES `Zona` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policlinica`
--

LOCK TABLES `Policlinica` WRITE;
/*!40000 ALTER TABLE `Policlinica` DISABLE KEYS */;
INSERT INTO `Policlinica` VALUES (1,'TITU MAIORESCU','titu_maiorescu@clinica_med.ro','021-9212','Calea Vacaresti 189','https://goo.gl/maps/JWwmj54Z7AMHRJgx5',1,'2009-05-26',10900),(2,'ORHIDEEA','orhideea@clinica_med.ro','021-9213','Splaiul Independentei 319C','https://goo.gl/maps/cF4kjd2uLCaLrK8J7',8,'2015-09-27',12200),(3,'COTROCENI','cotroceni@clinica_med.ro','021-9214','Soseaua Cotroceni 20','https://goo.gl/maps/6R4crrwGjMygALHU8',1,'2012-07-12',14000),(4,'ENESCU','enescu@clinica_med.ro','021-9215','Strada George Enescu 12','https://goo.gl/maps/hG9R3P2cAG7HNaML9',1,'2012-04-22',10700),(5,'FLOREASCA','floreasca@clinica_med.ro','021-9216','Strada Axinte Uricariul','https://goo.gl/maps/RThPLu1sycY5n69T9',4,'2015-11-27',13200),(6,'AVIATIEI','aviatiei@clinica_med.ro','021-9217','Calea Floreasca 169A','https://goo.gl/maps/i98wHj4zURppzp6z5',6,'2019-08-11',11600),(7,'LUJERULUI','lujerului@clinica_med.ro','021-9218','Bulevardul Iuliu Maniu 51','https://goo.gl/maps/ZWj5cb2wnCZ24n6M7',3,'2018-02-19',11800),(8,'SUN PLAZA','sun_plaza@clinica_med.ro','021-9219','Calea Vacaresti 391','https://goo.gl/maps/qAemtskpWdMKhwas8',2,'2009-03-18',13900),(9,'VICTORIA','victoria@clinica_med.ro','021-9261','Strada Buzesti 75','https://goo.gl/maps/Y4TzUNcjeHZ7VjM48',1,'2009-04-24',11700),(10,'DOROBANTI','dorobanti@clinica_med.ro','021-9265','Calea Dorobanti 240','https://goo.gl/maps/Z4QvA2SnNFdFe8nm6',5,'2008-04-13',14200),(11,'DOAMNA GHICA','doamna_ghica@clinica_med.ro','021-9267','Strada Doamna Ghica 135','https://goo.gl/maps/GeKJyuEZfsBT2gHa9',7,'2012-11-04',13300);
/*!40000 ALTER TABLE `Policlinica` ENABLE KEYS */;
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
