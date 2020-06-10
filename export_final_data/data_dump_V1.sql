-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 0.0.0.0    Database: medicalAppDev
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
  `id_specialitate` int(3) DEFAULT NULL,
  `id_policlinica` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_cabinet`),
  KEY `id_specialitate` (`id_specialitate`),
  KEY `id_policlinica` (`id_policlinica`),
  CONSTRAINT `Cabinet_ibfk_1` FOREIGN KEY (`id_specialitate`) REFERENCES `SpecialitateMedicala` (`id_specialitate`),
  CONSTRAINT `Cabinet_ibfk_2` FOREIGN KEY (`id_policlinica`) REFERENCES `Policlinica` (`id_policlinica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cabinet`
--

LOCK TABLES `Cabinet` WRITE;
/*!40000 ALTER TABLE `Cabinet` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cabinet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donator`
--

DROP TABLE IF EXISTS `Donator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Donator` (
  `id_donator` int(3) NOT NULL AUTO_INCREMENT,
  `grupa_sanguina` enum('0_I pozitiv','0_I negativ','A_II pozitiv','A_II negativ','B_III pozitiv','B_III negativ','AB_IV pozitiv','AB_IV negativ') DEFAULT NULL,
  `rh` enum('pozitiv','negativ') DEFAULT NULL,
  `celule_stem` varchar(50) DEFAULT NULL,
  `data_ultimei_donari` date DEFAULT NULL,
  `numar_donari` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_donator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donator`
--

LOCK TABLES `Donator` WRITE;
/*!40000 ALTER TABLE `Donator` DISABLE KEYS */;
/*!40000 ALTER TABLE `Donator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GradProfesional`
--

DROP TABLE IF EXISTS `GradProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GradProfesional` (
  `id_grad` int(3) NOT NULL AUTO_INCREMENT,
  `grad_profesional` varchar(20) DEFAULT NULL,
  `salariu_min` int(6) DEFAULT NULL,
  `salariu_max` int(6) DEFAULT NULL,
  PRIMARY KEY (`id_grad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GradProfesional`
--

LOCK TABLES `GradProfesional` WRITE;
/*!40000 ALTER TABLE `GradProfesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `GradProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medic`
--

DROP TABLE IF EXISTS `Medic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medic` (
  `id_medic` int(3) NOT NULL AUTO_INCREMENT,
  `salariu` int(6) DEFAULT NULL,
  `data_angajarii` date DEFAULT NULL,
  `id_grad` int(3) DEFAULT NULL,
  `id_specialitate` int(3) DEFAULT NULL,
  `id_utilizator` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_medic`),
  KEY `id_utilizator` (`id_utilizator`),
  KEY `id_grad` (`id_grad`),
  KEY `id_specialitate` (`id_specialitate`),
  CONSTRAINT `Medic_ibfk_1` FOREIGN KEY (`id_utilizator`) REFERENCES `Utilizator` (`id_utilizator`),
  CONSTRAINT `Medic_ibfk_2` FOREIGN KEY (`id_grad`) REFERENCES `GradProfesional` (`id_grad`),
  CONSTRAINT `Medic_ibfk_3` FOREIGN KEY (`id_specialitate`) REFERENCES `SpecialitateMedicala` (`id_specialitate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medic`
--

LOCK TABLES `Medic` WRITE;
/*!40000 ALTER TABLE `Medic` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notificari`
--

DROP TABLE IF EXISTS `Notificari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notificari` (
  `id_notificare` int(3) NOT NULL AUTO_INCREMENT,
  `creata_la` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trimisa_la` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `erorare_trimitere` tinyint(1) DEFAULT NULL,
  `mesaj` varchar(255) DEFAULT NULL,
  `id_programare` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_notificare`),
  KEY `id_programare` (`id_programare`),
  CONSTRAINT `Notificari_ibfk_1` FOREIGN KEY (`id_programare`) REFERENCES `Programare` (`id_programare`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notificari`
--

LOCK TABLES `Notificari` WRITE;
/*!40000 ALTER TABLE `Notificari` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notificari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notificari_Programare`
--

DROP TABLE IF EXISTS `Notificari_Programare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notificari_Programare` (
  `id_notificare` int(3) DEFAULT NULL,
  `id_programare` int(3) DEFAULT NULL,
  KEY `id_notificare` (`id_notificare`),
  KEY `id_programare` (`id_programare`),
  CONSTRAINT `Notificari_Programare_ibfk_1` FOREIGN KEY (`id_notificare`) REFERENCES `Notificari` (`id_notificare`),
  CONSTRAINT `Notificari_Programare_ibfk_2` FOREIGN KEY (`id_programare`) REFERENCES `Programare` (`id_programare`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notificari_Programare`
--

LOCK TABLES `Notificari_Programare` WRITE;
/*!40000 ALTER TABLE `Notificari_Programare` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notificari_Programare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrarMedic`
--

DROP TABLE IF EXISTS `OrarMedic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrarMedic` (
  `id_orar` int(3) NOT NULL AUTO_INCREMENT,
  `id_medic` int(3) DEFAULT NULL,
  `id_cabinet` int(3) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `ora_inceput` time DEFAULT NULL,
  `ora_sfarsit` time DEFAULT NULL,
  PRIMARY KEY (`id_orar`),
  KEY `id_medic` (`id_medic`),
  KEY `id_cabinet` (`id_cabinet`),
  CONSTRAINT `OrarMedic_ibfk_1` FOREIGN KEY (`id_medic`) REFERENCES `Medic` (`id_medic`),
  CONSTRAINT `OrarMedic_ibfk_2` FOREIGN KEY (`id_cabinet`) REFERENCES `Cabinet` (`id_cabinet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrarMedic`
--

LOCK TABLES `OrarMedic` WRITE;
/*!40000 ALTER TABLE `OrarMedic` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrarMedic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pacient`
--

DROP TABLE IF EXISTS `Pacient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pacient` (
  `id_pacient` int(3) NOT NULL AUTO_INCREMENT,
  `data_nasterii` date DEFAULT NULL,
  `id_zona` int(3) DEFAULT NULL,
  `id_asigurare` int(3) DEFAULT NULL,
  `id_donator` int(1) DEFAULT NULL,
  `id_utilizator` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_pacient`),
  KEY `id_asigurare` (`id_asigurare`),
  KEY `id_zona` (`id_zona`),
  KEY `id_donator` (`id_donator`),
  KEY `id_utilizator` (`id_utilizator`),
  CONSTRAINT `Pacient_ibfk_1` FOREIGN KEY (`id_asigurare`) REFERENCES `asigurareMedicala` (`id_asigurare`),
  CONSTRAINT `Pacient_ibfk_2` FOREIGN KEY (`id_zona`) REFERENCES `Zona` (`id_zona`),
  CONSTRAINT `Pacient_ibfk_3` FOREIGN KEY (`id_donator`) REFERENCES `Donator` (`id_donator`),
  CONSTRAINT `Pacient_ibfk_4` FOREIGN KEY (`id_utilizator`) REFERENCES `Utilizator` (`id_utilizator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pacient`
--

LOCK TABLES `Pacient` WRITE;
/*!40000 ALTER TABLE `Pacient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pacient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permisiuni`
--

DROP TABLE IF EXISTS `Permisiuni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Permisiuni` (
  `id_permisiune` int(3) NOT NULL AUTO_INCREMENT,
  `nume` varchar(25) DEFAULT NULL,
  `descriere` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_permisiune`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permisiuni`
--

LOCK TABLES `Permisiuni` WRITE;
/*!40000 ALTER TABLE `Permisiuni` DISABLE KEYS */;
/*!40000 ALTER TABLE `Permisiuni` ENABLE KEYS */;
UNLOCK TABLES;

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
  `chiria_lunara` int(6) DEFAULT NULL,
  PRIMARY KEY (`id_policlinica`),
  KEY `zona_id` (`zona_id`),
  CONSTRAINT `Policlinica_ibfk_1` FOREIGN KEY (`zona_id`) REFERENCES `Zona` (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policlinica`
--

LOCK TABLES `Policlinica` WRITE;
/*!40000 ALTER TABLE `Policlinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `Policlinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgramPoliclinica`
--

DROP TABLE IF EXISTS `ProgramPoliclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProgramPoliclinica` (
  `id_program` int(3) NOT NULL AUTO_INCREMENT,
  `id_policlinica` int(3) DEFAULT NULL,
  `ziua_saptamanii` enum('Lu','Ma','Mi','Joi','Vn','Sa','Du') DEFAULT NULL,
  `ora_inceput` time DEFAULT NULL,
  `ora_sfarsit` time DEFAULT NULL,
  PRIMARY KEY (`id_program`),
  KEY `id_policlinica` (`id_policlinica`),
  CONSTRAINT `ProgramPoliclinica_ibfk_1` FOREIGN KEY (`id_policlinica`) REFERENCES `Policlinica` (`id_policlinica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgramPoliclinica`
--

LOCK TABLES `ProgramPoliclinica` WRITE;
/*!40000 ALTER TABLE `ProgramPoliclinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProgramPoliclinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programare`
--

DROP TABLE IF EXISTS `Programare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Programare` (
  `id_programare` int(3) NOT NULL AUTO_INCREMENT,
  `id_pacient` int(3) DEFAULT NULL,
  `id_medic` int(3) DEFAULT NULL,
  `id_cabinet` int(1) DEFAULT NULL,
  `id_serviciu` int(3) DEFAULT NULL,
  `moment_programare` datetime DEFAULT NULL,
  `data_programarii` datetime DEFAULT NULL,
  `durata` time DEFAULT NULL,
  `status_programare` enum('activa','anulata','reprogramata') DEFAULT NULL,
  PRIMARY KEY (`id_programare`),
  KEY `id_pacient` (`id_pacient`),
  KEY `id_medic` (`id_medic`),
  KEY `id_cabinet` (`id_cabinet`),
  KEY `id_serviciu` (`id_serviciu`),
  CONSTRAINT `Programare_ibfk_1` FOREIGN KEY (`id_pacient`) REFERENCES `Pacient` (`id_pacient`),
  CONSTRAINT `Programare_ibfk_2` FOREIGN KEY (`id_medic`) REFERENCES `Medic` (`id_medic`),
  CONSTRAINT `Programare_ibfk_3` FOREIGN KEY (`id_cabinet`) REFERENCES `Cabinet` (`id_cabinet`),
  CONSTRAINT `Programare_ibfk_4` FOREIGN KEY (`id_serviciu`) REFERENCES `serviciuMedical` (`id_serviciu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programare`
--

LOCK TABLES `Programare` WRITE;
/*!40000 ALTER TABLE `Programare` DISABLE KEYS */;
/*!40000 ALTER TABLE `Programare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roluri`
--

DROP TABLE IF EXISTS `Roluri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roluri` (
  `id_rol` int(3) NOT NULL AUTO_INCREMENT,
  `nume` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roluri`
--

LOCK TABLES `Roluri` WRITE;
/*!40000 ALTER TABLE `Roluri` DISABLE KEYS */;
/*!40000 ALTER TABLE `Roluri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoluriPermisiuni`
--

DROP TABLE IF EXISTS `RoluriPermisiuni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoluriPermisiuni` (
  `id_permisiune` int(3) DEFAULT NULL,
  `id_rol` int(3) DEFAULT NULL,
  KEY `id_permisiune` (`id_permisiune`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `RoluriPermisiuni_ibfk_1` FOREIGN KEY (`id_permisiune`) REFERENCES `Permisiuni` (`id_permisiune`),
  CONSTRAINT `RoluriPermisiuni_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `Roluri` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoluriPermisiuni`
--

LOCK TABLES `RoluriPermisiuni` WRITE;
/*!40000 ALTER TABLE `RoluriPermisiuni` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoluriPermisiuni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialitateMedicala`
--

DROP TABLE IF EXISTS `SpecialitateMedicala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SpecialitateMedicala` (
  `id_specialitate` int(3) NOT NULL AUTO_INCREMENT,
  `specialitate` varchar(50) DEFAULT NULL,
  `salariu_min` int(6) DEFAULT NULL,
  `salariu_max` int(6) DEFAULT NULL,
  PRIMARY KEY (`id_specialitate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialitateMedicala`
--

LOCK TABLES `SpecialitateMedicala` WRITE;
/*!40000 ALTER TABLE `SpecialitateMedicala` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecialitateMedicala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utilizator`
--

DROP TABLE IF EXISTS `Utilizator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utilizator` (
  `id_utilizator` int(3) NOT NULL AUTO_INCREMENT,
  `nume` varchar(25) DEFAULT NULL,
  `prenume` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `nume_utilizator` varchar(25) DEFAULT NULL,
  `parola_criptata` varchar(100) DEFAULT NULL,
  `numar_autentificari` int(4) DEFAULT NULL,
  `ultima_autentificare` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_ultima_autentificare` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token_invitatie` varchar(100) DEFAULT NULL,
  `invitatie_creata_la` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invitatie_trimisa_la` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invitatie_acceptata_la` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numar_invitatii` int(4) DEFAULT NULL,
  `creat_la` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actualizat_la` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_rol` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_utilizator`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `Utilizator_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `Roluri` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utilizator`
--

LOCK TABLES `Utilizator` WRITE;
/*!40000 ALTER TABLE `Utilizator` DISABLE KEYS */;
/*!40000 ALTER TABLE `Utilizator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zona`
--

DROP TABLE IF EXISTS `Zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zona` (
  `id_zona` int(3) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zona`
--

LOCK TABLES `Zona` WRITE;
/*!40000 ALTER TABLE `Zona` DISABLE KEYS */;
/*!40000 ALTER TABLE `Zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asigurareMedicala`
--

DROP TABLE IF EXISTS `asigurareMedicala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asigurareMedicala` (
  `id_asigurare` int(3) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(50) DEFAULT NULL,
  `descriere` varchar(250) DEFAULT NULL,
  `pret_anual` int(4) DEFAULT NULL,
  `pret_lunar` int(3) DEFAULT NULL,
  `data_inceperii` datetime DEFAULT NULL,
  `data_ultimei_plati` datetime DEFAULT NULL,
  `data_urmatoarei_plati` datetime DEFAULT NULL,
  `procent_discount` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_asigurare`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asigurareMedicala`
--

LOCK TABLES `asigurareMedicala` WRITE;
/*!40000 ALTER TABLE `asigurareMedicala` DISABLE KEYS */;
/*!40000 ALTER TABLE `asigurareMedicala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountServMed`
--

DROP TABLE IF EXISTS `discountServMed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountServMed` (
  `id_discount` int(3) NOT NULL AUTO_INCREMENT,
  `id_asigurare` int(3) DEFAULT NULL,
  `id_serviciu` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_discount`),
  KEY `id_asigurare` (`id_asigurare`),
  KEY `id_serviciu` (`id_serviciu`),
  CONSTRAINT `discountServMed_ibfk_1` FOREIGN KEY (`id_asigurare`) REFERENCES `asigurareMedicala` (`id_asigurare`),
  CONSTRAINT `discountServMed_ibfk_2` FOREIGN KEY (`id_serviciu`) REFERENCES `serviciuMedical` (`id_serviciu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountServMed`
--

LOCK TABLES `discountServMed` WRITE;
/*!40000 ALTER TABLE `discountServMed` DISABLE KEYS */;
/*!40000 ALTER TABLE `discountServMed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faraPlataServMed`
--

DROP TABLE IF EXISTS `faraPlataServMed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faraPlataServMed` (
  `id_fara_plata` int(3) NOT NULL AUTO_INCREMENT,
  `id_asigurare` int(3) DEFAULT NULL,
  `id_serviciu` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_fara_plata`),
  KEY `id_asigurare` (`id_asigurare`),
  KEY `id_serviciu` (`id_serviciu`),
  CONSTRAINT `faraPlataServMed_ibfk_1` FOREIGN KEY (`id_asigurare`) REFERENCES `asigurareMedicala` (`id_asigurare`),
  CONSTRAINT `faraPlataServMed_ibfk_2` FOREIGN KEY (`id_serviciu`) REFERENCES `serviciuMedical` (`id_serviciu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faraPlataServMed`
--

LOCK TABLES `faraPlataServMed` WRITE;
/*!40000 ALTER TABLE `faraPlataServMed` DISABLE KEYS */;
/*!40000 ALTER TABLE `faraPlataServMed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviciuMedical`
--

DROP TABLE IF EXISTS `serviciuMedical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviciuMedical` (
  `id_serviciu` int(3) NOT NULL AUTO_INCREMENT,
  `denumire_serviciu` varchar(255) DEFAULT NULL,
  `cost_serviciu` int(3) DEFAULT NULL,
  `durata_minima` time DEFAULT NULL,
  `durata_maxima` time DEFAULT NULL,
  `id_specialitate` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_serviciu`),
  KEY `id_specialitate` (`id_specialitate`),
  CONSTRAINT `serviciuMedical_ibfk_1` FOREIGN KEY (`id_specialitate`) REFERENCES `SpecialitateMedicala` (`id_specialitate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciuMedical`
--

LOCK TABLES `serviciuMedical` WRITE;
/*!40000 ALTER TABLE `serviciuMedical` DISABLE KEYS */;
/*!40000 ALTER TABLE `serviciuMedical` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-04 19:56:42
