create database if not exists medicalAppDevTEST 
			character set UTF8;
use medicalAppDevV2;

SET foreign_key_checks = 1;
-- Create tables:

-- Tabele platforma online:

-- Table Permisiuni platforma online
drop table if exists Permisiuni;
create table Permisiuni (
	id_permisiune int(3) primary key auto_increment,
	nume varchar(25),
    descriere varchar(50)
);

-- Table Roluri platforma online
drop table if exists Roluri;
create table Roluri (
	id_rol int(3) primary key auto_increment,
	nume varchar(25)
);

-- Tabela asociata roluri_permisiuni
drop table if exists RoluriPermisiuni;
create table RoluriPermisiuni (
	id_permisiune int(3),
    id_rol int(3),
    foreign key (id_permisiune) references Permisiuni(id_permisiune),
    foreign key (id_rol) references Roluri(id_rol)
);

-- Tabela Utilizator platforma online
drop table if exists Utilizator;
create table Utilizator (
	id_utilizator int(3) primary key auto_increment,
    nume varchar(25),
	prenume varchar(50),
    email varchar(100),
    telefon varchar(20),
	nume_utilizator varchar(50),
    parola_criptata varchar(100),
    numar_autentificari int(4),
    ultima_autentificare timestamp,
    ip_ultima_autentificare varchar(64),
    token_invitatie varchar(100),
    invitatie_creata_la timestamp,
    invitatie_trimisa_la timestamp,
    invitatie_acceptata_la timestamp,
    numar_invitatii int(4),
	creat_la timestamp,
    actualizat_la timestamp,
    id_rol int(3),
    foreign key (id_rol) references Roluri(id_rol)
);

-- Tabele Medic:

/*Tabela Specialitate Medicala*/
drop table if exists SpecialitateMedicala;
create table SpecialitateMedicala(
	id_specialitate int(3) primary key auto_increment,
	denumire varchar(50),
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
    salariu int(6),
    data_angajarii date,
    id_grad int(3),
    id_specialitate int(3),
    id_utilizator int(3),
    foreign key (id_utilizator) references Utilizator(id_utilizator),
    foreign key (id_grad) references GradProfesional(id_grad),
    foreign key (id_specialitate) references SpecialitateMedicala(id_specialitate)
);

-- Tabele policlinica:

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

/*Tabela Programul Policlinicilor */
drop table if exists ProgramPoliclinica;
create table ProgramPoliclinica(
	id_program int(3) primary key auto_increment,
    id_policlinica int(3),
    ziua_saptamanii enum('Lu', 'Ma', 'Mi', 'Joi', 'Vn', 'Sa', 'Du'),
    ora_inceput time,
    ora_sfarsit time,
    foreign key (id_policlinica) references Policlinica(id_policlinica)
);

/*Tabela Cabinet*/
Drop table if exists Cabinet;
create table Cabinet(
	id_cabinet int(3) primary key auto_increment,
	denumire varchar(50),
    id_specialitate int(3),
    id_policlinica int(3),
    foreign key (id_specialitate) references SpecialitateMedicala(id_specialitate),
    foreign key (id_policlinica) references Policlinica(id_policlinica)
);

/*Tabela Programul Medicilor in functie de cabinetele lor*/
drop table if exists OrarMedic;
create table OrarMedic(
	id_orar int(3) primary key auto_increment,
    id_medic int(3),
    id_cabinet int(3),
    ziua_saptamanii enum('Luni', 'Marti', 'Miercuri', 'Joi', 'Vineri', 'Sambata', 'Duminica'),
    ora_inceput time,
    ora_sfarsit time,
    foreign key (id_medic) references Medic(id_medic),
    foreign key (id_cabinet) references Cabinet(id_cabinet)
);

-- Tabele pacienti:

/*Tabela Serviciu Medical*/
drop table if exists serviciuMedical;
create table serviciuMedical(
	id_serviciu int(3) primary key auto_increment,
	denumire_serviciu varchar(255),
	cost_serviciu int(3),
    durata_minima time,
    durata_maxima time,
    id_specialitate int(3),
    foreign key (id_specialitate) references SpecialitateMedicala(id_specialitate)
);

-- /*Tabela Asigurator Medical*/
-- drop table if exists asiguratorMedical;
-- create table asiguratorMedical(
--     id_asigurator_medical int(3) primary key auto_increment,
--     denumire varchar(50),
-- );

/*Tabela Asigurare Medicala*/
drop table if exists asigurareMedicala;
create table asigurareMedicala(
	id_asigurare int(3) primary key auto_increment,
    denumire varchar(50),
    descriere varchar(250),
    pret_anual int(4),
    pret_lunar int(3)
    -- data_inceperii datetime,
    -- data_ultimei_plati datetime,
    -- data_urmatoarei_plati datetime
    -- id_asigurator_medical int(3),
    -- foreign key (id_asigurator_medical) references asiguratorMedical(id_asigurator_medical),
);

/*Tabela Discount Servicii Medicale*/
drop table if exists discountServMed;
create table discountServMed(
	id_discount int(3) primary key auto_increment,
    id_asigurare int(3),
    id_serviciu int(3),
    procent_discount int(3),
    foreign key (id_asigurare) references asigurareMedicala(id_asigurare),
    foreign key (id_serviciu) references serviciuMedical(id_serviciu)
);

/*Tabela Servicii Medicale Fara Plata*/
-- drop table if exists faraPlataServMed;
-- create table faraPlataServMed(
-- 	id_fara_plata int(3) primary key auto_increment,
--     id_asigurare int (3),
--     id_serviciu int(3),
--     foreign key (id_asigurare) references asigurareMedicala(id_asigurare),
--     foreign key (id_serviciu) references serviciuMedical(id_serviciu)
-- );

/*Tabela Pacient*/
drop table if exists Pacient;
create table Pacient (
	id_pacient int(3) primary key auto_increment,
    data_nasterii date,
	id_zona int(3),
    id_asigurare int(3),
    id_utilizator int(3),
    foreign key (id_asigurare) references asigurareMedicala(id_asigurare),
    foreign key (id_zona) references Zona(id_zona),
    foreign key (id_utilizator) references Utilizator(id_utilizator)
);

/*Tabela Donator*/
drop table if exists Donator;
create table Donator(
	id_donator int(3) primary key auto_increment,
	grupa_sanguina enum('0_I pozitiv','0_I negativ','A_II pozitiv','A_II negativ','B_III pozitiv','B_III negativ','AB_IV pozitiv','AB_IV negativ'),
    -- rh enum('pozitiv','negativ'),
	-- celule_stem varchar(50),
    data_ultimei_donari date, 
    numar_donari int(2),
    id_pacient int(3),
    foreign key (id_pacient) references Pacient(id_pacient)
);

-- Tabele programare:

/*Tabela Programare*/
drop table if exists Programare;
create table Programare (
	id_programare int(3) primary key auto_increment,
	id_pacient int(3),
	id_medic int(3),
	id_cabinet int(1),
	id_serviciu int(3),
	moment_programare datetime,
    durata time,
    creata_la timestamp,
    status_programare enum('activa', 'anulata', 'reprogramata', 'finalizata'),
	foreign key (id_pacient) references Pacient(id_pacient),
	foreign key (id_medic) references Medic(id_medic),
	foreign key (id_cabinet) references Cabinet(id_cabinet),
	foreign key (id_serviciu) references serviciuMedical(id_serviciu)
);

/*Tabela Notificari*/
drop table if exists Notificari;
create table Notificari (
	id_notificare int(3) primary key auto_increment,
    creata_la timestamp,
    trimisa_la timestamp,
    erorare_trimitere boolean,
    mesaj varchar(255),
    id_programare int(3),
    foreign key (id_programare) references Programare(id_programare)
);

-- Tabela Notificari_Programare
drop table if exists Notificari_Programare;
create table Notificari_Programare (
	id_notificare int(3),
    id_programare int(3),
    foreign key (id_notificare) references Notificari(id_notificare),
    foreign key (id_programare) references Programare(id_programare)
);

show tables;