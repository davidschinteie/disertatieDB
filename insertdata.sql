use medicalApp;

SET foreign_key_checks = 0;

-- Create tables:
/*Tabela Medic*/
Drop table if exists Medic;
create table Medic(
	id_medic int(3) primary key auto_increment,
	nume varchar(25),
	prenume varchar(50),
    grad_profesional enum('primar','specialist','rezident'),
    email varchar(100),
    telefon varchar(20),
    salariu int(6),
    data_angajarii date
);

/*Tabela Specialitati Medicale*/
drop table if exists SpecialitatiMedicale;
create table SpecialitatiMedicale(
	id_specializare int(3) primary key auto_increment,
	specializare varchar(50),
    salariu_min int(6),
    salariu_max int(6)
);

/*Tabela Specialitate Medic*/
drop table if exists SpecialitateMedic;
create table SpecialitateMedic(
	id_medic int(3),
	id_specializare int(3),
	foreign key (id_medic) references Medic(id_medic),
	foreign key (id_specializare) references SpecialitatiMedicale(id_specializare)
);

show tables;

/*Inserare Date*/
/*CREAREA TABELEI TEMPORARE MEDIC_TEMP*/
Drop table if exists Medic_temp;
create table Medic_temp(
	id int(3) primary key auto_increment,
	nume varchar(25),
	prenume varchar(50),
	unique(nume,prenume)
);

drop table if exists SpecialitatiMedicale_temp;
create table SpecialitatiMedicale_temp(
	id_specializare int(3) primary key auto_increment,
	specializare varchar(50)
);

INSERT INTO `Medic_temp` VALUES (1,'COPAESCU','CATALIN'),(2,'BRATILA','PETRE CORNEL'),(3,'RAHIMIAN','HADI'),(4,'PREDESCU','VLAD'),(5,'SURLEA','VERONICA'),(6,'SCHEINER','MIHAELA'),(7,'ULMEANU','DAN'),(8,'TOMULESCU','VICTOR'),(9,'SAFTA','DANA'),(10,'TURCU','FLORIN'),(11,'BARTA','CRISTIAN BOGDAN'),(12,'GODOROJA','DANIELA'),(13,'BORDAS','DANIEL'),(14,'OPRISIU','CARMEN'),(15,'CRISTESCU','MIHAI ADRIAN'),(16,'BARUS','JANINA'),(17,'NITA','GHEORGHE'),(18,'GRIGORUTA','SIMONA'),(19,'DANTZER','DIANA'),(20,'ANCA','ALEXANDRU'),(21,'NICOLAE','GABRIEL'),(22,'CODITA','IONELA'),(23,'GHERMAN','ADRIANA'),(24,'STANCA','IONUT'),(25,'GENUNCHE','AMELIA'),(26,'CRACIUN','ALINA'),(27,'SZATMARI','JUDIT'),(28,'BRAGARU','RADU STEFANIA'),(29,'STEFANUT','CLAUDIA'),(30,'SECARA','DIANA CRISTINA'),(31,'RUSU','ELENA GEORGIANA'),(32,'ALBEAN','DANIELA'),(33,'FLESERIU','CARMEN'),(34,'EDGHIUN','ISMAIL'),(35,'NITOIU','CONSTANTIN'),(36,'BALASA','DANIELA'),(37,'STANESCU','GEORGETA'),(38,'DUSMANU','ALINA'),(39,'POPESCU','ILEANA'),(40,'COZMA','DRAGOS'),(41,'BUZATEL','ROXANA'),(42,'TANASE','IONUT'),(43,'NEAGU','ANA MARIA'),(44,'PALADE','CRISTIAN'),(45,'CORBU','ANA'),(46,'MORNOS','CRISTIAN'),(47,'MOGOS','ANTONIA'),(48,'MOROSANU','ARITINA'),(49,'SOROHAN','LIVIA'),(50,'BUCUR','MIRCEA'),(51,'STANCIU','CARMEN'),(52,'TOROK','BARNA'),(53,'IONESCU','LIGIA'),(54,'POPESCU','ELENA'),(55,'BUTUZA','CRISTINA'),(56,'STOIAN','IOANA'),(57,'SAI','CLAUDIA'),(58,'PACU','IRINA'),(59,'CERNAT','MATEI'),(60,'MAN','SORIN'),(61,'DINCA','FLORIN'),(62,'PUSCASU','CATALINA'),(63,'PATPAIAC','TEODOR'),(64,'ADINA','PLOTOGEA VADANUTA'),(65,'GONGU','MIRCEA'),(66,'LAPUSAN','CARMEN'),(67,'FORTOFOIU','MARIA'),(68,'URSU','ANCA'),(69,'RADU','NICOLETA'),(70,'ERHAN','IONELA'),(71,'BULBOACA','ADRIANA'),(72,'LEVAI','ANTONIA'),(73,'ZUGRAVU','ADRIAN'),(74,'BUTU','LELIA'),(75,'MIHAILESCU','DOINA IOANA'),(76,'BANDE','ADORIAN'),(77,'ROSU','ADRIAN'),(78,'APARU','ANCA'),(79,'PUIU','GEORGIANA'),(80,'PISTOL','ADRIANA'),(81,'RADA','IOANA'),(82,'VASCU','CORNELIU'),(83,'TIGAU','MIRELA'),(84,'LUCA','ANDREI'),(85,'MUNTEAN','LIVIU'),(86,'DRACEA','LAURA LARISA'),(87,'PRUNOIU','CRISTINA'),(88,'SZINI','ELENA'),(89,'OPRESCU','NICOLETA'),(90,'DAVID','ADRIANA'),(91,'RADUTOIU','ELENA'),(92,'STOIA','STELIAN'),(93,'BOTEZ','PAUL'),(94,'VINTILA','AURA'),(95,'ROTARU','CLAUDIU'),(96,'ALDEA','RALUCA'),(97,'DABIJA','ANCA'),(98,'CITA','RADIANA'),(99,'FERICIAN','ADELA'),(100,'HADNAGY','LADISLAU'),(101,'BELEI','OANA'),(102,'COJOCARU','ADRIANA'),(103,'SANDIC','MARIA'),(104,'DATCU','ALINA'),(105,'POPESCU','CATALIN'),(106,'DAN','NICOLETA'),(107,'TANASESCU','CARMEN'),(108,'MIHAILA','ADRIAN'),(109,'COJAN','CARMEN MARIA'),(110,'URSEA','MIHAELA'),(111,'SERBAN','ANA MARIA'),(112,'CONSTANTIN','ANCA'),(113,'VLADAREANU','RADU'),(114,'COMSA','SERBAN'),(115,'ZAMFIR','MIHAELA'),(116,'POPESCU','DIANA'),(117,'SRAM','LIVIA'),(118,'SCHMIDT','ROLAND'),(119,'MIHAI','DANIEL');

INSERT INTO `SpecialitatiMedicale_temp` VALUES 	(1,'ALERGOLOGIE SI IMUNOLOGIE'),
										(2,'BOLI INFECTIOASE'),
										(3,'CARDIOLOGIE '),
										(4,'ENDOCRINOLOGIE'),
										(5,'EPIDEMIOLOGIE'),
										(6,'GASTROENTEROLOGIE'),
										(7,'GENETICA MEDICALA'),
										(8,'GERIATRIE SI GERONTOLOGIE'),
										(9,'HEMATOLOGIE'),
										(10,'MEDICINA DE FAMILIE'),
										(11,'MEDICINA DE LABORATOR'),
										(12,'MEDICINA GENERALA'),
										(13,'MEDICINA INTERNA'),
										(14,'MEDICINA MUNCII'),
										(15,'NEUROLOGIE'),
										(16,'OFTALMOLOGIE'),
										(17,'ONCOLOGIE MEDICALA'),
										(18,'ORL (OTORINOLARINGOLOGIE)'),
										(19,'ORTOPEDIE SI TRAUMATOLOGIE'),
										(20,'PEDIATRIE'),
										(21,'PNEUMOLOGIE'),
										(22,'PSIHIATRIE'),
										(23,'RADIOLOGIE - IMAGISTICA MEDICALA'),
										(24,'RECUPERARE MEDICALA'),
										(25,'REUMATOLOGIE'),
										(26,'UROLOGIE');