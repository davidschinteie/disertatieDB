use sda_scd_v3;
show tables;

/*Inserare Date*/
/*CREAREA TABELEI TEMPORARE MEDIC_TEMP*/
Drop table if exists Medic_temp;
create table Medic_temp(
	id int(3) primary key auto_increment,
	nume varchar(25),
	prenume varchar(50),
    statut enum('primar','specialist'),
	specialitate varchar(50),
	unique(nume,prenume)
);
    
load data local infile 'C:/Users/alexandru david/Desktop/folder-David/IFR (baze de date si tehnologii WEB)/2017-2018/sda-proiect/sql_pfinal_date/medici.txt' 
	into table Medic_temp 
	character set UTF8
	fields terminated by ','
	lines terminated by '\n'
	ignore 1 lines
	(@Nume, @Prenume, @Tip, @Specializarea)
	set nume=@Nume, prenume=@prenume, statut=@Tip, specialitate=@Specializarea;
    
    
/*load data local infile '/Users/davidschinteie/Desktop/work/WebResources/sda-proiect/sql_pfinal_date/Medici.txt'
			into table Medic_temp 
			character set UTF8
			fields terminated by ','
			lines terminated by '\n'
			ignore 1 lines
			(@Nume, @Prenume, @Tip, @Specializarea)
			set nume=@Nume, prenume=@prenume, statut=@Tip, specialitate=@Specializarea;*/
        
select * from Medic_temp;
        
/*INSERARE DATE IN TABELA MEDIC*/    
insert into Medic select id, nume, prenume from Medic_temp;
select * from Medic;
        
/*INSERARE DATE IN TABELA SPECIALIZARE MEDIC*/
insert into specializareMedic(specializare) select distinct(specialitate) from Medic_temp; 
select * from specializareMedic;       
        
/*INSERARE DATE IN TABELA MEDIC SPECIALIST*/
SET foreign_key_checks = 0;       
insert into MedicSpecialist  select medic_temp.id, specializareMedic.id_specializare from specializareMedic inner join Medic_temp 
	where Medic_temp.specialitate = specializareMedic.specializare
    and Medic_temp.statut = 'specialist'; 
SET foreign_key_checks = 1;
select * from MedicSpecialist;

/*INSERARE DATE IN TABELA MEDIC PRIMAR*/
insert into medicprimar select id, ELT(0.5 + RAND() * 4, 'Medicina de Familie', 'Medicina Muncii', 'Medicina de urgenta', 'Geriatrie si gerontologie') 
						from medic_temp
						where medic_temp.statut = 'primar';
select * from medicprimar;


/*CREAREA TABELEI TEMPORARE VIZ_TEMP*/
drop table if exists viz_temp;
    
create table viz_temp (
	Data_viz varchar(25),
	Ora_intr time,
	Nume_pacient varchar(25),
	Prenume_pacient varchar(50),
	Nume_medic varchar(25),
	Prenume_medic varchar(50),
	Cabinet varchar(25)
);
   
l/*oad data local infile 'C:/Users/alexandru david/Desktop/folder-David/IFR (baze de date si tehnologii WEB)/2017-2018/sda-proiect/sql_pfinal_date/vizite-short.txt' 
	into table viz_temp
	character set UTF8
	fields terminated by ','
	lines terminated by '\n'
	ignore 1 lines;*/
    
load data local infile '/Users/davidschinteie/Desktop/work/WebResources/sda-proiect/sql_pfinal_date/vizite-short.txt' 
	into table viz_temp
	character set UTF8
	fields terminated by ','
	lines terminated by '\n'
	ignore 1 lines;
    
select * from viz_temp;

/*INSERARE DATE IN TABELA PACIENT*/
insert into Pacient(nume, prenume) select distinct Nume_pacient, Prenume_pacient from viz_temp;
select * from Pacient;

/*INSERARE DATE IN TABELA TIP_CABINET*/
insert into tipcabinet(tipulCabinetului) select specializare from specializareMedic;
insert into tipcabinet(tipulCabinetului) values ('Consultatie');
select * from tipCabinet;

/*INSERARE DATE IN TABELA CABINET*/
insert into Cabinet(id_tip_cabinet, denumire) 
	values (5, 'Cabinet 1'),
	(6, 'Cabinet 2'),
	(7, 'Cabinet 3'),
	(8, 'Cabinet 4'),
	(9, 'Cabinet 5'),
	(10, 'Cabinet 6'),
	(17, 'Cabinet 7'),
	(16, 'Cabinet 8'),
	(15, 'Cabinet 9'),
	(14, 'Cabinet 10'),
	(13, 'Cabinet 11'),
	(12, 'Cabinet 12'),
	(11, 'Cabinet 13'),
	(1, 'Cabinet 14'),
	(2, 'Cabinet 15'),
	(3, 'Cabinet 16'),
	(4, 'Cabinet 17'),
	(32, 'Cabinet 18'),
	(32, 'Cabinet 19'),
	(32, 'Cabinet 20');
select * from Cabinet; 

/*INSERARE DATE IN TABELA ATASAT_LA*/
select * from atasat_la order by id_medic;
insert into atasat_la select medic_temp.id, cabinet.id_cabinet from cabinet inner join tipcabinet on cabinet.id_tip_cabinet = tipcabinet.id_tip_cabinet
					inner join medic_temp 
		where (medic_temp.statut = 'specialist' and medic_temp.specialitate = tipcabinet.tipulCabinetului)
        or (medic_temp.statut = 'primar' and tipcabinet.tipulCabinetului = 'Consultatie');

/*INSERARE DATE IN TABELA ASIGURARE MEDICALA*/
insert into asigurareMedicala(tipul_asigurarii) values ('Asigurare Standard'),('Asigurare Extra'),('Multinationala');
select * from asigurareMedicala;

/*INSERARE DATE IN TABELA ASIGURATOR MEDICAL*/
insert into asiguratorMedical(denumirea) values ('NN'),('UNIQA'),('ALLIANZ-TIRIAC'),('GROUPAMA'),('MediHELP');
select * from asiguratorMedical;

/*INSERARE DATE IN TABELA GRUPA SANGUINA*/
insert into grupaSanguina(grupa_sanguina) values ('0_I pozitiv'),('0_I negativ'),('A_II pozitiv'),('A_II negativ'),('B_III pozitiv'),('B_III negativ'),('AB_IV pozitiv'),('AB_IV negativ');
select * from grupaSanguina;

/*INSERARE DATE IN TABELA ASIGURAT MEDICAL*/
insert into asiguratMedical select id_pacient, floor(rand()*4 + 1),floor(rand()*5 + 1) from pacient;
select * from asiguratMedical;

/*INSERARE DATE IN TABELA ASIGURAT MEDICAL*/
insert into donator select id_pacient, floor(rand()*8 + 1) from Pacient order by rand() limit 250;
select * from donator;

/*INSERARE DATE IN TABELA PROGRAMARE*/
select * from viz_temp;
select * from Cabinet;
SET SQL_SAFE_UPDATES = 0;

alter table viz_temp add column id_cabinet int(1) after Prenume_medic ;
update viz_temp inner join Cabinet
				set viz_temp.id_cabinet=Cabinet.id_cabinet 
                where viz_temp.Cabinet=Cabinet.denumire;

alter table viz_temp add column id_pacient int(11) after Ora_intr;
update viz_temp inner join Pacient
				set viz_temp.id_pacient=Pacient.id_pacient 
                where viz_temp.Nume_pacient=Pacient.nume
                and viz_temp.Prenume_pacient=Pacient.prenume;
                
alter table viz_temp add column id_medic int(3) after Prenume_pacient;
update viz_temp inner join Medic 
				set viz_temp.id_medic=Medic.id_medic 
                where viz_temp.Nume_medic=Medic.nume
                and viz_temp.Prenume_medic=Medic.prenume;
                
select * from programare;
select * from viz_temp;

select * from MEDIC;
select * from MEDICSPECIALIST;
select * from MEDICPRIMAR;
select * from SPECIALIZAREMEDIC;

select * from CABINET;
select * from TIPCABINET;
select * from ATASAT_LA;

select * from PACIENT;
select * from ASIGURATMEDICAL;
select * from ASIGURATORMEDICAL;
select * from ASIGURAREMEDICALA;
select * from DONATOR;
select * from GRUPASANGUINA;



SET foreign_key_checks = 0;
truncate Medic;  
truncate specializareMedic;
truncate MedicSpecialist;
truncate medicprimar;
truncate Pacient;
truncate Cabinet;
truncate tipCabinet;
truncate atasat_la;
truncate asigurareMedicala;
truncate asiguratorMedical;
truncate grupaSanguina;
truncate asiguratMedical;
truncate donator;
truncate Programare;
SET foreign_key_checks = 1;


insert into RoluriPermisiuni values 	('administrator','adaugare_pacient'),
																			('administrator','adaugare_medic'),
																			('administrator','adaugare_programare'),
																			('administrator','adaugare_utilizator'),
																			('administrator','stergere_pacient'),
																			('administrator','stergere_medic'),
																			('administrator','stergere_programare'),
																			('administrator','stergere_utilizator'),
																			('administrator','editare_pacient'),
																			('administrator','editare_medic'),
																			('administrator','editare_programare'),
																			('administrator','editare_utilizator'),
																			('administrator','vizualizare_pacient'),
																			('administrator','vizualizare_programare'),
																			('administrator','vizualizare_utilizator'),
																			('administrator','vizualizare_permisiuni'),
																			('administrator','vizualizare_roluri'),

																			('vizitator','adaugare_programare'),
																			('vizitator','adaugare_utilizator'),
																			('vizitator','stergere_programare'),
																			('vizitator','stergere_utilizator'),
																			('vizitator','editare_programare'),
																			('vizitator','editare_utilizator'),
																			('vizitator','vizualizare_programare'),
																			('vizitator','vizualizare_utilizator'),

																			('pacient','adaugare_programare'),
																			('pacient','adaugare_pacient'),
																			('pacient','adaugare_utilizator'),
																			('pacient','stergere_programare'),
																			('pacient','stergere_utilizator'),
																			('pacient','stergere_pacient'),
																			('pacient','editare_programare'),
																			('pacient','editare_utilizator'),
																			('pacient','editare_pacient'),
																			('pacient','vizualizare_programare'),
																			('pacient','vizualizare_utilizator'),

																			('medic','adaugare_programare'),
																			('medic','adaugare_medic'),
																			('medic','adaugare_utilizator'),
																			('medic','stergere_programare'),
																			('medic','stergere_utilizator'),
																			('medic','stergere_medic'),
																			('medic','editare_programare'),
																			('medic','editare_utilizator'),
																			('medic','editare_medic'),
																			('medic','editare_pacient'),
																			('medic','vizualizare_pacient'),
																			('medic','vizualizare_programare'),
																			('medic','vizualizare_utilizator');


insert into Roluri(nume) values ('administrator'), ('vizitator'), ('pacient'), ('medic');

insert into Permisiuni(nume, descriere) values 	('vizualizare_pacient','Abilitatea de a vizualiza pacienti'), 
												('vizualizare_programare','Abilitatea de a vizualiza programari'), 
                                                ('vizualizare_utilizator','Abilitatea de a vizualiza utilizatori'),
                                                ('vizualizare_permisiuni','Abilitatea de a vizualiza permisiuni'),
                                                ('vizualizare_roluri','Abilitatea de a vizualiza roluri'),
                                                ('adaugare_pacient','Abilitatea de a adauga pacient'),
                                                ('adaugare_programare','Abilitatea de a adauga programare'),
                                                ('adaugare_medic','Abilitatea de a adauga medic'),
                                                ('adaugare_utilizator','Abilitatea de a adauga utilizator'),
                                                ('stergere_pacient','Abilitatea de a sterge pacient'),
                                                ('stergere_medic','Abilitatea de a sterge medic'),
                                                ('stergere_programare','Abilitatea de a sterge programare'),
                                                ('stergere_utilizator','Abilitatea de a sterge utilizator'),
                                                ('editare_pacient','Abilitatea de a edita pacient'),
                                                ('editare_medic','Abilitatea de a edita medic'),
                                                ('editare_programare','Abilitatea de a edita programare'),
                                                ('editare_utilizator','Abilitatea de a edita utilizator');

insert into RoluriPermisiuni(id_rol, id_permisiune) values 	(1,6),
																			(1,8),
																			(1,7),
																			(1,9),
																			(1,10),
																			(1,11),
																			(1,12),
																			(1,13),
																			(1,14),
																			(1,15),
																			(1,16),
																			(1,17),
																			(1,1),
																			(1,2),
																			(1,3),
																			(1,4),
																			(1,5),

																			(2,7),
																			(2,9),
																			(2,12),
																			(2,13),
																			(2,16),
																			(2,17),
																			(2,2),
																			(2,3),

																			(3,7),
																			(3,6),
																			(3,9),
																			(3,12),
																			(3,13),
																			(3,10),
																			(3,16),
																			(3,17),
																			(3,14),
																			(3,2),
																			(3,3),

																			(4,7),
																			(4,8),
																			(4,9),
																			(4,12),
																			(4,13),
																			(4,11),
																			(4,16),
																			(4,17),
																			(4,15),
																			(4,14),
																			(4,1),
																			(4,2),
																			(4,3);

select Roluri.nume, Permisiuni.nume from RoluriPermisiuni 
join Roluri on RoluriPermisiuni.id_rol = Roluri.id_rol and Roluri.nume = 'medic'
join Permisiuni on Permisiuni.id_permisiune = RoluriPermisiuni.id_permisiune;