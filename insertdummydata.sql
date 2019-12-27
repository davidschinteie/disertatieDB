use medicalApp;

SET foreign_key_checks = 0;

-- Create tables:

/*Tabela Specialitate Medicala*/
drop table if exists SpecialitateMedicala;
create table SpecialitateMedicala(
	id_specialitate int(3) primary key auto_increment,
	specialitate varchar(50),
    salariu_min int(6),
    salariu_max int(6)
);

/*Tabela Grad Profesional Medic*/
drop table if exists GradProfesional;
create table GradProfesional(
	id_grad int(3) primary key auto_increment,
	grad_profesional varchar(20),
	salariu_min int(6),
    salariu_max int(6)
);

/*Tabela Medic*/
Drop table if exists Medic;
create table Medic(
	id_medic int(3) primary key auto_increment,
	nume varchar(25),
	prenume varchar(50),
    grad_profesional_id int(3),
    specialitate_id int(3),
    email varchar(100),
    telefon varchar(20),
    salariu int(6),
    data_angajarii date,
    foreign key (grad_profesional_id) references GradProfesional(id_grad),
    foreign key (specialitate_id) references SpecialitateMedicala(id_specialitate)
);

show tables;

/*Inserare Dummy Date*/
/*CREAREA TABELEI TEMPORARE SpecialitatiMedicale_temp*/
drop table if exists SpecialitatiMedicale_temp;
create table SpecialitatiMedicale_temp(
	id_specializare int(3) primary key auto_increment,
	specializare varchar(50)
);

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

-- insert dummy data for salariu_min
alter table SpecialitatiMedicale_temp
add column salariu_min int(6) after specializare;    

-- Range between 4700 - 6200:
SELECT (FLOOR(RAND()*(62-47))+47)*100;

SET SQL_SAFE_UPDATES = 0;
update SpecialitatiMedicale_temp 
set salariu_min = (FLOOR(RAND()*(62-47))+47)*100;

-- insert dummy data for salariu_max
alter table SpecialitatiMedicale_temp
add column salariu_max int(6) after salariu_min;

-- Range between 10500 - 14500:
SELECT (FLOOR(RAND()*(145-105))+105)*100;
update SpecialitatiMedicale_temp 
set salariu_max = (FLOOR(RAND()*(145-105))+105)*100;

-- insert data from temp to final table
insert into SpecialitatiMedicale (id_specialitate, specialitate, salariu_min, salariu_max)
select * from SpecialitatiMedicale_temp;

select * from SpecialitatiMedicale;
drop table if exists SpecialitatiMedicale_temp;
show tables;

/*CREAREA TABELEI TEMPORARE MEDIC_TEMP*/
Drop table if exists Medic_temp;
create table Medic_temp(
	id int(3) primary key auto_increment,
	nume varchar(25),
	prenume varchar(50),
	unique(nume,prenume)
);

INSERT INTO `Medic_temp` VALUES (1,'COPAESCU','CATALIN'),(2,'BRATILA','PETRE CORNEL'),(3,'RAHIMIAN','HADI'),(4,'PREDESCU','VLAD'),(5,'SURLEA','VERONICA'),(6,'SCHEINER','MIHAELA'),(7,'ULMEANU','DAN'),(8,'TOMULESCU','VICTOR'),(9,'SAFTA','DANA'),(10,'TURCU','FLORIN'),(11,'BARTA','CRISTIAN BOGDAN'),(12,'GODOROJA','DANIELA'),(13,'BORDAS','DANIEL'),(14,'OPRISIU','CARMEN'),(15,'CRISTESCU','MIHAI ADRIAN'),(16,'BARUS','JANINA'),(17,'NITA','GHEORGHE'),(18,'GRIGORUTA','SIMONA'),(19,'DANTZER','DIANA'),(20,'ANCA','ALEXANDRU'),(21,'NICOLAE','GABRIEL'),(22,'CODITA','IONELA'),(23,'GHERMAN','ADRIANA'),(24,'STANCA','IONUT'),(25,'GENUNCHE','AMELIA'),(26,'CRACIUN','ALINA'),(27,'SZATMARI','JUDIT'),(28,'BRAGARU','RADU STEFANIA'),(29,'STEFANUT','CLAUDIA'),(30,'SECARA','DIANA CRISTINA'),(31,'RUSU','ELENA GEORGIANA'),(32,'ALBEAN','DANIELA'),(33,'FLESERIU','CARMEN'),(34,'EDGHIUN','ISMAIL'),(35,'NITOIU','CONSTANTIN'),(36,'BALASA','DANIELA'),(37,'STANESCU','GEORGETA'),(38,'DUSMANU','ALINA'),(39,'POPESCU','ILEANA'),(40,'COZMA','DRAGOS'),(41,'BUZATEL','ROXANA'),(42,'TANASE','IONUT'),(43,'NEAGU','ANA MARIA'),(44,'PALADE','CRISTIAN'),(45,'CORBU','ANA'),(46,'MORNOS','CRISTIAN'),(47,'MOGOS','ANTONIA'),(48,'MOROSANU','ARITINA'),(49,'SOROHAN','LIVIA'),(50,'BUCUR','MIRCEA'),(51,'STANCIU','CARMEN'),(52,'TOROK','BARNA'),(53,'IONESCU','LIGIA'),(54,'POPESCU','ELENA'),(55,'BUTUZA','CRISTINA'),(56,'STOIAN','IOANA'),(57,'SAI','CLAUDIA'),(58,'PACU','IRINA'),(59,'CERNAT','MATEI'),(60,'MAN','SORIN'),(61,'DINCA','FLORIN'),(62,'PUSCASU','CATALINA'),(63,'PATPAIAC','TEODOR'),(64,'ADINA','PLOTOGEA VADANUTA'),(65,'GONGU','MIRCEA'),(66,'LAPUSAN','CARMEN'),(67,'FORTOFOIU','MARIA'),(68,'URSU','ANCA'),(69,'RADU','NICOLETA'),(70,'ERHAN','IONELA'),(71,'BULBOACA','ADRIANA'),(72,'LEVAI','ANTONIA'),(73,'ZUGRAVU','ADRIAN'),(74,'BUTU','LELIA'),(75,'MIHAILESCU','DOINA IOANA'),(76,'BANDE','ADORIAN'),(77,'ROSU','ADRIAN'),(78,'APARU','ANCA'),(79,'PUIU','GEORGIANA'),(80,'PISTOL','ADRIANA'),(81,'RADA','IOANA'),(82,'VASCU','CORNELIU'),(83,'TIGAU','MIRELA'),(84,'LUCA','ANDREI'),(85,'MUNTEAN','LIVIU'),(86,'DRACEA','LAURA LARISA'),(87,'PRUNOIU','CRISTINA'),(88,'SZINI','ELENA'),(89,'OPRESCU','NICOLETA'),(90,'DAVID','ADRIANA'),(91,'RADUTOIU','ELENA'),(92,'STOIA','STELIAN'),(93,'BOTEZ','PAUL'),(94,'VINTILA','AURA'),(95,'ROTARU','CLAUDIU'),(96,'ALDEA','RALUCA'),(97,'DABIJA','ANCA'),(98,'CITA','RADIANA'),(99,'FERICIAN','ADELA'),(100,'HADNAGY','LADISLAU'),(101,'BELEI','OANA'),(102,'COJOCARU','ADRIANA'),(103,'SANDIC','MARIA'),(104,'DATCU','ALINA'),(105,'POPESCU','CATALIN'),(106,'DAN','NICOLETA'),(107,'TANASESCU','CARMEN'),(108,'MIHAILA','ADRIAN'),(109,'COJAN','CARMEN MARIA'),(110,'URSEA','MIHAELA'),(111,'SERBAN','ANA MARIA'),(112,'CONSTANTIN','ANCA'),(113,'VLADAREANU','RADU'),(114,'COMSA','SERBAN'),(115,'ZAMFIR','MIHAELA'),(116,'POPESCU','DIANA'),(117,'SRAM','LIVIA'),(118,'SCHMIDT','ROLAND'),(119,'MIHAI','DANIEL');

-- insert dummy data into grad_profesional
alter table Medic_temp
add column grad_profesional enum('primar','specialist','rezident') after prenume;

select elt(0.5 + rand() * 5, 'primar','specialist','rezident','specialist','rezident');

update Medic_temp 
set grad_profesional = elt(0.5 + rand() * 5, 'primar','specialist','rezident','specialist','rezident');

SELECT grad_profesional, COUNT(*)
FROM Medic_temp      
GROUP BY grad_profesional;

-- insert dummy data into email
alter table Medic_temp
add column email varchar(100) after grad_profesional;

select lower(concat('David', elt(0.5 + rand() * 3, '_','','.'), 'Schinteie', '@', elt(0.5 + rand() * 5, 'gmail.com','yahoo.com','outlook.com','protonmail.com','aol.com')));

update Medic_temp 
set email = lower(concat(replace(prenume, ' ',''), elt(0.5 + rand() * 3, '_','','.'), nume, '@', elt(0.5 + rand() * 5, 'gmail.com','yahoo.com','outlook.com','protonmail.com','aol.com')));

-- insert dummy data into telefon
alter table Medic_temp
add column telefon varchar(20) after email;
delete from Medic_temp where id>119;

INSERT INTO `Medic_temp` (`id`,`telefon`) VALUES (1,"0761-600-926"),(2,"0785-853-326"),(3,"0743-586-713"),(4,"0764-623-355"),(5,"0774-128-523"),(6,"0729-969-565"),(7,"0721-412-439"),(8,"0772-969-797"),(9,"0781-969-370"),(10,"0776-517-349"),(11,"0725-821-878"),(12,"0771-756-806"),(13,"0776-914-683"),(14,"0763-596-252"),(15,"0774-034-320"),(16,"0782-274-255"),(17,"0761-583-251"),(18,"0770-139-841"),(19,"0785-970-268"),(20,"0727-523-144"),(21,"0721-156-096"),(22,"0783-728-496"),(23,"0736-768-365"),(24,"0784-291-614"),(25,"0723-194-510"),(26,"0763-884-434"),(27,"0723-136-085"),(28,"0783-386-503"),(29,"0726-213-820"),(30,"0767-778-559"),(31,"0779-484-246"),(32,"0789-453-761"),(33,"0779-813-562"),(34,"0766-716-714"),(35,"0747-193-575"),(36,"0765-006-107"),(37,"0742-905-842"),(38,"0748-121-492"),(39,"0784-532-164"),(40,"0777-973-061"),(41,"0774-144-697"),(42,"0729-691-844"),(43,"0738-325-676"),(44,"0773-208-281"),(45,"0780-479-271"),(46,"0775-647-508"),(47,"0731-432-812"),(48,"0772-168-218"),(49,"0773-286-877"),(50,"0735-978-537"),(51,"0730-244-883"),(52,"0731-847-539"),(53,"0784-719-271"),(54,"0748-926-354"),(55,"0720-448-277"),(56,"0737-702-812"),(57,"0781-217-542"),(58,"0773-094-520"),(59,"0763-959-749"),(60,"0743-407-376"),(61,"0776-770-003"),(62,"0731-619-609"),(63,"0760-785-444"),(64,"0771-789-885"),(65,"0721-010-773"),(66,"0770-354-212"),(67,"0729-633-927"),(68,"0749-084-509"),(69,"0775-669-350"),(70,"0734-204-473"),(71,"0783-766-713"),(72,"0746-566-207"),(73,"0744-363-262"),(74,"0747-225-807"),(75,"0738-768-807"),(76,"0728-208-361"),(77,"0742-971-321"),(78,"0731-903-535"),(79,"0776-525-846"),(80,"0775-908-247"),(81,"0725-244-841"),(82,"0731-953-553"),(83,"0737-327-256"),(84,"0739-391-269"),(85,"0780-773-180"),(86,"0747-197-920"),(87,"0721-298-095"),(88,"0779-326-592"),(89,"0731-836-366"),(90,"0761-418-828"),(91,"0768-256-936"),(92,"0789-437-678"),(93,"0720-450-349"),(94,"0772-000-669"),(95,"0781-900-427"),(96,"0789-699-177"),(97,"0736-502-056"),(98,"0768-088-243"),(99,"0731-364-386"),(100,"0766-066-516"),(101,"0778-190-570"),(102,"0725-308-864"),(103,"0735-032-934"),(104,"0767-425-358"),(105,"0785-296-686"),(106,"0721-212-883"),(107,"0739-086-896"),(108,"0744-006-005"),(109,"0788-599-870"),(110,"0781-191-793"),(111,"0779-011-205"),(112,"0738-237-301"),(113,"0788-193-367"),(114,"0776-676-886"),(115,"0744-654-493"),(116,"0778-289-838"),(117,"0760-751-657"),(118,"0725-991-017"),(119,"0721-674-489")
on duplicate key update telefon = values(telefon);

-- insert dummy data into salariu
alter table Medic_temp
add column salariu int(6) after telefon;

update Medic_temp
set salariu = (FLOOR(RAND()*(62-47))+47)*100
where grad_profesional = 'rezident';

update Medic_temp
set salariu = (FLOOR(RAND()*(99-73))+73)*100
where grad_profesional = 'specialist';

update Medic_temp
set salariu = (FLOOR(RAND()*(145-105))+105)*100
where grad_profesional = 'primar';

select * from Medic_temp where grad_profesional = 'rezident';

-- insert dummy data into data_angajarii
alter table Medic_temp
add column data_angajarii date after grad_profesional;

alter table Medic_temp 
modify column data_angajarii date after salariu;

INSERT INTO `Medic_temp` (`id`,`data_angajarii`) VALUES (1,"2009-05-26"),(2,"2015-09-27"),(3,"2012-07-12"),(4,"2012-04-22"),(5,"2015-11-27"),(6,"2019-08-11"),(7,"2018-02-19"),(8,"2009-03-18"),(9,"2009-04-24"),(10,"2008-04-13"),(11,"2012-11-04"),(12,"2017-12-05"),(13,"2009-11-08"),(14,"2011-05-07"),(15,"2011-12-13"),(16,"2009-09-19"),(17,"2011-09-20"),(18,"2008-11-01"),(19,"2011-09-30"),(20,"2015-05-12"),(21,"2014-04-24"),(22,"2009-10-23"),(23,"2008-02-10"),(24,"2019-11-02"),(25,"2011-12-20"),(26,"2013-01-03"),(27,"2015-07-18"),(28,"2010-04-29"),(29,"2015-08-24"),(30,"2009-12-21"),(31,"2008-11-13"),(32,"2016-08-22"),(33,"2016-12-10"),(34,"2015-12-06"),(35,"2011-03-23"),(36,"2013-03-28"),(37,"2018-05-14"),(38,"2012-10-26"),(39,"2011-09-18"),(40,"2019-03-10"),(41,"2016-03-29"),(42,"2011-08-02"),(43,"2008-11-26"),(44,"2012-05-07"),(45,"2008-12-11"),(46,"2018-05-12"),(47,"2011-02-14"),(48,"2015-11-15"),(49,"2016-09-07"),(50,"2016-06-30"),(51,"2014-05-22"),(52,"2016-01-06"),(53,"2016-12-06"),(54,"2013-05-17"),(55,"2009-09-02"),(56,"2008-04-15"),(57,"2013-02-07"),(58,"2019-02-09"),(59,"2017-04-13"),(60,"2009-10-20"),(61,"2009-07-19"),(62,"2019-04-30"),(63,"2008-12-05"),(64,"2011-04-30"),(65,"2008-08-22"),(66,"2008-06-28"),(67,"2013-06-27"),(68,"2014-08-03"),(69,"2016-09-05"),(70,"2018-04-04"),(71,"2014-06-16"),(72,"2012-04-19"),(73,"2008-07-01"),(74,"2018-08-19"),(75,"2013-01-25"),(76,"2014-03-05"),(77,"2019-09-30"),(78,"2019-07-16"),(79,"2019-01-07"),(80,"2017-01-31"),(81,"2016-01-29"),(82,"2013-08-24"),(83,"2019-10-22"),(84,"2016-09-20"),(85,"2016-12-18"),(86,"2013-10-08"),(87,"2016-11-27"),(88,"2016-05-06"),(89,"2013-10-04"),(90,"2009-10-11"),(91,"2011-11-01"),(92,"2011-09-27"),(93,"2009-11-22"),(94,"2013-02-09"),(95,"2019-09-03"),(96,"2009-06-27"),(97,"2011-06-18"),(98,"2018-08-23"),(99,"2013-10-10"),(100,"2013-02-18"),(101,"2008-01-28"),(102,"2016-03-10"),(103,"2010-08-13"),(104,"2018-07-22"),(105,"2010-07-23"),(106,"2015-10-11"),(107,"2018-04-12"),(108,"2010-06-17"),(109,"2010-02-19"),(110,"2009-07-15"),(111,"2013-04-17"),(112,"2014-11-08"),(113,"2009-11-02"),(114,"2013-11-16"),(115,"2019-05-22"),(116,"2008-02-21"),(117,"2015-08-24"),(118,"2011-07-27"),(119,"2012-07-21")
on duplicate key update data_angajarii = values(data_angajarii);
          
-- insert data from temp to final table
insert into Medic (id_medic, nume, prenume, grad_profesional, email, telefon, salariu, data_angajarii)
select * from Medic_temp;

select * from Medic;
drop table if exists Medic_temp;
show tables;
          
select id_medic, nume, prenume, grad_profesional, email, telefon, salariu, date_format(data_angajarii, '%Y-%m-%d') as data_formatted from Medic;

-- insert data into GradProfesional table
insert into GradProfesional (grad_profesional) values ('primar'),('specialist'),('rezident');

insert into GradProfesional (id_grad, salariu_min, salariu_max) values (1, 10500, 14500),(2, 7300, 9900),(3, 4700, 6200) on duplicate key update salariu_min = values(salariu_min), salariu_max = values(salariu_max);
delete from GradProfesional where id_grad>3;
select * from GradProfesional;

alter table Medic
add column grad_profesional_id int(3) after grad_profesional;

update Medic
set grad_profesional_id = 1
where grad_profesional = 'primar';

update Medic
set grad_profesional_id = 2
where grad_profesional = 'specialist';

update Medic
set grad_profesional_id = 3
where grad_profesional = 'rezident';

alter table Medic drop column grad_profesional;

select * from SpecialitateMedicala;

alter table Medic
add column specialitate_id int(3) after grad_profesional_id;

update Medic set specialitate_id = id_medic - 104 where id_medic > 104;

select * from Medic;
select * from SpecialitateMedicala;
select * from GradProfesional;