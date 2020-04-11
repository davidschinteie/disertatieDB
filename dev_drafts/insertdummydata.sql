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

select * from SpecialitateMedicala;
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

-- Tabelele pentru cabinete si policlinici:

/*Tabela Impartirii locatiilor pe Zone */
drop table if exists Zona;
create table Zona(
	id_zona int(3) primary key auto_increment,
    denumire varchar(50)
);

/*Tabela Policlinica */
Drop table if exists Policlinica;
create table Policlinica(
	id_policlinica int(3) primary key auto_increment,
	denumire varchar(50),
    email varchar(100),
    telefon varchar(20),
    adresa varchar(225),
    link_google_map varchar(225),
    zona_id int(3),
    data_deschiderii date,
    chiria_lunara int(6),
    foreign key (zona_id) references Zona(id_zona)
);

/*Tabela Cabinet*/
Drop table if exists Cabinet;
create table Cabinet(
	id_cabinet int(3) primary key auto_increment,
	denumire varchar(50),
    specialitate_id int(3),
    policlinica_id int(3),
    foreign key (specialitate_id) references SpecialitateMedicala(id_specialitate),
    foreign key (policlinica_id) references Policlinica(id_policlinica)
);

/*Tabela Programul Cabinetelor Medicale/Policlinicilor */
drop table if exists Program;
create table Program(
	id_program int(3) primary key auto_increment,
    ziua_saptamanii varchar(50),
    ora_inceput time,
    ora_sfarsit time,
    cabinet_id int(3),
    foreign key (cabinet_id) references Cabinet(id_cabinet)
);

-- insert dummy data into zona/locatii:
insert into Zona (denumire) values ('Zona Centrala'),('Cartierul Berceni'),('Cartierul Militari'),('Cartierul Floreasca'),('Cartierul Aviatorilor'),('Cartierul Aviatiei'), ('Cartierul Colentina'), ('Cartierul Giulesti');

select * from Zona;

-- insert dummy data in tabela cu Programul Cabinetelor Medicale/Policlinicilor
-- @ todo !!

-- insert dummy data in tabela Policlinica
insert into Policlinica (denumire, email, telefon, adresa, zona_id, link_google_map) 
	values 	('TITU MAIORESCU', 'titu_maiorescu@clinica_med.ro', '021-9212', 'Calea Vacaresti 189', 1, 'https://goo.gl/maps/JWwmj54Z7AMHRJgx5'), 
			('ORHIDEEA', 'orhideea@clinica_med.ro', '021-9213', 'Splaiul Independentei 319C', 8, 'https://goo.gl/maps/cF4kjd2uLCaLrK8J7'), 
            ('COTROCENI', 'cotroceni@clinica_med.ro', '021-9214', 'Soseaua Cotroceni 20', 1, 'https://goo.gl/maps/6R4crrwGjMygALHU8'), 
            ('ENESCU', 'enescu@clinica_med.ro', '021-9215', 'Strada George Enescu 12', 1, 'https://goo.gl/maps/hG9R3P2cAG7HNaML9'), 
            ('FLOREASCA', 'floreasca@clinica_med.ro', '021-9216', 'Strada Axinte Uricariul', 4, 'https://goo.gl/maps/RThPLu1sycY5n69T9'), 
            ('AVIATIEI', 'aviatiei@clinica_med.ro', '021-9217', 'Calea Floreasca 169A', 6, 'https://goo.gl/maps/i98wHj4zURppzp6z5'), 
            ('LUJERULUI', 'lujerului@clinica_med.ro', '021-9218', 'Bulevardul Iuliu Maniu 51', 3, 'https://goo.gl/maps/ZWj5cb2wnCZ24n6M7'), 
            ('SUN PLAZA', 'sun_plaza@clinica_med.ro', '021-9219', 'Calea Vacaresti 391', 2, 'https://goo.gl/maps/qAemtskpWdMKhwas8'), 
            ('VICTORIA', 'victoria@clinica_med.ro', '021-9261', 'Strada Buzesti 75', 1, 'https://goo.gl/maps/Y4TzUNcjeHZ7VjM48'),
            ('DOROBANTI', 'dorobanti@clinica_med.ro', '021-9265', 'Calea Dorobanti 240', 5, 'https://goo.gl/maps/Z4QvA2SnNFdFe8nm6'),
            ('DOAMNA GHICA', 'doamna_ghica@clinica_med.ro', '021-9267', 'Strada Doamna Ghica 135', 7, 'https://goo.gl/maps/GeKJyuEZfsBT2gHa9');

-- insert dummy data for chirie_lunara range between 10500 - 14500:
update Policlinica
set chirie_lunara = (FLOOR(RAND()*(145-105))+105)*100;

-- insert dummy data for data_deschiderii:
INSERT INTO Policlinica (`id_policlinica`,`data_deschiderii`) VALUES (1,"2009-05-26"),(2,"2015-09-27"),(3,"2012-07-12"),(4,"2012-04-22"),(5,"2015-11-27"),(6,"2019-08-11"),(7,"2018-02-19"),(8,"2009-03-18"),(9,"2009-04-24"),(10,"2008-04-13"),(11,"2012-11-04")
on duplicate key update data_deschiderii = values(data_deschiderii);

select * from Policlinica;

insert into Cabinet values 
(21, 'Cabinet 1', (FLOOR(RAND()*26)+1), 3),
(22, 'Cabinet 2', (FLOOR(RAND()*26)+1), 3),
(23, 'Cabinet 3', (FLOOR(RAND()*26)+1), 3),
(24, 'Cabinet 4', (FLOOR(RAND()*26)+1), 3),
(25, 'Cabinet 5', (FLOOR(RAND()*26)+1), 3),
(26, 'Cabinet 6', (FLOOR(RAND()*26)+1), 3),
(27, 'Cabinet 7', (FLOOR(RAND()*26)+1), 3),
(28, 'Cabinet 8', (FLOOR(RAND()*26)+1), 3),
(29, 'Cabinet 9', (FLOOR(RAND()*26)+1), 3),
(30, 'Cabinet 10', (FLOOR(RAND()*26)+1), 3),
(31, 'Cabinet 1', (FLOOR(RAND()*26)+1), 4),
(32, 'Cabinet 2', (FLOOR(RAND()*26)+1), 4),
(33, 'Cabinet 3', (FLOOR(RAND()*26)+1), 4),
(34, 'Cabinet 4', (FLOOR(RAND()*26)+1), 4),
(35, 'Cabinet 5', (FLOOR(RAND()*26)+1), 4),
(36, 'Cabinet 6', (FLOOR(RAND()*26)+1), 4),
(37, 'Cabinet 7', (FLOOR(RAND()*26)+1), 4),
(38, 'Cabinet 8', (FLOOR(RAND()*26)+1), 4),
(39, 'Cabinet 9', (FLOOR(RAND()*26)+1), 4),
(40, 'Cabinet 10', (FLOOR(RAND()*26)+1), 4),
(41, 'Cabinet 1', (FLOOR(RAND()*26)+1), 5),
(42, 'Cabinet 2', (FLOOR(RAND()*26)+1), 5),
(43, 'Cabinet 3', (FLOOR(RAND()*26)+1), 5),
(44, 'Cabinet 4', (FLOOR(RAND()*26)+1), 5),
(45, 'Cabinet 5', (FLOOR(RAND()*26)+1), 5),
(46, 'Cabinet 6', (FLOOR(RAND()*26)+1), 5),
(47, 'Cabinet 7', (FLOOR(RAND()*26)+1), 5),
(48, 'Cabinet 8', (FLOOR(RAND()*26)+1), 5),
(49, 'Cabinet 9', (FLOOR(RAND()*26)+1), 5),
(50, 'Cabinet 10', (FLOOR(RAND()*26)+1), 5),
(51, 'Cabinet 1', (FLOOR(RAND()*26)+1), 6),
(52, 'Cabinet 2', (FLOOR(RAND()*26)+1), 6),
(53, 'Cabinet 3', (FLOOR(RAND()*26)+1), 6),
(54, 'Cabinet 4', (FLOOR(RAND()*26)+1), 6),
(55, 'Cabinet 5', (FLOOR(RAND()*26)+1), 6),
(56, 'Cabinet 6', (FLOOR(RAND()*26)+1), 6),
(57, 'Cabinet 7', (FLOOR(RAND()*26)+1), 6),
(58, 'Cabinet 8', (FLOOR(RAND()*26)+1), 6),
(59, 'Cabinet 9', (FLOOR(RAND()*26)+1), 6),
(60, 'Cabinet 10', (FLOOR(RAND()*26)+1), 6),
(61, 'Cabinet 1', (FLOOR(RAND()*26)+1), 7),
(62, 'Cabinet 2', (FLOOR(RAND()*26)+1), 7),
(63, 'Cabinet 3', (FLOOR(RAND()*26)+1), 7),
(64, 'Cabinet 4', (FLOOR(RAND()*26)+1), 7),
(65, 'Cabinet 5', (FLOOR(RAND()*26)+1), 7),
(66, 'Cabinet 6', (FLOOR(RAND()*26)+1), 7),
(67, 'Cabinet 7', (FLOOR(RAND()*26)+1), 7),
(68, 'Cabinet 8', (FLOOR(RAND()*26)+1), 7),
(69, 'Cabinet 9', (FLOOR(RAND()*26)+1), 7),
(70, 'Cabinet 10', (FLOOR(RAND()*26)+1), 7),
(71, 'Cabinet 1', (FLOOR(RAND()*26)+1), 8),
(72, 'Cabinet 2', (FLOOR(RAND()*26)+1), 8),
(73, 'Cabinet 3', (FLOOR(RAND()*26)+1), 8),
(74, 'Cabinet 4', (FLOOR(RAND()*26)+1), 8),
(75, 'Cabinet 5', (FLOOR(RAND()*26)+1), 8),
(76, 'Cabinet 6', (FLOOR(RAND()*26)+1), 8),
(77, 'Cabinet 7', (FLOOR(RAND()*26)+1), 8),
(78, 'Cabinet 8', (FLOOR(RAND()*26)+1), 8),
(79, 'Cabinet 9', (FLOOR(RAND()*26)+1), 8),
(80, 'Cabinet 10', (FLOOR(RAND()*26)+1), 8),
(81, 'Cabinet 1', (FLOOR(RAND()*26)+1), 9),
(82, 'Cabinet 2', (FLOOR(RAND()*26)+1), 9),
(83, 'Cabinet 3', (FLOOR(RAND()*26)+1), 9),
(84, 'Cabinet 4', (FLOOR(RAND()*26)+1), 9),
(85, 'Cabinet 5', (FLOOR(RAND()*26)+1), 9),
(86, 'Cabinet 6', (FLOOR(RAND()*26)+1), 9),
(87, 'Cabinet 7', (FLOOR(RAND()*26)+1), 9),
(88, 'Cabinet 8', (FLOOR(RAND()*26)+1), 9),
(89, 'Cabinet 9', (FLOOR(RAND()*26)+1), 9),
(90, 'Cabinet 10', (FLOOR(RAND()*26)+1), 9),
(91, 'Cabinet 1', (FLOOR(RAND()*26)+1), 10),
(92, 'Cabinet 2', (FLOOR(RAND()*26)+1), 10),
(93, 'Cabinet 3', (FLOOR(RAND()*26)+1), 10),
(94, 'Cabinet 4', (FLOOR(RAND()*26)+1), 10),
(95, 'Cabinet 5', (FLOOR(RAND()*26)+1), 10),
(96, 'Cabinet 6', (FLOOR(RAND()*26)+1), 10),
(97, 'Cabinet 7', (FLOOR(RAND()*26)+1), 10),
(98, 'Cabinet 8', (FLOOR(RAND()*26)+1), 10),
(99, 'Cabinet 9', (FLOOR(RAND()*26)+1), 10),
(100, 'Cabinet 10', (FLOOR(RAND()*26)+1), 10),
(101, 'Cabinet 1', (FLOOR(RAND()*26)+1), 11),
(102, 'Cabinet 2', (FLOOR(RAND()*26)+1), 11),
(103, 'Cabinet 3', (FLOOR(RAND()*26)+1), 11),
(104, 'Cabinet 4', (FLOOR(RAND()*26)+1), 11),
(105, 'Cabinet 5', (FLOOR(RAND()*26)+1), 11),
(106, 'Cabinet 6', (FLOOR(RAND()*26)+1), 11),
(107, 'Cabinet 7', (FLOOR(RAND()*26)+1), 11),
(108, 'Cabinet 8', (FLOOR(RAND()*26)+1), 11),
(109, 'Cabinet 9', (FLOOR(RAND()*26)+1), 11),
(110, 'Cabinet 10', (FLOOR(RAND()*26)+1), 11);

select id_policlinica, Policlinica.denumire, email, telefon, adresa, link_google_map, Zona.denumire as zona, data_deschiderii, chirie_lunara from Policlinica, Zona where Policlinica.zona_id = Zona.id_zona;
select Cabinet.id_cabinet, Cabinet.denumire as Cabinet, SpecialitateMedicala.specialitate, Policlinica.denumire as Policlinica from Cabinet
    inner join SpecialitateMedicala on Cabinet.specialitate_id = SpecialitateMedicala.id_specialitate
    inner join Policlinica on Cabinet.policlinica_id = Policlinica.id_policlinica
    where id_cabinet = 100;

select * from SpecialitateMedicala;

select * from Cabinet;

select * from Policlinica;
SELECT id_cabinet, denumire, specialitate_id, policlinica_id where id_cabinet = '111';
SELECT id_specialitate FROM SpecialitateMedicala WHERE specialitate = 'UROLOGIE';
SELECT id_policlinica FROM Policlinica WHERE denumire = 'TITU MAIORESCU';



-- insert dummy data in Utilizator
insert into Utilizator (nume, prenume, email, telefon) select nume, prenume, email, telefon from Medic_temp;

select * from Utilizator;

SELECT LEFT(email,INSTR(email,"@")-1) AS FirstValue From Medic_temp;
SET SQL_SAFE_UPDATES = 0;
update Utilizator set nume_utilizator = LEFT(email,INSTR(email,"@")-1);

insert into Utilizator (id_utilizator, parola_criptata) values 
(1, '11cd91fbbc2a466e34ed4d321cd112a9')
,(2, '901a3bc75dfd7f478e5b3947888a1e02')
,(3, 'b67bf4b743275a61d90a87cb4c7a502e')
,(4, 'ee305057e40921b173468c1c62520000')
,(5, 'c79de5c991bcfedf1db798cfd8d90209')
,(6, 'e08430953c7633f7c1c7bbd2c752e2a2')
,(7, '9f732cb8687e245904d3a847cc100e24')
,(8, '3b044df83831bf4983844359aa8601ff')
,(9, '2b1c15fea9eb36adb6b18d64a57711ac')
,(10, 'c306fb7cb362b0da013ab8e3329d7d81')
,(11, '33da115883a38d609ea66ca9ca330edd')
,(12, '2190ce87d619e0d8bd4965cf1c33ddb9')
,(13, '75a02d520fd493b8a99cebba889d975b')
,(14, '9b0f80297e2ce927fe910f5768cb6ab8')
,(15, 'cda6c88058d39a3ec662b27d0d51895d')
,(16, 'cb047d19d6c65d336b1ba226d4b7e953')
,(17, '72163168f08b35cec9945c4021efc609')
,(18, 'beba028da5913e64710e12f5813cfc67')
,(19, '589bdf63466bff7021906bad6bd9aa25')
,(20, 'ec6193e7b5e23688e25dc7234fcab56b')
,(21, 'ad6b3e42ebcc874439ee55e41f6b3819')
,(22, '996a57a28e675c7a269c7868d9451cb2')
,(23, '4fb94997b610b6a655f654cd7276db92')
,(24, '2dce9e20e4c45e5072e23847babc1680')
,(25, '9f601be3d03c02e040745343a6de92a6')
,(26, '724fa8ff44e230ba311a00ba4af54ba9')
,(27, 'fdc242cf328ac927de08f38d800a8d3b')
,(28, 'ff93855a8a350f89d92e981ea842b12d')
,(29, '1a47d39a12ca9573f7ba835e42d15797')
,(30, 'd8480ca0dab2aabbd4797b41afb2e34e')
,(31, 'b1641b325b949a80d916564ad2e34590')
,(32, '30e57a2d7b58af450c000926bc13e274')
,(33, 'e1f7153d447659a69160b70830d0c444')
,(34, '5fb2187e055ecc81ecea309fe9a29605')
,(35, '52a72738c2c0354228747b4abdee5047')
,(36, 'a76efca534485f2f33324359b4b3b194')
,(37, '44f2494709215b727b69008ed8bba956')
,(38, '7655964feaf3b7d1fc16ced27e355f93')
,(39, '8bbb666c4c06c032cae6f564f37650af')
,(40, 'e66c3a49f6ceec7ba8aa9bfd27dcff27')
,(41, '1df502b2c79729e54a9bda4457619093')
,(42, '64014cd02441776e82fb84a2cd18993e')
,(43, '8aabe983e8c63c05823717d8bcfd7931')
,(44, '00e80c6d3e566d65bbf7e71f9a969ad5')
,(45, '29ee747b5a2cb20fd5559ba719b5fa26')
,(46, '81d8717a9660518dafda94c8c8a3a5a2')
,(47, '77d8e03b2eef94f8e5065acb609370f0')
,(48, 'd16ce64d43706dc79114f0427f3ca761')
,(49, '0df3821b2d88498fd5a7ed9fb6ed677a')
,(50, '52049b84a2108136d9969d889fb04913')
,(51, '2b6870f761f94ee07c1db1e3ce8a946e')
,(52, 'a3be026391e77738c6ac56b99fafbe24')
,(53, 'cc69fbc6a8b321d151721e5301488315')
,(54, '183a649be310f0be119592f055bf88a3')
,(55, '04fcaac7991b950b09ccde85f722ae5a')
,(56, 'd6cb971fdc152e342119abfea87a3f9a')
,(57, '3fe0552a0943a800db64a515e3456132')
,(58, '5e5d4c23bf65e7b042530e006e3c5c97')
,(59, 'fc9c288c9dcf397cb8891e4a4b95844b')
,(60, '0e5bbf65fe071df9f970e6a361b7e0aa')
,(61, '809262edac70c4cd7478c52cc10ac051')
,(62, 'dee1020b292182161873b324d737bca2')
,(63, '79fd9cb4324c36cc14876ec103a066f3')
,(64, '215ddbf5986ea48bc1efe56dd648020f')
,(65, 'dbdade9a19cf343f2cd1f4fe67a88205')
,(66, '7232a3eb199cc05bbea98528287a99b8')
,(67, '7a19fe8d043900138a9651864152bf5f')
,(68, '5409d9a75b58ece638b34a9f880ff978')
,(69, '8568eb81e378d712034c8c8e9548b01a')
,(70, 'bc562a9c59130ebdbc02fc1bb6609c0e')
,(71, 'cda9efd2dc0b62763adad42778247c69')
,(72, 'caaa6b53ed9c58d7e953d9bd456cd1e4')
,(73, 'd3800c8ae6ff24ac1cc56b48bb3ba322')
,(74, '5530f3ad8bb1cf5d102b62fbdcf6743f')
,(75, '46fda141cd9b4d0bfb3276dca4043a74')
,(76, 'ed9eb4ca82214cccfb89e8084409ac23')
,(77, '669f65763aa7c15e35e02dfc97a70bdd')
,(78, '31f46cb39e57aafd6730c871dea25df3')
,(79, '7786562063a703b3e3b178db2631a918')
,(80, '36a01197e480ef30b2da09c7d25bb222')
,(81, '642066ba24a15d733420e48546606693')
,(82, '5e64b3e46852ad913f176a015dcdc84c')
,(83, 'b4748f249236450b6d0ec6ce3328183b')
,(84, 'be4e8b8e7042964d584cc4056b7b6d60')
,(85, '1376173a04e12c802f77a7590e48117a')
,(86, '578d81bfae69f17aa71fcd536234aa75')
,(87, '9efd4a7ff57325b7b8e468932fcabf94')
,(88, '57d3a01a57b0ba6fddd9ee399acab3ce')
,(89, '94a5a78d9b05a55a28c3c0fa1ccb67c9')
,(90, '84d4c70464b81a82acf863a9286e7a51')
,(91, '4b8490ecefaf66becd28426b1a9e61a6')
,(92, 'a65b406d6315ea174d4484385b40247c')
,(93, 'a4898cac1b2afdac1b57fafc56b18a08')
,(94, 'a6b72c5b301dbc0c1eddf6c1d14d20f8')
,(95, 'c9a7b2cb63feab0edd54c1d29daf84ff')
,(96, 'cd20bdb69becc716ff2a01fddc19514d')
,(97, 'f7ed55361dbdf8ec18df4ddbaddd9eb5')
,(98, '4d947a012963470f06b065d581c81be6')
,(99, '3265e01989a39f9e90374c6844aa3d19')
,(100, '1c61a6b7f740a9546f7a0c1d4bfafde9')
,(101, '471d1735d3ed6b9e2a785d35ae0f02f6')
,(102, '501c0c6d339a8299d39e3333e9326580')
,(103, '7aa4d116bbed7e418a7f517e2f00da08')
,(104, '49467b408cd48c78c1ae101179d774da')
,(105, '0eb7aeb344ec40f7e8faec16bb9c9f66')
,(106, 'da736b9706a9048386c9581afbc2cab6')
,(107, 'c1023c6b48578f597bb0f07773552144')
,(108, '302fe7a72f95998deeddd1029353c945')
,(109, '2fa99929b831a8ed651c9551b90b51aa')
,(110, '14523fb9fea24ba763e1305def35fbfd')
,(111, 'ce459370b86688f3346a24015c20d329')
,(112, '8197ba5e5c993ef9f34153a1d59d2284')
,(113, 'cba997f55175e419d0577699c284e620')
,(114, 'd86e9413550354984958d27564dcb5c3')
,(115, 'adb3bf1a79717d4bcc7b6395a83ba17c')
,(116, 'ba0a2ebf840444522de279daf22ee8f2')
,(117, '7fb2664f110dcfe4e1e80a79867f18cf')
,(118, '13ce7c16ed7ab060f0eed9db047befee')
,(119, '249ca294bc324bea9f7ab2bd80b42181')
ON DUPLICATE KEY UPDATE parola_criptata = values(parola_criptata);

-- Range between 50 - 150:
select (FLOOR(RAND()*(150-50))+50);
update Utilizator set numar_autentificari = (FLOOR(RAND()*(150-50))+50);
update Utilizator set numar_invitatii = (FLOOR(RAND()*(5-1))+1);

select * from Utilizator;

-- Range between 0 - 2 years from given base date:
select FROM_UNIXTIME(UNIX_TIMESTAMP('2018-01-30 14:53:27') + FLOOR(0 + (RAND() * 63072000)));
update Utilizator set invitatie_creata_la = FROM_UNIXTIME(UNIX_TIMESTAMP('2018-01-30 14:53:27') + FLOOR(0 + (RAND() * 63072000)));
update Utilizator set ultima_autentificare = FROM_UNIXTIME(UNIX_TIMESTAMP('2020-01-30 14:53:27') + FLOOR(0 + (RAND() * 5259488)));

update Utilizator set invitatie_acceptata_la = FROM_UNIXTIME(UNIX_TIMESTAMP(invitatie_creata_la) + FLOOR(180 + (RAND() * 172800)));
update Utilizator set creat_la = FROM_UNIXTIME(UNIX_TIMESTAMP(invitatie_acceptata_la) + FLOOR(120 + (RAND() * 120)));
update Utilizator set actualizat_la = FROM_UNIXTIME(UNIX_TIMESTAMP(ultima_autentificare) - FLOOR(172800 + (RAND() * 5259488)));

--  Generate Random IP Address
SELECT CONCAT(
  FLOOR(2 + (RAND() * 250)), '.' ,
  FLOOR(2 + (RAND() * 250)), '.' ,
  FLOOR(2 + (RAND() * 250)), '.' ,
  FLOOR(2 + (RAND() * 250))
);

alter table Utilizator modify ip_ultima_autentificare varchar (100);
update Utilizator set ip_ultima_autentificare = CONCAT(
  FLOOR(2 + (RAND() * 250)), '.' ,
  FLOOR(2 + (RAND() * 250)), '.' ,
  FLOOR(2 + (RAND() * 250)), '.' ,
  FLOOR(2 + (RAND() * 250))
);

insert into Utilizator (id_utilizator, token_invitatie) values
(1, 'ffO77H5RpZJMLcMJWTaMdfTrQOnEZe1j1muYAIKx6gidHechePHDe9oUSvT809mj'),
(2, '2JuW1l7VFHcRQgUtVChvwbIuvRNxlw99WegS5I6pH2o8coAkaMewwXpk5yD6UATS'),
(3, 'wA9nPYDVA1jZ8A2CBEwtJvo6wriopIMaswACe4AVCHlRYk5YoZwi6vSDtLeGrfff'),
(4, 'uSSETjpGJRqLLbD7RN5oK8C0DftXuIsMv4JgsfW7hMSo2M03OuW1Yznat0VRJ2L1'),
(5, '5i6sBmhxotACLrj0O88dFnNnBtcvugQUqWrwqkX8cf2t43Zqs7N0KNg5IgQ9oPHY'),
(6, 'WPynFadtWaYAaxOIVawsR9dBmCWwam8W0TKFHrgj7d6Q4ZpRLu8wgXcHI0bHZwQp'),
(7, 'l9qxBhxLnUQv8fBNjqDFlKZCIzu4koSLfkNhoG8PLQr34ROUTmMwwOg8vo23oPI6'),
(8, '3QxMs0WEjbM5Tg4wImc8FxCcX3pSFmRHA2ptKLffmR0toUKwMnUt8PIKJuKVQW3f'),
(9, 'Q81y3nswRzYwG6sYI33bG6gf7dvuWFVONiWZf2nRmJIuOD5n50K0DncSz7TalF0b'),
(10, 'Nj2rx1jpvD94Y1PeoZG6wH9aJXTMEdE1RFVbMcp1dZI12zdap08OFL5BfFH6ESfw'),
(11, '0Ut9qJ2FghhbBddaoZhfesXzSusON5cCwN7JBTQjq23TopwDL7nKOym6C9f4Rp0r'),
(12, '5V4ivoiQpt0qH7V8YqbCRr5WjEqJXWxLsH8SGTbgNdiHZI9m55JOeo0RDiMqCjkw'),
(13, 'RkMH4K3SnVXQbaoCWUuLEkdqkQIkE9qtVGvcH96KhbaCOPr7QIlqdAI4GUYikB3y'),
(14, '9ThCQvrQVKG6QWXnd3qfhaRjrCctA3V2HZbWMZxgFL1E9btAbFdFqUSJtlE0WvM8'),
(15, 'I5y6llUUddBYalko5EE7tu2ANH2peFlwUj0RxTukDJwpRu0N62ZieulRcX6Bp7My'),
(16, 'rnMJWE291gT5lfkSXHW9ruF8dz22npeL2UFD1tygie5CVYCQsyre078HfLt4kHvo'),
(17, 'HxVIvH902pw0XWUS8hDJLVA4UfVrmDB5Aa2LrSe22NYOtCSB2aM1WPlZl6iqRmTg'),
(18, 'ZqZPLA7xaSWgjI2NWMDUH1JlEFh9otIkVPn6711PkvVVHoKJwGI0wQ3LYv4pfhoV'),
(19, 'Tsw77WeJH8KTwtZ88ipOxx6BUcJGVPD1Nr4iNxKOHiFUTILshk0QZ9djmRJ3ZtUH'),
(20, '7eehwN1xuPofp2CRjbpwU8Df4rRqK4acmTQYoIseiq2ALhCm4HZLvNPFx4K7eHTb'),
(21, '1UcWBbB9OeqeJuCqYSO1wi8XDvi12JiZV6DuRSB1cyIttT8dPf7FA0pqUxZuC9HS'),
(22, 'Ki7ztVgGaNUcqHGvxPaooXMcuJXj594yWI9zWHTz3X9uqZsKrEGsNBvzjJsI3ule'),
(23, 'nrJjmniLt4beDKwRdaronnQZ5QHTvO4ujPlVkQUBeU4bOe6GH5XY89eOLsxuw915'),
(24, 'f60tr1Chy3Wckmi9WxOU0dmTTp2leVHvfzpreH2P76YccBxGMMNnKhnLmMUdOog1'),
(25, 'qQmKau4l3UOtpgO3aHGZVIxvyA3PFfaT0IjwapxPaKnoa1eMy6tNJgLWThkh1QLw'),
(26, 'bQZ5HntAQQWwi9jV78xDpXSLqlP81XYOz7DzCaOcWUOUNKsDNHzpZpkXpxx1DyvL'),
(27, 'fQUOR8hi9bLvoMUwotxi8mEydfmZX3BURLXY041BxVWPNC8IIovRyP58hXkKqZ6p'),
(28, '37349bfNujSbgvbXPzkUNLjarVBobtaEBlVwP38Zf81LxsBsQletWziNd4KwZcvA'),
(29, 'E8AMWzuDFmxSQnJnesuxWS1gDSTjCn1JZnPxxiU4EYeremKohCVU8L6gTBXevPdL'),
(30, '86UIJDXZ1xwZWxULtq5PAyrcPJ2mSWT72GffgOq2XzxxTr1kTA3EJagcBCKfb1No'),
(31, 'nJJkoueChalhQkgqjnKjHQmBtliDDgiDqNhlO8AOgz38cKSdlYztn5DJV49GuWS6'),
(32, 'zyzmZvnrsShdrZDCqS9CA1PuMSFYMXAgHSbZYrzBsyPQv38rRLS0GIsDOgqCxQCS'),
(33, '3HxlpVY4SWVDzk5SRKEXfdcJqZktcjFNgsnOg7xq4C0cOeImboIoCW06VRjtDZH8'),
(34, 'tfy9pg5ChoNzd9g7cqcFoXxxJURQPPTq3E6roRxko8hezsy9jouW7FfrnhJqdNL0'),
(35, 'UnNd2c33TvDi4HGEviOqiSe1clWz9MP6PrrQ7BEkZfTJRrokrcDPnAhbipMr4L6x'),
(36, '4UMeffsFXzqYLxFphFmKAguHEtqCIBnZ2J3lMaA9x8Tf8kWYcaSE2I5qWBsKADXM'),
(37, 'VaOM70SNrdi1LWRtnRb7E11Irwrg7Dh4f7MYdZOeXjLXp3UMsYM64q2GWp0ldKy9'),
(38, 'xawHSzM731iB39TeydBLrg0BK1Bx5CzEFf11ab0xtgrK4gNfXNDs7CXKvyqYZ50k'),
(39, 'tDlO74JQ6cB5CiaSgDlEbXeao1zGwcgbNIyl9bRokAqM0YIx8lKMoTnOu20bMv1W'),
(40, 'NzNLVtRdYh0Xcg4o6Q5FsHNhGgzpbS7x3gqMy1zLetPHmOxNxX4pGGC49sG8AO76'),
(41, 'ffO77H5RpZJMLcMJWTaMdfTrQOnEZe1j1muYAIKx6gidHechePHDe9oUSvT809mj'),
(42, '2JuW1l7VFHcRQgUtVChvwbIuvRNxlw99WegS5I6pH2o8coAkaMewwXpk5yD6UATS'),
(43, 'wA9nPYDVA1jZ8A2CBEwtJvo6wriopIMaswACe4AVCHlRYk5YoZwi6vSDtLeGrfff'),
(44, 'uSSETjpGJRqLLbD7RN5oK8C0DftXuIsMv4JgsfW7hMSo2M03OuW1Yznat0VRJ2L1'),
(45, '5i6sBmhxotACLrj0O88dFnNnBtcvugQUqWrwqkX8cf2t43Zqs7N0KNg5IgQ9oPHY'),
(46, 'WPynFadtWaYAaxOIVawsR9dBmCWwam8W0TKFHrgj7d6Q4ZpRLu8wgXcHI0bHZwQp'),
(47, 'l9qxBhxLnUQv8fBNjqDFlKZCIzu4koSLfkNhoG8PLQr34ROUTmMwwOg8vo23oPI6'),
(48, '3QxMs0WEjbM5Tg4wImc8FxCcX3pSFmRHA2ptKLffmR0toUKwMnUt8PIKJuKVQW3f'),
(49, 'Q81y3nswRzYwG6sYI33bG6gf7dvuWFVONiWZf2nRmJIuOD5n50K0DncSz7TalF0b'),
(50, 'Nj2rx1jpvD94Y1PeoZG6wH9aJXTMEdE1RFVbMcp1dZI12zdap08OFL5BfFH6ESfw'),
(51, '0Ut9qJ2FghhbBddaoZhfesXzSusON5cCwN7JBTQjq23TopwDL7nKOym6C9f4Rp0r'),
(52, '5V4ivoiQpt0qH7V8YqbCRr5WjEqJXWxLsH8SGTbgNdiHZI9m55JOeo0RDiMqCjkw'),
(53, 'RkMH4K3SnVXQbaoCWUuLEkdqkQIkE9qtVGvcH96KhbaCOPr7QIlqdAI4GUYikB3y'),
(54, '9ThCQvrQVKG6QWXnd3qfhaRjrCctA3V2HZbWMZxgFL1E9btAbFdFqUSJtlE0WvM8'),
(55, 'I5y6llUUddBYalko5EE7tu2ANH2peFlwUj0RxTukDJwpRu0N62ZieulRcX6Bp7My'),
(56, 'rnMJWE291gT5lfkSXHW9ruF8dz22npeL2UFD1tygie5CVYCQsyre078HfLt4kHvo'),
(57, 'HxVIvH902pw0XWUS8hDJLVA4UfVrmDB5Aa2LrSe22NYOtCSB2aM1WPlZl6iqRmTg'),
(58, 'ZqZPLA7xaSWgjI2NWMDUH1JlEFh9otIkVPn6711PkvVVHoKJwGI0wQ3LYv4pfhoV'),
(59, 'Tsw77WeJH8KTwtZ88ipOxx6BUcJGVPD1Nr4iNxKOHiFUTILshk0QZ9djmRJ3ZtUH'),
(60, '7eehwN1xuPofp2CRjbpwU8Df4rRqK4acmTQYoIseiq2ALhCm4HZLvNPFx4K7eHTb'),
(61, '1UcWBbB9OeqeJuCqYSO1wi8XDvi12JiZV6DuRSB1cyIttT8dPf7FA0pqUxZuC9HS'),
(62, 'Ki7ztVgGaNUcqHGvxPaooXMcuJXj594yWI9zWHTz3X9uqZsKrEGsNBvzjJsI3ule'),
(63, 'nrJjmniLt4beDKwRdaronnQZ5QHTvO4ujPlVkQUBeU4bOe6GH5XY89eOLsxuw915'),
(64, 'f60tr1Chy3Wckmi9WxOU0dmTTp2leVHvfzpreH2P76YccBxGMMNnKhnLmMUdOog1'),
(65, 'qQmKau4l3UOtpgO3aHGZVIxvyA3PFfaT0IjwapxPaKnoa1eMy6tNJgLWThkh1QLw'),
(66, 'bQZ5HntAQQWwi9jV78xDpXSLqlP81XYOz7DzCaOcWUOUNKsDNHzpZpkXpxx1DyvL'),
(67, 'fQUOR8hi9bLvoMUwotxi8mEydfmZX3BURLXY041BxVWPNC8IIovRyP58hXkKqZ6p'),
(68, '37349bfNujSbgvbXPzkUNLjarVBobtaEBlVwP38Zf81LxsBsQletWziNd4KwZcvA'),
(69, 'E8AMWzuDFmxSQnJnesuxWS1gDSTjCn1JZnPxxiU4EYeremKohCVU8L6gTBXevPdL'),
(70, '86UIJDXZ1xwZWxULtq5PAyrcPJ2mSWT72GffgOq2XzxxTr1kTA3EJagcBCKfb1No'),
(71, 'nJJkoueChalhQkgqjnKjHQmBtliDDgiDqNhlO8AOgz38cKSdlYztn5DJV49GuWS6'),
(72, 'zyzmZvnrsShdrZDCqS9CA1PuMSFYMXAgHSbZYrzBsyPQv38rRLS0GIsDOgqCxQCS'),
(73, '3HxlpVY4SWVDzk5SRKEXfdcJqZktcjFNgsnOg7xq4C0cOeImboIoCW06VRjtDZH8'),
(74, 'tfy9pg5ChoNzd9g7cqcFoXxxJURQPPTq3E6roRxko8hezsy9jouW7FfrnhJqdNL0'),
(75, 'UnNd2c33TvDi4HGEviOqiSe1clWz9MP6PrrQ7BEkZfTJRrokrcDPnAhbipMr4L6x'),
(76, '4UMeffsFXzqYLxFphFmKAguHEtqCIBnZ2J3lMaA9x8Tf8kWYcaSE2I5qWBsKADXM'),
(77, 'VaOM70SNrdi1LWRtnRb7E11Irwrg7Dh4f7MYdZOeXjLXp3UMsYM64q2GWp0ldKy9'),
(78, 'xawHSzM731iB39TeydBLrg0BK1Bx5CzEFf11ab0xtgrK4gNfXNDs7CXKvyqYZ50k'),
(79, 'tDlO74JQ6cB5CiaSgDlEbXeao1zGwcgbNIyl9bRokAqM0YIx8lKMoTnOu20bMv1W'),
(80, 'NzNLVtRdYh0Xcg4o6Q5FsHNhGgzpbS7x3gqMy1zLetPHmOxNxX4pGGC49sG8AO76'),
(81, 'ffO77H5RpZJMLcMJWTaMdfTrQOnEZe1j1muYAIKx6gidHechePHDe9oUSvT809mj'),
(82, '2JuW1l7VFHcRQgUtVChvwbIuvRNxlw99WegS5I6pH2o8coAkaMewwXpk5yD6UATS'),
(83, 'wA9nPYDVA1jZ8A2CBEwtJvo6wriopIMaswACe4AVCHlRYk5YoZwi6vSDtLeGrfff'),
(84, 'uSSETjpGJRqLLbD7RN5oK8C0DftXuIsMv4JgsfW7hMSo2M03OuW1Yznat0VRJ2L1'),
(85, '5i6sBmhxotACLrj0O88dFnNnBtcvugQUqWrwqkX8cf2t43Zqs7N0KNg5IgQ9oPHY'),
(86, 'WPynFadtWaYAaxOIVawsR9dBmCWwam8W0TKFHrgj7d6Q4ZpRLu8wgXcHI0bHZwQp'),
(87, 'l9qxBhxLnUQv8fBNjqDFlKZCIzu4koSLfkNhoG8PLQr34ROUTmMwwOg8vo23oPI6'),
(88, '3QxMs0WEjbM5Tg4wImc8FxCcX3pSFmRHA2ptKLffmR0toUKwMnUt8PIKJuKVQW3f'),
(89, 'Q81y3nswRzYwG6sYI33bG6gf7dvuWFVONiWZf2nRmJIuOD5n50K0DncSz7TalF0b'),
(90, 'Nj2rx1jpvD94Y1PeoZG6wH9aJXTMEdE1RFVbMcp1dZI12zdap08OFL5BfFH6ESfw'),
(91, '0Ut9qJ2FghhbBddaoZhfesXzSusON5cCwN7JBTQjq23TopwDL7nKOym6C9f4Rp0r'),
(92, '5V4ivoiQpt0qH7V8YqbCRr5WjEqJXWxLsH8SGTbgNdiHZI9m55JOeo0RDiMqCjkw'),
(93, 'RkMH4K3SnVXQbaoCWUuLEkdqkQIkE9qtVGvcH96KhbaCOPr7QIlqdAI4GUYikB3y'),
(94, '9ThCQvrQVKG6QWXnd3qfhaRjrCctA3V2HZbWMZxgFL1E9btAbFdFqUSJtlE0WvM8'),
(95, 'I5y6llUUddBYalko5EE7tu2ANH2peFlwUj0RxTukDJwpRu0N62ZieulRcX6Bp7My'),
(96, 'rnMJWE291gT5lfkSXHW9ruF8dz22npeL2UFD1tygie5CVYCQsyre078HfLt4kHvo'),
(97, 'HxVIvH902pw0XWUS8hDJLVA4UfVrmDB5Aa2LrSe22NYOtCSB2aM1WPlZl6iqRmTg'),
(98, 'ZqZPLA7xaSWgjI2NWMDUH1JlEFh9otIkVPn6711PkvVVHoKJwGI0wQ3LYv4pfhoV'),
(99, 'Tsw77WeJH8KTwtZ88ipOxx6BUcJGVPD1Nr4iNxKOHiFUTILshk0QZ9djmRJ3ZtUH'),
(100, '7eehwN1xuPofp2CRjbpwU8Df4rRqK4acmTQYoIseiq2ALhCm4HZLvNPFx4K7eHTb'),
(101, '1UcWBbB9OeqeJuCqYSO1wi8XDvi12JiZV6DuRSB1cyIttT8dPf7FA0pqUxZuC9HS'),
(102, 'Ki7ztVgGaNUcqHGvxPaooXMcuJXj594yWI9zWHTz3X9uqZsKrEGsNBvzjJsI3ule'),
(103, 'nrJjmniLt4beDKwRdaronnQZ5QHTvO4ujPlVkQUBeU4bOe6GH5XY89eOLsxuw915'),
(104, 'f60tr1Chy3Wckmi9WxOU0dmTTp2leVHvfzpreH2P76YccBxGMMNnKhnLmMUdOog1'),
(105, 'qQmKau4l3UOtpgO3aHGZVIxvyA3PFfaT0IjwapxPaKnoa1eMy6tNJgLWThkh1QLw'),
(106, 'bQZ5HntAQQWwi9jV78xDpXSLqlP81XYOz7DzCaOcWUOUNKsDNHzpZpkXpxx1DyvL'),
(107, 'fQUOR8hi9bLvoMUwotxi8mEydfmZX3BURLXY041BxVWPNC8IIovRyP58hXkKqZ6p'),
(108, '37349bfNujSbgvbXPzkUNLjarVBobtaEBlVwP38Zf81LxsBsQletWziNd4KwZcvA'),
(109, 'E8AMWzuDFmxSQnJnesuxWS1gDSTjCn1JZnPxxiU4EYeremKohCVU8L6gTBXevPdL'),
(110, '86UIJDXZ1xwZWxULtq5PAyrcPJ2mSWT72GffgOq2XzxxTr1kTA3EJagcBCKfb1No'),
(111, 'nJJkoueChalhQkgqjnKjHQmBtliDDgiDqNhlO8AOgz38cKSdlYztn5DJV49GuWS6'),
(112, 'zyzmZvnrsShdrZDCqS9CA1PuMSFYMXAgHSbZYrzBsyPQv38rRLS0GIsDOgqCxQCS'),
(113, '3HxlpVY4SWVDzk5SRKEXfdcJqZktcjFNgsnOg7xq4C0cOeImboIoCW06VRjtDZH8'),
(114, 'tfy9pg5ChoNzd9g7cqcFoXxxJURQPPTq3E6roRxko8hezsy9jouW7FfrnhJqdNL0'),
(115, 'UnNd2c33TvDi4HGEviOqiSe1clWz9MP6PrrQ7BEkZfTJRrokrcDPnAhbipMr4L6x'),
(116, '4UMeffsFXzqYLxFphFmKAguHEtqCIBnZ2J3lMaA9x8Tf8kWYcaSE2I5qWBsKADXM'),
(117, 'VaOM70SNrdi1LWRtnRb7E11Irwrg7Dh4f7MYdZOeXjLXp3UMsYM64q2GWp0ldKy9'),
(118, 'xawHSzM731iB39TeydBLrg0BK1Bx5CzEFf11ab0xtgrK4gNfXNDs7CXKvyqYZ50k'),
(119, 'NzNLVtRdYh0Xcg4o6Q5FsHNhGgzpbS7x3gqMy1zLetPHmOxNxX4pGGC49sG8AO76')
ON DUPLICATE KEY UPDATE token_invitatie = values(token_invitatie);

Select * from Utilizator;

select * from Roluri;

update Utilizator set id_rol = 4;
-- end insert dummy data in Utilizator

-- insert dummy data in Medic
select * from Medic_temp;

select * from Medic;

insert into Medic (id_medic, salariu, data_angajarii, id_grad, id_specialitate)
select id_medic, salariu, data_angajarii, grad_profesional_id, specialitate_id from Medic_temp;

update Medic set id_utilizator = id_medic;

select Utilizator.prenume, Utilizator.nume, Medic.salariu from Utilizator
join Medic on Medic.id_utilizator = Utilizator.id_utilizator;


-- Tabela Cabinet
-- Tabela GradProfesional
-- Tabela Medic
-- Tabela Permisiuni
-- Tabela Policlinica
-- Tabela Roluri
-- Tabela RoluriPermisiuni
-- Tabela SpecialitateMedicala
-- Tabele Utilizator
-- Tabela Zona


-- Tabela Program
-- Tabela ServiciuMedical (denumire, pret)
-- Tabela Pacient (nume, prenume, email, telefon, data_nasterii, asigurare_id, donator_id)
-- Tabela AsigurareMedicala
-- Tabela AsiguratorMedical ( nume) ??
-- Tabela GrupaDonator (grupa_sanguina) ??
-- Tabela RH (rh) ??
-- Tabela CeluleStem ??
-- Tabela Programare (medic_id, cabinet_id, pacient_id, serviciu_id, datetime) 
