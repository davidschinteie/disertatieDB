drop database if exists pfinal;

create database if not exists pfinal 
			character set UTF8;
use pfinal;

/* CERINTA 1 - crearea procedurii init() */

delimiter $

	create procedure init()
    
    Begin 
		SET foreign_key_checks = 0;
        Drop table if exists Medici;
        create table Medici(
			id int(3) primary key auto_increment,
			nume varchar(25),
            prenume varchar(50),
            statut enum('primar','specialist'),
            specialitate varchar(50),
            unique(nume,prenume)
        );
        drop table if exists Pacienti;
        create table Pacienti (
			id int(11) primary key auto_increment,
			nume varchar(25),
            prenume varchar(50),
            unique(nume,prenume)
        );
        drop table if exists Cabinete;
        create table Cabinete (
			id int(3) primary key auto_increment,
			denumire varchar(25) unique
        );
        drop table if exists vizite;
        create table vizite (
			id int(3) primary key auto_increment,
            id_pacient int(11),
            id_medic int(3),
            id_cabinet int(1),
            moment_vizita datetime,
            foreign key (id_pacient) references Pacienti(id) on delete cascade on update cascade,
            foreign key (id_medic) references Medici(id),
            foreign key (id_cabinet) references Cabinete(id)			
        );
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
        SET foreign_key_checks = 1;
    End $
    
delimiter ;
call init();

/* CERINTA 2 - importarea datelor catre tabela Medici */

load data local infile 'c:/medici.txt' 
			into table Medici 
			character set UTF8
			fields terminated by ','
			lines terminated by '\n'
			ignore 1 lines
			(@Nume, @Prenume, @Tip, @Specializarea)
			set nume=@Nume, prenume=@prenume, statut=@Tip, specialitate=@Specializarea;

/* CERINTA 3 - importarea datelor catre tabela viz_temp */

load data local infile 'c:/vizite.txt' 
			into table viz_temp
			character set UTF8
			fields terminated by ','
			lines terminated by '\n'
			ignore 1 lines;

/* CERINTA 4 - SUBPUNCTUL 1 - lista de nume unice de pacienti introdusa in tabela <<Pacienti>> */

insert into Pacienti(nume, prenume) select distinct Nume_pacient, Prenume_pacient from viz_temp;

/* CERINTA 4 - SUBPUNCTUL 2 - lista de nume unice de pacienti introdusa in tabela <<Cabinet>> */

insert into Cabinete(denumire) select distinct Cabinet from viz_temp;

/* CERINTA 4 - SUBPUNCTUL 3  */

/* CERINTA 4 - SUBPUNCTUL 3 - crearea unei coloane suplimentare <<id_medic>> in tabela <<viz_temp>>
								si popularea acesteia cu datele din tabela <<medici>> */

alter table viz_temp add column id_medic int(3) after Nume_medic;

update viz_temp inner join medici 
				set viz_temp.id_medic=medici.id 
                where viz_temp.Nume_medic=medici.nume
                and viz_temp.Prenume_medic=medici.prenume;
                
/* CERINTA 4 - SUBPUNCTUL 3 - crearea unei coloane suplimentare <<id_pacient>> in tabela <<viz_temp>>
								si popularea acesteia cu datele din tabela <<pacienti>> */
                                
alter table viz_temp add column id_pacient int(11) after Ora_intr;
                
update viz_temp inner join Pacienti
				set viz_temp.id_pacient=pacienti.id 
                where viz_temp.Nume_pacient=pacienti.nume
                and viz_temp.Prenume_pacient=pacienti.prenume;

/* CERINTA 4 - SUBPUNCTUL 3 - crearea unei coloane suplimentare <<id_cabinet>> in tabela <<viz_temp>>
								si popularea acesteia cu datele din tabela <<Cabinete>> */
                
alter table viz_temp add column id_cabinet int(1) after Prenume_medic ;

update viz_temp inner join Cabinete
				set viz_temp.id_cabinet=Cabinete.id 
                where viz_temp.Cabinet=Cabinete.denumire;

/* CERINTA 4 - SUBPUNCTUL 3 - copierea datelor din tabela <<viz_temp>> in tabela <<vizite>>*/
                
insert into vizite(id_pacient, id_medic, id_cabinet) select id_pacient, id_medic, id_cabinet from viz_temp;

update vizite inner join viz_temp /* se populeaza tabela <<vizite>> cu momentul vizitei (de tip datetime) 
										prelucrat din tabela temporara <<viz_temp>>
										cu ajutorul functiilor concat() si substr() */
	set vizite.moment_vizita=concat(substr(viz_temp.Data_viz,7,4),'-',
									substr(viz_temp.Data_viz,4,2),'-',
									substr(viz_temp.Data_viz,1,2),' ',Ora_intr)
	where vizite.id_pacient=viz_temp.id_pacient/* identificarea unica a momentului vizitei din tabela viz_temp */
	and vizite.id_medic=viz_temp.id_medic
	and vizite.id_cabinet=viz_temp.id_cabinet;
                
/* CERINTA 5 - stergerea tabelei <<viz_temp>> */

DROP TABLE viz_temp;

/* Cerinta 6 - completarea tabelei <<vizite>> cu coloana Durata si a tabelei <<Pacienti>> cu coloana DataNasterii  */

/* Aceste operatii vor avea sa fie repetate la fiecare import de date in tabela viz_temp pentru a putea genera rapoartele cerute */

alter table vizite add column Durata time;

alter table Pacienti add column DataNasterii date;

/* Cerinta 6 - Crearea de functie de generare de data de nastere pentru popularea coloanei <<DataNasterii>> din tabela <<Pacienti>>  */

delimiter $

	create function genereazaData ()
		returns date
        not deterministic		/* rezultatul este de tip neterminist intrucat se foloseste functia rand() */
        comment 'Returneaza data de nastere pentru varsta cuprinse intre 20 si 90 de ani' /* valorile intervalului de varsta sunt prestabilite*/
        
        begin
        declare Dob date;
        declare anDob int;
        declare lunaDob int;
        declare ziDob int;
        
			select year(curdate())-round(20+rand()*60) into anDob;/* se alege o varsta aleatoare pe baza careia se calculeaza anul nasterii */
            select round(1+rand()*11) into lunaDob; /* se alege o luna de nastere aleatoare intre 1 si 12 */
            case /* pentru aflarea zilei de nastere se foloseste o structura decizionala case 
					pentru selectarea corecta a intervalului pentru ziua de nastere */
				when lunaDob=2 and anDob%4=0/* daca anul este bisect si luna este februarie atunci 
												intervalul pentru ziua de nastere este intre 1 si 29 */
					then select floor(1+rand()*29) into ziDob;
				when lunaDob=2 and anDob%4!=0/* daca anul NU este bisect si luna este februarie atunci 
												intervalul pentru ziua de nastere este intre 1 si 28 */
					then select floor(1+rand()*28) into ziDob;
				when lunaDob=1 or lunaDob=3 or lunaDob=5 or lunaDob=7 or lunaDob=8 or lunaDob=10 or lunaDob=12
					then select floor(1+rand()*31) into ziDob;/* daca luna este Ianuarie, Martie, Mai, Iulie, August, Octombrie sau Decembrie
																atunci intervalul pentru ziua de nastere este intre 1 si 31 */
				when lunaDob=4 or lunaDob=6 or lunaDob=9 or lunaDob=11/* daca luna este Aprilie, Iunie, Septembrie sau Noiembrie
																atunci intervalul pentru ziua de nastere este intre 1 si 30 */
					then select floor(1+rand()*30) into ziDob;
            end case;
            select concat(anDob,'-',lunaDob,'-',ziDob) into Dob;
        return Dob; /* se returneaza data de nastere intr-o variabila de tip date generata prin concatenarea datelor obtinute anterior*/
        
        end $
	
delimiter ;

/* se populeaza tabela <<Pacienti>> folosind functia scrisa anterior */

update Pacienti set DataNasterii=genereazaData();

/* se populeaza coloana Durata din tabela <<Vizite>> cu numarul de minute ales aleator 
intre 5 si 19 min iar numarul de secunde ales aleator intre 1 si 59 de secunde*/

update vizite set Durata=concat('00:',round(5+rand()*14),':',floor(1+rand()*58)); 

/* CERINTA 7 - Crearea procedurii pentru obtinerea rapoartelor cerute */

delimiter $ 
	
		create procedure rapoarte()
        Begin
        
	
		/* CERINTA 7 - Subpunctul 1.1 - selectarea celor mai varstnici 20 de pacienti */

		select concat(nume,' ',prenume) as Pacient, year(curdate())-year(DataNasterii) as Varsta from Pacienti order by Varsta desc Limit 20 ;

		/* CERINTA 7 - Subpunctul 1.2 - selectarea numarului pacientilor in segmentul de varsta 60-70 de ani */

		select count(*) as 'numarul de pacienti' from Pacienti
							where year(curdate())-year(DataNasterii)<=70 and year(curdate())-year(DataNasterii)>=60 ;

		/* CERINTA 7 - Subpunctul 1.3 - listei specialitatilor medicale impreuna cu numarul de medici pe fiecare specializare */

		select distinct specialitate, count(*) as 'numarul de medici' from medici group by specialitate;

		/* CERINTA 7 - Subpunctul 2.1 - Specializarea la care s-au prezentat cei mai multi bolnavi */

		select specialitate, count(*) from medici join vizite on(medici.id=vizite.id_medic) group by specialitate limit 1;

		/* CERINTA 7 - Subpunctul 2.2 - Pacientul "fidel" */

		select concat(nume,' ',prenume) as Pacient, count(*) as consultatii 
										from Pacienti 
										join vizite on(pacienti.id=vizite.id_pacient) 
										group by Pacient
										order by consultatii desc
                                        limit 1;
										
		/* CERINTA 7 - Subpunctul 2.3 - medicii cu numar de consultatii < 450 in anul 2009 */

		select concat(nume,' ',prenume) as Medic, count(*) as consultatii
												from medici 
												join vizite on(medici.id=vizite.id_medic)
												where year(vizite.moment_vizita)=2009 
												group by medic having consultatii<250;

		/* CERINTA 7 - Subpunctul 2.4 - medicii care NU figureaza cu nicio vizita */

		select concat(nume,' ',prenume) as Medic, vizite.id
												from vizite 
												right join medici on(medici.id=vizite.id_medic)
												group by medic having vizite.id<=>null;
												
		/* CERINTA 7 - Subpunctul 2.5 - pacientii cu cel putin 20 de vizite in week-end */

		select concat(nume,' ',prenume) as Pacient, count(*) as vizite 
										from Pacienti 
										join vizite on(pacienti.id=vizite.id_pacient)
										where weekday(vizite.moment_vizita)=5 or weekday(vizite.moment_vizita)=6
										group by Pacient having vizite>20;
				   
		/* CERINTA 7 - Subpunctul 2.6 - istoricul cronologic al pacientului "Cruceru Nicu-Daniel" */

		select moment_vizita as istoric from vizite where id_pacient=
								(select id from pacienti where nume='Cruceru' and prenume='Nicu-Daniel') 
								order by moment_vizita desc;

		/* CERINTA 7 - Subpunctul 3.1 - varsta medie a pacientilor pentru toate specializarile cu exceptia pediatriei */

		select avg(year(curdate())-year(Pacienti.DataNasterii)) as VarstaMedie, medici.specialitate from Pacienti 
														join vizite on (pacienti.id=vizite.id_pacient)
														join medici on (medici.id=vizite.id_medic)
														where medici.specialitate!='pediatrie'
														group by medici.specialitate;

		/* CERINTA 7 - Subpunctul 3.2 - istoricul vizitelor lui "Topor Anghel-Cristian"  */

		select moment_vizita as istoric, concat(Pacienti.Nume,' ',Pacienti.Prenume) as Pacient, 
										concat(medici.Nume,' ',medici.Prenume) as Medic,
										cabinete.denumire as Cabinet,
										medici.specialitate,
										vizite.durata
								from Pacienti
								join vizite on (pacienti.id=vizite.id_pacient)
								join cabinete on (cabinete.id=vizite.id_cabinet)
								join medici on (medici.id=vizite.id_medic)
								where id_pacient=
								(select id from pacienti where nume='Topor' and prenume='Anghel-Cristian') 
								order by moment_vizita desc;
						END $		
delimiter ;

/* Apelarea procedurii rapoarte() care genereaza rapoartele cerute */

call rapoarte();

/* CERINTA 8 - Apelarea procedurii init() pentru reinitializarea tabelelor */

call init();

/* CERINTA 8 - Crearea functiei de corectare a informatiei cu privire la data din tabelul de vizite */

delimiter $
	
	create function Moment_vizita(Data_Viz varchar(25), ora varchar(25))
		Returns datetime
        DETERMINISTIC
        COMMENT "Returneaza data alaturi de ora corecta in format datetime"
        
	BEGIN
		
        DECLARE Moment_vizita datetime;
        
        /* Concatenarea sirului de caractere ce contine data cu sirul de caractere ce contine timpul */
        set Moment_vizita=concat(substr(Data_viz,7,4),'-',substr(Data_viz,4,2),'-',substr(Data_viz,1,2),' ', 
									substr(ora,1,2),':',substr(ora,4,2),':',substr(ora,7,2));
        
		RETURN Moment_vizita;
    
    END $
        
delimiter ;

/* CERINTA 8 - Crearea triggerului viz_temp inainte de importul datelor din tabela oferita */

delimiter $
	
    create trigger viz_temp_BI before insert
		on viz_temp FOR EACH ROW 
	
    BEGIN
		declare id_pac int(11);
		declare id_med int(3);
		declare id_cab int(1);
        declare nume_cmplt varchar(85);
        declare mom_viz datetime;
        declare dublare int(1) default 0;
		DECLARE duplicate_key CONDITION FOR 1062;
        
	DECLARE CONTINUE handler for duplicate_key
   
    hand: begin
    set dublare=1;
		
        if New.Cabinet in (select denumire from Cabinete)
			
            then select id from cabinete where denumire=New.Cabinet into id_cab;
            
            else
            
				insert into Cabinete(denumire) values (New.Cabinet);
                select last_insert_id() into id_cab;
		
        end if;
            
		if nume_cmplt in (select concat(nume,' ',prenume) from pacienti) 
					
                    then select id from pacienti where nume=New.Nume_pacient and prenume=New.Prenume_pacient into id_pac;
                   
                   else 
							insert into pacienti(nume,prenume) values (New.Nume_pacient,New.Prenume_pacient);
							select last_insert_id() into id_pac;
		end if;
	
    /*select id from pacienti where concat(nume,' ',prenume)=concat(New.Nume_pacient,' ',New.Prenume_pacient) into id_pac;
    insert into vizite(id_pacient,id_medic,moment_vizita) values(id_pac,id_med,mom_viz);*/
    end hand;
		
        select concat(New.Nume_pacient,' ',New.Prenume_pacient) into nume_cmplt;
        select Moment_vizita(New.Data_viz,New.Ora_intr) into mom_viz;
        select id from medici where concat(nume,' ',prenume)=concat(New.Nume_medic,' ',New.Prenume_medic) into id_med;
        
        insert into cabinete (denumire) values (New.Cabinet);
        
        if dublare!=1
			then  select last_insert_id() into id_cab;
		end if;
        
        insert into pacienti(nume,prenume) values (New.Nume_pacient,New.Prenume_pacient);
        
        if dublare!=1
			then select last_insert_id() into id_pac;
        end if;
       
		insert into vizite(id_pacient,id_medic,id_cabinet,moment_vizita) values(id_pac,id_med,id_cab,mom_viz);
    
    END $
        

delimiter ;

/* Importarea datelor catre tabela medici si tabela viz_temp
in aceasta ordine pentru ca la importul in tabela viz_temp
tabela medici sa fie deja populata cu date */

load data local infile 'C:/medici.txt' 
			into table Medici 
			character set UTF8
			fields terminated by ','
			lines terminated by '\n'
			ignore 1 lines
			(@Nume, @Prenume, @Tip, @Specializarea)
			set nume=@Nume, prenume=@prenume, statut=@Tip, specialitate=@Specializarea;

load data local infile 'C:/vizite.txt' 
			into table viz_temp
			character set UTF8
			fields terminated by ','
			lines terminated by '\n'
			ignore 1 lines;
            
/* Modificarea tabelelor vizite si pacienti cu coloanele Durata si DataNasterii 
(alaturi de popularea acestor coloane) 
pentru a putea obtine rapoartele cerute [apeland procedura rapoarte()]*/
alter table vizite add column Durata time;

alter table Pacienti add column DataNasterii date;

update Pacienti set DataNasterii=genereazaData();

update vizite set Durata=concat('00:',round(5+rand()*14),':',floor(1+rand()*58)); 

call rapoarte();

/*CERINTA 9 -  */

call init();

/* Importarea datelor catre tabela medici si tabela viz_temp
ordinea nefiind importanta ordinea de import a datelor din aceste tabele */

load data local infile 'C:/medici.txt' 
			into table Medici 
			character set UTF8
			fields terminated by ','
			lines terminated by '\n'
			ignore 1 lines
			(@Nume, @Prenume, @Tip, @Specializarea)
			set nume=@Nume, prenume=@prenume, statut=@Tip, specialitate=@Specializarea;

load data local infile 'C:/vizite.txt' 
			into table viz_temp
			character set UTF8
			fields terminated by ','
			lines terminated by '\n'
			ignore 1 lines;
            
delimiter $
		create procedure import_date()

		BEGIN
			declare id_pac int(11);
            declare data_v varchar(25);
            declare ora_in varchar(25);
            declare nume_pac varchar(25);
            declare prenume_pac varchar(50);
            declare nume_cmplt varchar(75);
			declare id_med int(3);
			declare nume_med varchar(25);
            declare prenume_med varchar(50);
            declare nume_med_cmplt varchar(75);
			declare id_cab int(2);
            declare nume_cab varchar(10);
            declare pacienti Cursor for 
				select Data_viz, Ora_intr, Nume_pacient, Prenume_pacient,concat(Nume_pacient,' ',Prenume_pacient) as nume_complet,
                Nume_medic,Prenume_medic,concat(Nume_medic,' ',Prenume_medic) as Nume_medic_complet, Cabinet from Viz_temp;
                DECLARE EXIT HANDLER FOR 1329 BEGIN END; 
			
			
            OPEN pacienti;
            bucla:LOOP
            
            FETCH pacienti INTO data_v, ora_in,nume_pac,prenume_pac,nume_cmplt,nume_med,prenume_med,nume_med_cmplt,nume_cab;
            
				if nume_cmplt in (select concat(nume,' ',prenume) from pacienti) 
					then select id from pacienti where nume=nume_pac and prenume=prenume_pac into id_pac;
					select id from medici where nume_med_cmplt=concat(nume,' ',prenume) into id_med;
					
					if nume_cab in (select denumire from Cabinete)
						then	select id from cabinete where denumire = nume_cab into id_cab;
						else insert into Cabinete(denumire) values (nume_cab);
						select last_insert_id() into id_cab;
					end if;
						
					insert into vizite(id_pacient,id_medic,id_cabinet,moment_vizita) values (id_pac,id_med,id_cab,Moment_vizita(data_v,ora_in));
					
					Iterate bucla;
					
                end if;
                
			if nume_cab in (select denumire from Cabinete)
						then	select id from cabinete where denumire = nume_cab into id_cab;
						else insert into Cabinete(denumire) values (nume_cab);
						select last_insert_id() into id_cab;
					end if;
                    
			INSERT INTO Pacienti(nume,prenume) VALUES(nume_pac,prenume_pac);
            select id from medici where nume_med_cmplt=concat(nume,' ',prenume) into id_med;
            insert into vizite(id_pacient,id_medic,id_cabinet,moment_vizita) values (Last_insert_id(),id_med,id_cab,Moment_vizita(data_v,ora_in));
            
			end loop;
            
            close pacienti;

		END$

delimiter ;

call import_date();

/* Modificarea tabelelor vizite si pacienti cu coloanele Durata si DataNasterii 
(alaturi de popularea acestor coloane) 
pentru a putea obtine rapoartele cerute [apeland procedura rapoarte()]*/
alter table vizite add column Durata time;

alter table Pacienti add column DataNasterii date;

update Pacienti set DataNasterii=genereazaData();

update vizite set Durata=concat('00:',round(5+rand()*14),':',floor(1+rand()*58)); 


call rapoarte();