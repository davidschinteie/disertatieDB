use sda_scd_v3;

insert into serviciuMedical(denumire_serviciu, cost_serviciu) select specializare, floor(rand()*10)*10 + 150 from SpecializareMedic;
insert into serviciuMedical(denumire_serviciu) select distinct tipul_consultatiei from MedicPrimar;
update serviciuMedical set cost_serviciu = floor(rand()*10)*10 + 150 where cost_serviciu is null;
select * from serviciuMedical;

select * from medic_temp;
select * from viz_temp;

select * from programare order by id_medic;

insert into programare(id_pacient, id_medic, moment_programare) select id_pacient, id_medic, concat(substr(viz_temp.Data_viz,7,4),'-',
									substr(viz_temp.Data_viz,4,2),'-',
									substr(viz_temp.Data_viz,1,2),' ',Ora_intr) from viz_temp;
                                    
update programare inner join atasat_la 
	set programare.id_cabinet=atasat_la.id_cabinet
	where programare.id_medic=atasat_la.id_medic;
    
select * from tipcabinet;

select tipulCabinetului from tipCabinet inner join tipCabinet on ;

update programare inner join serviciuMedical inner join tipCabinet inner join Cabinet
	set programare.id_serviciu = serviciuMedical.id_serviciu
    where serviciuMedical.denumire_serviciu = tipCabinet.tipulCabinetului 
    and cabinet.id_cabinet = programare.id_cabinet;

/*insert into serviciuMedical(denumire_serviciu, cost_serviciu) select concat('consultatie ', specializare), floor(rand()*10)*10 + 150 from SpecializareMedic;
insert into serviciuMedical(denumire_serviciu) select distinct concat('consultatie ', tipul_consultatiei) from MedicPrimar;
update serviciuMedical set cost_serviciu = floor(rand()*10)*10 + 150 where cost_serviciu is null;
select * from serviciuMedical;
truncate serviciuMedical;*/


    
    