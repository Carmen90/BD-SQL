drop table ComisionCC;
drop table deposito;
drop table log;
create table ComisionCC(cc char(20), importe number(10,2));
create table deposito(cc char(20));
create table log( msg varchar(50));
insert into Comisioncc values ('12345678900987654321',13.9);
insert into Comisioncc values('12345123131333344321',13.0);
insert into Comisioncc values ('37423462487654321478',13.9);
insert into deposito values ('37423462487654321478');
delete from ComisionCC;
/


create or replace 
trigger tigre
before delete on ComisionCC
for each row
--Declaraciones
declare
ccc ComisionCC.cc%TYPE;
importee ComisionCC.importe%TYPE;
begin
  select cc into ccc
  from deposito
  where :old.cc = cc;
      dbms_output.put_line(:old.cc || :old.importe);
  Exception
  when no_data_found then
      dbms_output.put_line(:old.cc || :old.importe || 'Cliente preferente');
end; --begin
/
/*

create or replace trigger COMISIONCC_T1
BEFORE
delete on COMISIONCC
for each row
DECLARE
N INTEGER;
begin
select count(*) into N from deposito where deposito.cc = :old.cc;
insert into log values(decode(n,0,'Cliente Preferente: ',1,'Deposito asociado: ')|| :old.cc || ', ' || :old.importe);
end;