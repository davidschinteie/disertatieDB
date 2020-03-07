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
    id_utilizator int(3),
    foreign key (id_utilizator) references Utilizator(id_utilizator),
    foreign key (grad_profesional_id) references GradProfesional(id_grad),
    foreign key (specialitate_id) references SpecialitateMedicala(id_specialitate)
);

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


/*Tabela Serviciu Medical*/
drop table if exists serviciuMedical;
create table serviciuMedical(
	id_serviciu int(3) primary key auto_increment,
	denumire_serviciu varchar(255),
	cost_serviciu int(3),
    id_specialitate int(3),
    foreign key (id_specialitate) references SpecialitateMedicala(id_specialitate)
);

/*Tabela Asigurare Medicala*/
drop table if exists asigurareMedicala;
create table asigurareMedicala(
	id_asigurare int(3) primary key auto_increment,
	tipul_asigurarii enum('Asigurare Standard','Asigurare Extra','Multinationala')
);

/*Tabela Grupa Sanguina*/
drop table if exists grupaSanguina;
create table grupaSanguina(
	id_grupa int(1) primary key auto_increment,
	grupa_sanguina enum('0_I pozitiv','0_I negativ','A_II pozitiv','A_II negativ','B_III pozitiv','B_III negativ','AB_IV pozitiv','AB_IV negativ')
);

/*Tabela Pacient*/
drop table if exists Pacient;
create table Pacient (
	id_pacient int(3) primary key auto_increment,
	nume varchar(25),
	prenume varchar(50),
    email varchar(100),
    telefon varchar(20),
    data_nasterii date,
	zona_id int(3),
    id_asigurare int(3),
    id_grupa int(1),
    id_utilizator int(3),
    foreign key (id_asigurare) references asigurareMedicala(id_asigurare),
    foreign key (zona_id) references Zona(id_zona),
    foreign key (id_grupa) references grupaSanguina(id_grupa),
    foreign key (id_utilizator) references Utilizator(id_utilizator)
);

/*Tabela Programare*/
drop table if exists Programare;
create table Programare (
	id_programare int(3) primary key auto_increment,
	id_pacient int(3),
	id_medic int(3),
	id_cabinet int(1),
	id_serviciu int(3),
	moment_programare datetime,
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
    id_medic int(3),
    id_pacient int(3),
    foreign key (id_pacient) references Pacient(id_pacient),
	foreign key (id_medic) references Medic(id_medic),
    foreign key (id_programare) references Programare(id_programare)
);

-- Tabele platforma online:

-- Table Roluri platforma online
drop table if exists Roluri;
create table Roluri (
	id_rol int(3) primary key auto_increment,
	nume varchar(25),
	creat_la timestamp,
    actualizat_la timestamp
);

-- Table Permisiuni platforma online
drop table if exists Permisiuni;
create table Permisiuni (
	id_permisiune int(3) primary key auto_increment,
	nume varchar(25),
	creat_la timestamp,
    actualizat_la timestamp,
    descriere varchar(50),
    id_rol int(3),
    foreign key (id_rol) references Roluri(id_rol)
);

-- Tabela Utilizator platforma online
drop table if exists Utilizator;
create table Utilizator (
	id_utilizator int(3) primary key auto_increment,
	nume_utilizator varchar(25),
    email varchar(100),
    parola_criptata varchar(100),
    numar_autentificari int(4),
    ultima_autentificare timestamp,
    ip_ultima_autentificare timestamp,
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

-- ?? asocierea dintre roluri si permisiuni
drop table if exists Roluri_Permisiuni;
create table Roluri_Permisiuni (
	id_rol int(3),
	id_permisiune int(3)
);

-- ?? asocierea dintre utilizatori si permisiuni
drop table if exists Utilizatori_Permisiuni;
create table Utilizatori_Permisiuni (
	id_utilizator int(3),
	id_permisiune int(3)
);


show tables;