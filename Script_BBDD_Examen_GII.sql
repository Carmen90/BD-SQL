DROP TABLE Cajero cascade constraints;
DROP TABLE Producto cascade constraints;
DROP TABLE Venta cascade constraints;
DROP TABLE Maquina cascade constraints;
DROP TABLE Comision cascade constraints;

drop sequence SQventa;

CREATE TABLE Cajero (
cod VARCHAR(50) PRIMARY KEY,
nombre VARCHAR(100) not NULL,
departamento number(2,0));

CREATE TABLE Producto(
codprod VARCHAR(50) PRIMARY KEY,
descripcion VARCHAR(50) not NULL,
precio NUMBER(5,2) default 0);

CREATE TABLE Maquina(
codmaq VARCHAR(50) PRIMARY KEY,
piso NUMBER(1) not null);

CREATE TABLE Venta (
fecha date not null,
idventa number(4) primary key,
codprod VARCHAR(50) not null,
codmaq  VARCHAR(50) not null,
cod VARCHAR(50) not null,
FOREIGN KEY (codprod) REFERENCES Producto on delete cascade,
FOREIGN KEY (codmaq) REFERENCES Maquina on delete cascade,
FOREIGN KEY (cod) REFERENCES Cajero on delete cascade);

CREATE TABLE Comision(
fecha date not null,
cod VARCHAR(50) not null,
importe_com NUMBER(6,2) not null,
FOREIGN KEY (cod) REFERENCES Cajero on delete cascade);


CREATE SEQUENCE  SQVENTA;

insert into cajero values ('001','Pepe',1);
insert into cajero values ('002','Ana',1);
insert into cajero values ('003','Lola',2);
insert into cajero values ('004','Ana',2);
insert into cajero values ('005','Sara',2);

insert into maquina values ('M001',1);
insert into maquina values ('M002',2);
insert into maquina values ('M003',2);
insert into maquina values ('M004',4);

insert into producto values ('001','Corbata',65);
insert into producto values ('002','Gafas',165);
insert into producto values ('003','Bolso',220);
insert into producto values ('004','Anillo',369);
insert into producto values ('005','Agenda',120);
insert into producto values ('006','Cartera',185);
insert into producto values ('007','Bufanda',85);
insert into producto values ('008','Guantes',95);
insert into producto values ('009','Abanico',45);
insert into producto values ('010','Reloj',185);


insert into venta values (to_date('02/01/2012','dd/mm/yyyy'),sqventa.nextval,'001','M001','001');
insert into venta values (to_date('02/01/2012','dd/mm/yyyy'),sqventa.nextval,'002','M001','002');
insert into venta values (to_date('02/01/2012','dd/mm/yyyy'),sqventa.nextval,'002','M002','002');
insert into venta values (to_date('02/01/2012','dd/mm/yyyy'),sqventa.nextval,'003','M003','005');
insert into venta values (to_date('04/02/2012','dd/mm/yyyy'),sqventa.nextval,'003','M004','004');
insert into venta values (to_date('02/03/2012','dd/mm/yyyy'),sqventa.nextval,'004','M002','001');
insert into venta values (to_date('12/04/2012','dd/mm/yyyy'),sqventa.nextval,'004','M004','001');
insert into venta values (to_date('12/04/2012','dd/mm/yyyy'),sqventa.nextval,'005','M004','003');
insert into venta values (to_date('20/05/2012','dd/mm/yyyy'),sqventa.nextval,'006','M003','002');
insert into venta values (to_date('21/05/2012','dd/mm/yyyy'),sqventa.nextval,'007','M001','001');
insert into venta values (to_date('26/06/2012','dd/mm/yyyy'),sqventa.nextval,'008','M001','004');
insert into venta values (to_date('27/06/2012','dd/mm/yyyy'),sqventa.nextval,'008','M004','004');
insert into venta values (to_date('28/06/2012','dd/mm/yyyy'),sqventa.nextval,'009','M003','005');
insert into venta values (to_date('30/06/2012','dd/mm/yyyy'),sqventa.nextval,'010','M003','003');
insert into venta values (to_date('15/07/2012','dd/mm/yyyy'),sqventa.nextval,'010','M002','002');
insert into venta values (to_date('18/07/2012','dd/mm/yyyy'),sqventa.nextval,'008','M004','001');
insert into venta values (to_date('02/08/2012','dd/mm/yyyy'),sqventa.nextval,'007','M001','001');
insert into venta values (to_date('06/08/2012','dd/mm/yyyy'),sqventa.nextval,'007','M003','001');
insert into venta values (to_date('08/09/2012','dd/mm/yyyy'),sqventa.nextval,'006','M002','003');
insert into venta values (to_date('12/09/2012','dd/mm/yyyy'),sqventa.nextval,'005','M001','003');
insert into venta values (to_date('15/09/2012','dd/mm/yyyy'),sqventa.nextval,'004','M002','005');
insert into venta values (to_date('17/09/2012','dd/mm/yyyy'),sqventa.nextval,'003','M001','005');
insert into venta values (to_date('19/10/2012','dd/mm/yyyy'),sqventa.nextval,'002','M003','005');
insert into venta values (to_date('20/11/2012','dd/mm/yyyy'),sqventa.nextval,'001','M003','003');
insert into venta values (to_date('30/11/2012','dd/mm/yyyy'),sqventa.nextval,'001','M002','002');
insert into venta values (to_date('10/12/2012','dd/mm/yyyy'),sqventa.nextval,'010','M003','001');
insert into venta values (to_date('10/12/2012','dd/mm/yyyy'),sqventa.nextval,'001','M002','001');
insert into venta values (to_date('10/12/2012','dd/mm/yyyy'),sqventa.nextval,'005','M002','005');
insert into venta values (to_date('11/12/2012','dd/mm/yyyy'),sqventa.nextval,'006','M001','003');
insert into venta values (to_date('11/12/2012','dd/mm/yyyy'),sqventa.nextval,'007','M001','003');
insert into venta values (to_date('11/12/2012','dd/mm/yyyy'),sqventa.nextval,'008','M004','001');
insert into venta values (to_date('12/12/2012','dd/mm/yyyy'),sqventa.nextval,'009','M004','001');
insert into venta values (to_date('13/12/2012','dd/mm/yyyy'),sqventa.nextval,'009','M004','003');
insert into venta values (to_date('15/12/2012','dd/mm/yyyy'),sqventa.nextval,'008','M003','003');
insert into venta values (to_date('16/12/2012','dd/mm/yyyy'),sqventa.nextval,'002','M003','003');
insert into venta values (to_date('18/12/2012','dd/mm/yyyy'),sqventa.nextval,'002','M001','003');
insert into venta values (to_date('19/12/2012','dd/mm/yyyy'),sqventa.nextval,'003','M001','001');
insert into venta values (to_date('19/12/2012','dd/mm/yyyy'),sqventa.nextval,'004','M001','001');
insert into venta values (to_date('20/01/2013','dd/mm/yyyy'),sqventa.nextval,'005','M001','005');
insert into venta values (to_date('22/01/2013','dd/mm/yyyy'),sqventa.nextval,'006','M001','005');
insert into venta values (to_date('22/01/2013','dd/mm/yyyy'),sqventa.nextval,'007','M003','003');
insert into venta values (to_date('22/01/2013','dd/mm/yyyy'),sqventa.nextval,'008','M003','001');
insert into venta values (to_date('22/01/2013','dd/mm/yyyy'),sqventa.nextval,'009','M001','004');
insert into venta values (to_date('24/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M001','001');
insert into venta values (to_date('24/01/2013','dd/mm/yyyy'),sqventa.nextval,'005','M001','002');
insert into venta values (to_date('24/01/2013','dd/mm/yyyy'),sqventa.nextval,'004','M001','003');
insert into venta values (to_date('24/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','001');
insert into venta values (to_date('24/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M002','002');
insert into venta values (to_date('24/01/2013','dd/mm/yyyy'),sqventa.nextval,'002','M002','001');
insert into venta values (to_date('24/01/2013','dd/mm/yyyy'),sqventa.nextval,'007','M001','001');
insert into venta values (to_date('27/01/2013','dd/mm/yyyy'),sqventa.nextval,'007','M001','004');
insert into venta values (to_date('27/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M004','005');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M003','005');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M001','001');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M004','001');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M004','001');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M001','001');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M001','003');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'002','M001','001');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'005','M001','002');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'007','M001','002');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'008','M002','005');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'009','M002','005');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'001','M004','005');
insert into venta values (to_date('28/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M003','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M002','002');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','005');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M003','005');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','001');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','001');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','001');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','001');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','001');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','001');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M003','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M002','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M003','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M004','003');
insert into venta values (to_date('29/01/2013','dd/mm/yyyy'),sqventa.nextval,'003','M001','003');


/*1. Diseñar las consultas necesarias para recuperar la siguiente información: 
a. (0.5 puntos) Código, descripción y número de ventas cada producto ordenado 
por número de ventas
*/
select codprod, descripcion, count (idventa)as numVentas
from producto natural join venta
group by codprod, descripcion
order by numVentas;

/*b. (0.5 puntos) Código y nombre de los cajeros que han realizado el mayor número 
de ventas
*
select cod, nombre
from maquina natural join venta natural join cajero
group by cod, nombre
having count (idventa) = ( select max (count (idventa))from  venta natural join cajero group by cod);

--COMPROBACION
select cod, nombre, count(*)
from maquina natural join venta natural join cajero
group by cod, nombre;

/*c. (1 puntos) Empleados que solo han vendido productos de importe superior a 
300 euros
*
select cod, nombre
from cajero natural join venta natural join producto
where cod not in ( select cod from cajero natural join venta natural join producto where precio < 300);

--COMPROBACION
select cod, nombre, codprod, precio
from cajero natural join venta natural join producto
order by cod;

/*d. (1.5 puntos) Código y nombre de cajeros que han hecho más de una venta de un 
mismo producto en la misma fecha.
*/
select distinct cajero.cod, cajero.nombre
from venta v1, venta v2, producto p1, producto p2, cajero
where (v1.fecha = v2.fecha) and 
      (v1.idventa <> v2.idventa) and
      (cajero.cod = v1.cod) and
      (cajero.cod = v2.cod) and
      (v1.codprod = p1.codprod) and
      (v2.codprod = p2.codprod)
order by cajero.cod;
/*select cod, nombre
from cajero natural join venta
group by cod, nombre, fecha
having count (codprod) >1;
where ( from venta v where fecha = v.fecha
-------------------------------------------------------CORRECCION!!----------------------------*/
--COMBROBACION
select cod, fecha,count (codprod)
from cajero natural join venta
group by cod, fecha;

/*e. (2 puntos) Código y Nombre de cajeros que han hecho ventas en pisos cuyas 
ventas totales superan los 3000 euros.
*/
select distinct cod, nombre
from cajero natural join venta natural join maquina
where piso in ( select piso from maquina natural join venta natural join producto group by piso having sum ( precio) >3000);

--COMPROBACION
select piso, sum (precio)
from venta natural join maquina natural join producto
group by  piso;

select distinct cod, nombre, piso
from cajero natural join maquina natural join venta;


select cod, nombre, sum ( precio)
from cajero natural join venta natural join producto
group by cod, nombre;

select cod, nombre, idventa, fecha
from cajero natural join venta natural join producto
where precio = ( select max ( precio) from producto );
/
/*
CREATE OR REPLACE procedure listado ( num_min number, porcentaje number) is
ventas number;
importe number;
comision number;
cursor clista is
select cod, nombre, sum ( precio) as total
from cajero natural join venta natural join producto
group by cod, nombre;

begin 
for rlista in clista loop
dbms_output.put_line(rpad('total ventas', 15, ' ') || rpad('importe', 10, ' ') || rpad('comision', 10, ' '));
if (rlista.total > num_min )then
   comision := rlista.total * porcentaje;
else 
comision := 0;
end if;
dbms_output.put_line(rpad('total ventas', 15, ' ') || rpad('importe', 10, ' ') || rpad('comision', 10, ' ')); 
end loop;
end;
*/
/

create or replace 
TRIGGER "examen" 
before INSERT ON venta 
FOR EACH row 
DECLARE 
  mayorProd producto.codprod%type;
  mayorPrecio producto.precio%type;
  BEGIN
    select max(precio) into mayorPrecio
    from producto;
  
    SELECT codprod INTO mayorProd
    FROM producto
    where precio = mayorPrecio;
 
    
    IF (mayorProd = :new.codprod) THEN
      INSERT INTO comision VALUES(:new.fecha, :new.cod, mayorPrecio/10);
    END IF;
    
END;
