/*DROP DATABASE IF EXISTS and CREATE DATABASE*/

/*drop database if exists sda_scd;

create database if not exists sda_scd 
			character set UTF8;*/
            
drop database if exists sda_scd_v3;

create database if not exists sda_scd_v3 
			character set UTF8;
use sda_scd_v3;

/*Procedura init de creare a tabelelor*/
DROP PROCEDURE IF EXISTS init;

delimiter $

	create procedure init()
    
    Begin 
		SET foreign_key_checks = 0;
        
        /*Tabela Medic*/
		Drop table if exists Medic;
		create table Medic(
			id_medic int(3) primary key auto_increment,
			nume varchar(25),
			prenume varchar(50)
		);
        
         /*Tabela Specializare Medic*/
		drop table if exists SpecializareMedic;
		create table SpecializareMedic(
			id_specializare int(3) primary key auto_increment,
            specializare varchar(50)
		);
		
        /*Tabela Medic Specialist*/
		drop table if exists MedicSpecialist;
		create table MedicSpecialist(
			id_medic int(3),
			id_specializare int(3),
            foreign key (id_medic) references Medic(id_medic),
            foreign key (id_specializare) references SpecializareMedic(id_specializare)
		);
        
		/*Tabela Medic Primar*/
		drop table if exists MedicPrimar;
		create table MedicPrimar(
			id_medic int(3),
            tipul_consultatiei varchar(50),
			foreign key (id_medic) references Medic(id_medic)
		);
        
        /*Tabela Tip Cabinet*/
		drop table if exists tipCabinet;
		create table tipCabinet (
			id_tip_cabinet int(3) primary key auto_increment,
			tipulCabinetului varchar(50)
		);
        
        /*Tabela Cabinet*/
		drop table if exists Cabinet;
		create table Cabinet (
			id_cabinet int(3) primary key auto_increment,
            id_tip_cabinet int(3),
			denumire varchar(25),
            foreign key (id_tip_cabinet) references tipCabinet(id_tip_cabinet)
		);
		
        /*Tabela Atasat La*/
        drop table if exists Atasat_La;
        create table Atasat_La (
			id_medic int(3),
            id_cabinet int(3),
            foreign key (id_medic) references Medic(id_medic),
            foreign key (id_cabinet) references Cabinet(id_cabinet)
        );
		
        /*Tabela Asigurare Medicala*/
		drop table if exists asigurareMedicala;
		create table asigurareMedicala(
			id_asigurare int(3) primary key auto_increment,
			tipul_asigurarii enum('Asigurare Standard','Asigurare Extra','Multinationala')
		);
        
        /*Tabela Asigurator Medical*/
		drop table if exists asiguratorMedical;
		create table asiguratorMedical(
			id_asigurator int(3) primary key auto_increment,
			denumirea varchar(50)
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
			prenume varchar(50)
		);
        
        /*Tabela Asiguratilor Medicali*/
        drop table if exists asiguratMedical;
		create table asiguratMedical(
			id_pacient int(3),
            id_asigurare int(3),
			id_asigurator int(3),
            foreign key (id_pacient) references Pacient(id_pacient),
            foreign key (id_asigurare) references asigurareMedicala(id_asigurare),
            foreign key (id_asigurator) references asiguratorMedical(id_asigurator)
		);
        
        /*Tablela Donator*/
        drop table if exists donator;
        create table donator(
			id_pacient int(3),
            id_grupa int(1),
            foreign key (id_pacient) references Pacient(id_pacient),
            foreign key (id_grupa) references grupaSanguina(id_grupa)
        );
        
        /*Tabela Serviciu Medical*/
        drop table if exists serviciuMedical;
        create table serviciuMedical(
			id_serviciu int(3) primary key auto_increment,
            denumire_serviciu varchar(255),
            cost_serviciu int(3)
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

        SET foreign_key_checks = 1;
	End $
    
delimiter ;
call init();

show tables;
