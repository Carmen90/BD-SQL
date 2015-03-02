drop table vuelo cascade constraints;
drop table avion cascade constraints;
drop table empleado cascade constraints;
drop table certificado cascade constraints;


create table vuelo(
	flno number(4,0) primary key,
	origen varchar2(20),
	destino varchar2(20),
	distancia number(6,0),
	salida date,
	llegada date,
	precio number(7,2));

create table avion(
	aid number(9,0) primary key,
	nombre varchar2(30),
	autonomia number(6,0));

create table empleado(
	eid number(9,0) primary key,
	nombre varchar2(30),
	salario number(10,2));

create table certificado(
	eid number(9,0),
	aid number(9,0),
	primary key(eid,aid),
	foreign key(eid) references empleado,
	foreign key(aid) references avion
  ); 

insert into avion values(1,	'Boeing 747-400',	8430);
insert into avion values(2,	'Boeing 737-800',	3383);
insert into avion values(3,	'AirbusA 340-300',	7120);
insert into avion values(4,	'British Aerospace Jetstream 41',	1502);
insert into avion values(5,	'Embraer ERJ-145',	1530);
insert into avion values(6,	'SAAB 340',	2128);
insert into avion values(7,	'Piper Archer III',	520);
insert into avion values(8,	'Tupolev 154',	4103);
insert into avion values(16,	'Schwitzer 2-33',	30);
insert into avion values(9,	'Lockheed L1011',	6900);
insert into avion values(10,	'Boeing 757-300',	4010);
insert into avion values(11,	'Boeing 777-300',6441);
insert into avion values(12,	'Boeing 767-400ER',	6475);
insert into avion values(13,	'Airbus A320',	2605);
insert into avion values(14,	'Airbus A319',	1805);
insert into avion values(15,	'Boeing 727',	1504);

insert into empleado values(242518965,	'James Smith',	120433);
insert into empleado values(141582651,	'Mary Johnson',	178345);
insert into empleado values(11564812,	'John Williams',	153972);
insert into empleado values(567354612,	'Lisa Walker',	256481);
insert into empleado values(552455318	,'Larry West',101745);
insert into empleado values(550156548,	'Karen Scott',	205187);
insert into empleado values(390487451	,'Lawrence Sperry',	212156);
insert into empleado values(274878974	,'Michael Miller',	99890);
insert into empleado values(254099823	,'Patricia Jones',	24450);
insert into empleado values(356187925	,'Robert Brown',	44740);
insert into empleado values(355548984	,'Angela Martinez',	212156);
insert into empleado values(310454876	,'Joseph Thompson',	212156);
insert into empleado values(489456522	,'Linda Davis',	27984);
insert into empleado values(489221823,	'Richard Jackson',	23980);
insert into empleado values(548977562,	'William Ward',	84476);
insert into empleado values(310454877,	'Chad Stewart',	33546);
insert into empleado values(142519864,	'Betty Adams',	227489);
insert into empleado values(269734834,	'George Wright',	289950);
insert into empleado values(287321212,	'Michael Miller',	48090);
insert into empleado values(552455348,	'Dorthy Lewis',	152013);
insert into empleado values(248965255,	'Barbara Wilson',	43723);
insert into empleado values(159542516,	'William Moore',	48250);
insert into empleado values(348121549,	'Haywood Kelly',	32899);
insert into empleado values(90873519,	  'Elizabeth Taylor',	32021);
insert into empleado values(486512566,	'David Anderson',	43001);
insert into empleado values(619023588,	'Jennifer Thomas',	54921);
insert into empleado values(15645489,	  'Donald King',	18050);
insert into empleado values(556784565,	'Mark Young',	205187);
insert into empleado values(573284895,	'Eric Cooper',	114323);
insert into empleado values(574489456,	'William Jones',	105743);
insert into empleado values(574489457,	'Milo Brooks',	20);


insert into certificado values(567354612,	1);
insert into certificado values(567354612,	2);
insert into certificado values(567354612,	10);
insert into certificado values(567354612,	11);
insert into certificado values(567354612,	12);
insert into certificado values(567354612,	15);
insert into certificado values(567354612,	7);
insert into certificado values(567354612,	9);
insert into certificado values(567354612,	3);
insert into certificado values(567354612,	4);
insert into certificado values(567354612,	5);
insert into certificado values(552455318,	2);
insert into certificado values(552455318,	14);
insert into certificado values(550156548,	1);
insert into certificado values(550156548,	12);
insert into certificado values(390487451,	3);
insert into certificado values(390487451,	13);
insert into certificado values(390487451,	14);
insert into certificado values(274878974,	10);
insert into certificado values(274878974,	12);
insert into certificado values(355548984,	8);
insert into certificado values(355548984,	9);
insert into certificado values(310454876,	8);
insert into certificado values(310454876,	9);
insert into certificado values(548977562,	7);
--insert into certificado values(142519864,	1);
insert into certificado values(142519864,	11);
insert into certificado values(142519864,	12);
insert into certificado values(142519864,	10);
insert into certificado values(142519864,	3);
insert into certificado values(142519864,	2);
insert into certificado values(142519864,	13);
insert into certificado values(142519864,	7);
insert into certificado values(269734834,	1);
insert into certificado values(269734834,	2);
insert into certificado values(269734834,	3);
insert into certificado values(269734834,	4);
insert into certificado values(269734834,	5);
insert into certificado values(269734834,	6);
insert into certificado values(269734834,	7);
insert into certificado values(269734834,	8);
insert into certificado values(269734834,	9);
insert into certificado values(269734834,	10);
insert into certificado values(269734834,	11);
insert into certificado values(269734834,	12);
insert into certificado values(269734834,	13);
insert into certificado values(269734834,	14);
insert into certificado values(269734834,	15);
insert into certificado values(552455318,	7);
insert into certificado values(556784565,	5);
insert into certificado values(556784565,	2);
insert into certificado values(556784565,	3);
insert into certificado values(573284895,	3);
insert into certificado values(573284895,	4);
insert into certificado values(573284895,	5);
insert into certificado values(574489456,	8);
insert into certificado values(574489456,	6);
insert into certificado values(574489457,	7);
insert into certificado values(242518965,	2);
insert into certificado values(242518965,	10);
insert into certificado values(141582651,	2);
insert into certificado values(141582651,	10);
insert into certificado values(141582651,	12);
insert into certificado values(11564812,	2);
insert into certificado values(11564812,	10);
insert into certificado values(356187925,	6);
insert into certificado values(159542516,	5);
insert into certificado values(159542516,	7);
insert into certificado values(90873519,	6);




insert into vuelo values(99,	'Los Angeles',	'Washington D.C.',	2308,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date('12/04/2005 21:40', 'DD/MM/YYYY HH24:MI')	,235.98);
insert into vuelo values(13,	'Los Angeles'	,'Chicago',	1749,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),		TO_date('12/04/2005  20:45','DD/MM/YYYY HH24:MI')	,	220.98);
insert into vuelo values(346,	'Los Angeles'	,'Dallas',	1251,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'12/04/2005  19:05','DD/MM/YYYY HH24:MI')	,	225.43);
insert into vuelo values(387,	'Los Angeles'	,'Boston',	2606,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),		TO_date('12/04/2005  17:03','DD/MM/YYYY HH24:MI')	,	261.56);
insert into vuelo values(7,	'Los Angeles'	,'Sydney',	7487	,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'14/04/2005  6:10','DD/MM/YYYY HH24:MI')	,	1278.56);
insert into vuelo values(2,	'Los Angeles',	'Tokyo',	5478,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'13/04/2005  15:55','DD/MM/YYYY HH24:MI')	,	780.99);
insert into vuelo values(33,	'Los Angeles',	'Honolulu',	2551,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'12/04/2005  11:15',	'DD/MM/YYYY HH24:MI')	,375.23);
insert into vuelo values(34	,'Los Angeles',	'Honolulu',	2551,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'12/04/2005  15:18','DD/MM/YYYY HH24:MI')	,	425.98);
insert into vuelo values(76	,'Chicago'	,'Los Angeles',	1749,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'12/04/2005  10:03','DD/MM/YYYY HH24:MI')	,	220.98);
insert into vuelo values(68	,'Chicago',	'New York',	802,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),		TO_date('12/04/2005  12:02','DD/MM/YYYY HH24:MI')	,	202.45);
insert into vuelo values(7789,	'Madison',	'Detroit',	319,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'12/04/2005  8:19','DD/MM/YYYY HH24:MI')	,	120.33);
insert into vuelo values(701,	'Detroit'	,'New York',	470,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI')	,	TO_date('12/04/2005  10:26','DD/MM/YYYY HH24:MI')	,	180.56);
insert into vuelo values(702,	'Madison'	,'New York',	789	,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'12/04/2005  10:12','DD/MM/YYYY HH24:MI')	,	202.34);
insert into vuelo values(4884,	'Madison',	'Chicago',	84	,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI')	,	TO_date('12/04/2005  23:02','DD/MM/YYYY HH24:MI')	,	112.45);
insert into vuelo values(2223,	'Madison'	,'Pittsburgh',	517,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date(	'12/04/2005  10:01','DD/MM/YYYY HH24:MI')	,	189.98);
insert into vuelo values(5694,	'Madison'	,'Minneapolis',	247	,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),	TO_date('12/04/2005  9:33',	'DD/MM/YYYY HH24:MI')	,120.11);
insert into vuelo values(304,	'Minneapolis',	'New York',	991	,TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),		TO_date('12/04/2005  1:39','DD/MM/YYYY HH24:MI')	,	101.56);
insert into vuelo values(149,	'Pittsburgh',	'New York',	303,	TO_date('12/04/2005 9:30', 'DD/MM/YYYY HH24:MI'),		TO_date('12/04/2005  12:09',	'DD/MM/YYYY HH24:MI')	,116.50);



--1. Código y nombre de los pilotos certificados para pilotar aviones Boeing.
select eid, nombre
from certificado natural join empleado
group by eid, nombre;
--2. Código de aviones que pueden hacer el recorrido de Los Angeles a Chicago sin respostar.
select aid 
from vuelo, avion
where distancia < autonomia and origen = 'Los Angeles' and destino = 'Chicago'
group by aid
order by aid;
--3. Identificar los vuelos que pueden ser pilotados por todos los pilotos con salario superior a 100.000 euros.

/*SELECT DISTINCT f.flno, F.origen, F.destino
FROM vuelo F
WHERE EXISTS (SELECT *
FROM empleado E, certificado
WHERE E.salario > 100000
AND
 EXISTS (SELECT *
FROM avion A, certificado C
WHERE A.autonomia > F.distancia
AND E.eid = C.eid AND A.aid = C.aid))
order by f.flno;*/


select flno
from vuelo, certificado natural join empleado
where salario > 100000
group by flno
order by flno;

--4. Pilotos certificados para operar con aviones con una autonomía superior a 3000 millas pero no certificados para aviones Boeing.
select Em.nombre
from certificado Ce, avion Av, empleado Em
where Av.autonomia > 3000 and Av.nombre not like 'Boeing%' and Av.aid = Ce.aid and Ce.eid = Em.eid
group by Em.nombre;
--5. Empleado con el salario más elevado.
select nombre
from empleado
where salario = (select max(salario) from empleado);
--6. Empleados con el segundo salario más alto.
select nombre
from empleado
where salario = (select max(salario) from empleado where salario != (select max(salario) from empleado));
--7. Empleado con mayor número de certificaciones para volar.
select eid , count(aid) "Certificaciones"
from empleado natural join certificado
group by eid;
/*having count(aid) = (select max(count(aid)) from certificado group by eid);
SELECT eid , count(*) FROM certificado GROUP BY eid
HAVING COUNT(*) = (SELECT MAX (COUNT(*))
FROM certificado GROUP BY eid)*/

--8. Empleados certificados para 3 modelos de avión.
select nombre, eid
from certificado natural join empleado
group by nombre, eid
having count(aid) = 3;

/*SELECT eid
FROM certificado
GROUP BY eid
HAVING COUNT (*) = 3;*/
--9. Importe total del salario de los empleados de la compañía.
select sum(salario) "importe"
from empleado;
--10. Nombre de los aviones tales que todos los pilotos certificados para operar con ellos tengan salarios superiores a 80.000 euros.
select distinct nombre
from Avion 
where aid in 
 ( select distinct aid
   from certificado natural join empleado
   where salario > 80000 ) order by nombre ;
   
/*SELECT DISTINCT nombre
FROM avion
WHERE aid IN (SELECT aid
FROM certificado Ce, empleado E
WHERE Ce.eid = E.eid AND
NOT EXISTS ( SELECT *
FROM empleado E1
WHERE E1.eid = E.eid AND E1.salario < 80000 )) order by nombre;*/

--11. Para cada piloto certificado para operar con más de 3 modelos de avión indicar el código de empleado y la autonomía máxima de los aviones que puede pilotar.
select distinct eid, max(autonomia)
from avion natural join certificado
where eid in 
  (select eid
  from certificado natural join empleado
  group by eid
  having count (aid) > 3)
  group by eid;
  
                    
SELECT eid, MAX(autonomia)
FROM certificado C, avion A
WHERE C.aid = A.aid
GROUP BY eid
HAVING COUNT (*) > 3;

--12. Nombre de los pilotos cuyo salario es inferior a la ruta más barata entre Los Ángeles y Honolulu.
select nombre
from empleado natural join certificado
where salario <  (select min(precio) 
                  from vuelo
                  where origen like 'Los Angeles' and destino like 'Honolulu');
/*SELECT DISTINCT nombre
FROM empleado
WHERE salario < ( SELECT MIN (precio )
FROM vuelo
WHERE origen = 'Los Angeles' AND destino = 'Honolulu' );*/
--13. Mostrar el nombre de los aviones con autonomía de vuelo superior a 1.000 millas junto con la media salarial de los pilotos certificados.
select distinct Av.nombre, trunc(AVG(Em.salario), 2) "Media"
from empleado Em, certificado Ce, avion Av
where Em.eid = Ce.eid and Ce.aid = Av.aid and Av.autonomia > 1000
group by Av.aid, Av.nombre;

/*SELECT A.nombre AS nombre, trunc(AVG(salario),2) AS Avgsalario
FROM avion A, certificado C, empleado E
WHERE A.aid = C.aid AND C.eid = E.eid AND autonomia > 1000
GROUP BY A.aid, A.nombre;*//

--14. Un cliente quiere viajar de Madison a New York con a lo sumo dos escalas. Listar las opciones de salida de Madison si el cliente quiere llegar a New York como tarde a las 6 p.m.

--15. Calcular la diferencia entre la media salarial de todos los empleados (incluidos los pilotos) y la de los pilotos.
select trunc(AVG(Pilotos.media),2)-trunc(AVG(Emples.media),2) "Diferencia"
from 
(select distinct AVG(salario) as media
from empleado) Emples,
(select distinct AVG(salario) as media
from empleado natural join certificado) Pilotos;

SELECT trunc(Pilotos.avg,2) - trunc(Otros.avg,2)
FROM
(SELECT AVG (salario) AS avg FROM empleado
WHERE eid IN (SELECT DISTINCT eid FROM certificado)) Pilotos,
(SELECT AVG (salario) AS avg FROM empleado) Otros;

--16. Listar el nombre y los salarios de los empleados (no pilotos) cuyo salario sea superior a la media salarial de los pilotos.

select distinct nombre, salario
from empleado
where salario > (  --- HAY QUE CAMBIAR LA FORMA DE HACER LA MEDIA
                select distinct trunc(AVG(salario),2)
                from empleado natural join certificado
                ) and eid not in (select distinct eid
                                  from certificado)
                ;
SELECT nombre, salario
FROM empleado
WHERE eid NOT IN ( SELECT DISTINCT eid FROM certificado )
AND salario > ( SELECT AVG (salario) FROM empleado
WHERE eid IN (SELECT DISTINCT eid FROM certificado));
--17. Nombre de los pilotos certificados solo para modelos con autonomía superior a 1.000 millas.
select nombre
from empleado natural join certificado 
where exists (
                select *
                from avion natural join certificado
                where autonomia > 1000)
group by nombre;
SELECT nombre, E.eid
FROM empleado E, certificado C
WHERE E.eid = C.eid
AND not exists (select * from avion A, certificado C1 where C1.aid = A.aid AND C1.eid=E.eid and A.autonomia <= 1000)
GROUP BY E.eid, E.nombre;
--18. Nombre de los pilotos certificados solo para modelos con autonomía superior a 1.000 millas y al menos dos certificados.
select distinct nombre
from empleado natural join certificado
where exists (select *
              from avion natural join certificado
              where autonomia > 1000)
group by nombre, eid
having count(eid) >= 2;

SELECT nombre, E.eid
FROM empleado E, certificado C
WHERE E.eid = C.eid
AND not exists (select * from avion A, certificado C1 where C1.aid = A.aid AND C1.eid=E.eid and A.autonomia <= 1000)
GROUP BY E.eid, E.nombre
HAVING COUNT(*) >1;
--19. Nombre de los pilotos certificados solo para modelos con autonomía superior a 1.000 millas certificados para algún Boeing.
select distinct nombre
from empleado natural join certificado
where exists (select *
              from avion natural join certificado
              where autonomia > 1000 and nombre like '%Boeing%')
              group by nombre, eid
;

SELECT nombre, E.eid
FROM empleado E, certificado C
WHERE E.eid = C.eid
AND not exists (select * from avion A, certificado C1 where C1.aid = A.aid AND C1.eid=E.eid and A.autonomia <= 1000)
AND exists (select * from avion A, certificado C1 where C1.aid = A.aid AND C1.eid=E.eid and A.nombre like '%Boeing%')
GROUP BY E.eid, E.nombre