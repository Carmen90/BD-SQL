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
insert into certificado values(142519864,	1);
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


--EJERCICIO 1
/*select distinct e.eid, E.nombre
from empleado E, certificado C, avion A
where E.eid = C.eid and c.aid = a.aid and A.nombre like 'Boeing%';
--CORRECCION
SELECT DISTINCT E.nombre 
FROM empleado E, certificado C, avion A
WHERE E.eid = C.eid AND
C.aid = A.aid AND
A.nombre LIKE 'Boeing%';*/

--EJERCICIO 2
/*select distinct aid
from avion
where autonomia > ( select min (distancia) from vuelo where origen = 'Los Angeles' and destino = 'Chicago')
order by aid;
--CORRECCION
SELECT A.aid
FROM avion A
WHERE A.autonomia > (SELECT MIN (F.distancia )
FROM vuelo F
WHERE F.origen = 'Los Angeles' AND F.destino = 'Chicago');
*/

--EJERCICIO 3
/*select distinct flno
from vuelo natural join certificado natural join empleado
where salario > 100000
order by flno;

select distinct flno, f.origen, f.destino
from vuelo f,empleado e, certificado ce, avion av
where salario >100000 and ce.eid = e.eid and ce.aid = av.aid and av.autonomia > f.distancia
--where f.distancia < ( select autonomia from empleado e, certificado ce, avion av where salario >100000 and ce.eid = e.eid and ce.aid = av.aid)
order by flno;

--CORRECCION 真真真真真???????????
SELECT DISTINCT F.origen, F.destino 
FROM vuelo F
WHERE NOT EXISTS (SELECT *
FROM empleado E, certificado
WHERE E.salario > 100000
AND
NOT EXISTS (SELECT *
FROM avion A, certificado C
WHERE A.autonomia > F.distancia 
AND E.eid = C.eid AND A.aid = C.aid));*/

--EJERCICIO 4
select distinct E.nombre
from empleado E, certificado C, avion A
where  C.aid = A.aid and E.eid = C.eid and A.autonomia >3000 
and E.eid not in ( select em.eid from empleado em, certificado ce, avion av where em.eid = ce.eid and ce.aid = av.aid and av.nombre like 'Boeing%')
order by nombre;



--CORRECCION
SELECT DISTINCT E.nombre 
FROM empleado E
WHERE E.eid IN ( SELECT C.eid FROM certificado C
                  WHERE EXISTS ( SELECT A.aid
                                  FROM avion A
                                WHERE A.aid = C.aid
                                AND A.autonomia > 3000 )
                        AND NOT EXISTS ( SELECT A1.aid
                        FROM avion A1
WHERE A1.aid = C.aid
AND A1.nombre LIKE 'Boeing%'));
