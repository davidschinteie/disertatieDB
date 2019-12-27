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