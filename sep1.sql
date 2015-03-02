drop table Cliente cascade constraints;
drop table Pedido cascade constraints;
drop table Autor cascade constraints;
drop table Autor_Libro cascade constraints;
drop table Libro cascade constraints;
drop table Libros_Pedido cascade constraints;

create table Cliente
(IdCliente CHAR(10) PRIMARY KEY,
 Nombre VARCHAR(25) NOT NULL,
 Direccion VARCHAR(60) NOT NULL,
 NumTC CHAR(16) NOT NULL);
 
create table Pedido
(IdPedido CHAR(10) PRIMARY KEY,
 IdCliente CHAR(10) NOT NULL REFERENCES Cliente,
 FechaPedido DATE NOT NULL,
 FechaExped DATE);

create table Autor
( idautor NUMBER PRIMARY KEY,
  Nombre VARCHAR(25));

create table Libro
(ISBN CHAR(15) PRIMARY KEY,
Titulo VARCHAR(60) NOT NULL,
Año CHAR(4) NOT NULL,
PrecioCompra NUMBER(6,2) DEFAULT 0,
PrecioVenta NUMBER(6,2) DEFAULT 0);

create table Autor_Libro
(ISBN CHAR(15),
Autor NUMBER,
CONSTRAINT al_PK PRIMARY KEY (ISBN, Autor),
CONSTRAINT libroA_FK FOREIGN KEY (ISBN) REFERENCES Libro,
CONSTRAINT autor_FK FOREIGN KEY (Autor) REFERENCES Autor);


create table Libros_Pedido(
ISBN CHAR(15),
IdPedido CHAR(10),
Cantidad NUMBER(3) CHECK (cantidad >0),
CONSTRAINT lp_PK PRIMARY KEY (ISBN, idPedido),
CONSTRAINT libro_FK FOREIGN KEY (ISBN) REFERENCES Libro,
CONSTRAINT pedido_FK FOREIGN KEY (IdPedido) REFERENCES Pedido);

insert into Cliente values ('0000001','Margarita Sanchez', 'Arroyo del Camino 2','1234567890123456');
insert into Cliente values ('0000002','Angel Garcia', 'Puente Viejo 13', '1234567756953456');
insert into Cliente values ('0000003','Pedro Santillana', 'Molino de Abajo 42', '1237596390123456');
insert into Cliente values ('0000004','Rosa Prieto', 'Plaza Mayor 46', '4896357890123456');
insert into Cliente values ('0000005','Ambrosio Perez', 'Corredera de San Antonio 1', '1224569890123456');
--insert into Cliente values ('0000005','Ambrosio Perez', 'Corredera de San Antonio 1', '1224569890123456'); /* error clave duplicada*/
--insert into Cliente values ('0000006','Lola Arribas', NULL, NULL); /* error valores nulos*/
insert into Cliente values ('0000006','Lola Arribas', 'Lope de Vega 32', '2444889890123456' );


insert into Pedido values ('0000001P','0000001', TO_DATE('01/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000002P','0000001', TO_DATE('01/12/2011'),null);
insert into Pedido values ('0000003P','0000002', TO_DATE('02/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000004P','0000004', TO_DATE('02/12/2011'),TO_DATE('05/12/2011'));
insert into Pedido values ('0000005P','0000005', TO_DATE('03/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000006P','0000003', TO_DATE('04/12/2011'),null);
--insert into Pedido values ('0000007P','0000003', NULL,NULL); /* error valores nulos*/
--insert into Pedido values ('0000007P','0000008', TO_DATE('04/11/2011'),null); /* error clave externa */
--insert into Pedido values ('0000006P','0000003', TO_DATE('04/11/2011'),null); /* error clave duplicada*/

insert into Autor values (1,'Matilde Asensi');
insert into Autor values (2,'Ildefonso Falcones');
insert into Autor values (3,'Carlos Ruiz Zafon');
insert into Autor values (4,'Miguel de Cervantes');
insert into Autor values (5,'Julia Navarro');
insert into Autor values (6,'Miguel Delibes');
insert into Autor values (7,'Fiodor Dostoievski');

insert into lIBRO values ('8233771378567', 'Todo bajo el cielo', '2008', 9.45, 13.45);
insert into lIBRO values ('1235271378662', 'La catedral del mar', '2009', 12.50, 19.25);
insert into lIBRO values ('4554672899910', 'La sombra del viento', '2002', 19.00, 33.15);
insert into lIBRO values ('5463467723747', 'Don Quijote de la Mancha', '2000', 49.00, 73.45);
insert into lIBRO values ('0853477468299', 'La sangre de los inocentes', '2011', 9.45, 13.45);
insert into lIBRO values ('1243415243666', 'Los santos inocentes', '1997', 10.45, 15.75);
insert into lIBRO values ('0482174555366', 'Noches Blancas', '1998', 4.00, 9.45);
insert into lIBRO values ('0242342352345', 'Libro gratis', '1998');

insert into Autor_lIBRO values ('8233771378567',1);
insert into Autor_lIBRO values ('1235271378662',2);
insert into Autor_lIBRO values ('4554672899910',3);
insert into Autor_lIBRO values ('5463467723747',4);
insert into Autor_lIBRO values ('0853477468299',5);
insert into Autor_lIBRO values ('1243415243666',6);
insert into Autor_lIBRO values ('0482174555366',7);



/*insert into Autor_lIBRO values ('0482174555366',7); /* error clave duplicada/
insert into Autor_lIBRO values ('0111111155366',7); /* error clave externa ISBN/
insert into Autor_lIBRO values ('0482174555366',9); /* error clave externa Autor*/


insert into Libros_Pedido values ('8233771378567','0000001P', 1);
insert into Libros_Pedido values ('5463467723747','0000001P', 2);
insert into Libros_Pedido values ('0482174555366','0000002P', 1);
insert into Libros_Pedido values ('4554672899910','0000003P', 1);
insert into Libros_Pedido values ('8233771378567','0000003P', 1);
insert into Libros_Pedido values ('1243415243666','0000003P', 1);
insert into Libros_Pedido values ('8233771378567','0000004P', 1);
insert into Libros_Pedido values ('4554672899910','0000005P', 1);
insert into Libros_Pedido values ('1243415243666','0000005P', 1);
insert into Libros_Pedido values ('5463467723747','0000005P', 3);



/*insert into Libros_Pedido values ('8233771378567','0000006P', 0); /* error CANTIDAD
insert into Libros_Pedido values ('5463467723747','0000005P', 6); /* error clave duplicada/
insert into Libros_Pedido values ('5463467723747','1111111P', 6); /* error clave externa PEDIDO/
insert into Libros_Pedido values ('1111111111111','0000005P', 6); /* error clave externa ISBN*/

--EJERCICIO 1
select autor, titulo, año
from libro natural join autor_libro
order by año;

--EJERCICIO 2
select titulo, año
from libro
where año >= 2000
order by año;
--CORRECCION
select isbn,titulo,año from libro where año >= 2000;

--EJERCICIO 3
select idcliente, nombre
from cliente natural join pedido;
--CORRECCION
select DISTINCT idcliente,nombre from cliente NATURAL JOIN pedido;

--EJERCICIO 4
select distinct idcliente, nombre, isbn
from (cliente natural join  pedido )natural join libros_pedido
where isbn = 4554672899910;

--EJERCICIO 5
select nombre, titulo
from cliente natural join pedido natural join libros_pedido natural join libro
where nombre like '%San%';--Distingue mayusculas y minusculas dentro de los %
--CORRECCION
select DISTINCT idcliente,nombre, titulo 
from ((cliente NATURAL JOIN pedido) NATURAL JOIN libros_pedido) NATURAL JOIN libro 
where nombre like '%San%';

--EJERCICIO 6
select distinct nombre
from cliente natural join pedido natural join libros_pedido natural join libro
where precioventa > 10;
--CORRECION
select DISTINCT idcliente,nombre from ((cliente NATURAL JOIN pedido) NATURAL JOIN 
libros_pedido) NATURAL JOIN libro where precioventa > 10;

--EJERCICIO 7
select nombre
from cliente natural join pedido
group by nombre, idCliente, pedido.fechapedido
having count(*) > 1;
--CORRECCION INCORRECTA  no se pueden agrupar cosas que no se hayan seleccionado
select idcliente,nombre from cliente NATURAL JOIN pedido group by nombre, 
fechapedido having count(*)>1;

--EJERCICIO 8
select idcliente, nombre, fechapedido
from cliente natural join pedido
where pedido.fechaexped is null;
--CORRECION
select idcliente,nombre, fechapedido from cliente NATURAL JOIN pedido 
where fechaexped is null

--EJERCICIO 9
select nombre
from cliente natural join pedido natural join libros_pedido natural join libro
where precioventa <= 10;--MAL
--BIEN
select idcliente, nombre
from cliente C
where not exists ( select idcliente from pedido natural join libros_pedido 
                    where idcliente = C.idcliente and isbn in ( select isbn from libro where  precioventa > 10));
--CORRECCION
select idcliente, nombre 
from cliente C
where NOT exists (select * from pedido P NATURAL JOIN libros_pedido LP 
                    where idcliente=C.idcliente and isbn in (select isbn from libro where precioventa >10));


--EJERCICIO 10  
select distinct titulo
from libro natural join libros_pedido
where precioventa > 30 or año < 2000;
--CORRECCION incorrecta porque es antes del 2000 no despues
select distinct titulo, año, precioVenta 
from libros_pedido NATURAL JOIN libro
where precioventa > 30 or año > 2000

--EJERCICIO 11
select titulo, precioventa
from libros_pedido natural join libro;
--lista de libros vendidos y la cantidad
select titulo, sum (cantidad)
from libros_pedido natural join libro
group by titulo;
--CORRECCION
select titulo, SUM(CANTIDAD) 
from libros_pedido NATURAL JOIN libro
group by titulo;

--EJERCICIO 12
select nombre, sum (precioventa * cantidad)
from cliente natural join pedido natural join libros_pedido natural join libro
group by nombre;
--CORRECION
select nombre, sum(precioventa*cantidad) as "Total Ventas" 
from libros_pedido NATURAL JOIN libro NATURAL JOIN cliente NATURAL JOIN pedido 
group by nombre;

--EJERCICIO 13
select sum (cantidad * ( precioventa - preciocompra)) as ganancias
from libros_pedido natural join libro;
--CORRECION
select sum((precioventa-preciocompra)*cantidad) 
from libros_pedido NATURAL JOIN libro;

--EJERCICIO 14
select fechapedido, sum ( cantidad * precioventa)
from libros_pedido natural join libro natural join pedido
where fechaexped is null
group by fechapedido;
--CORRECCION
SELECT to_char(FECHAPEDIDO, 'dd Month YYYY') as "Fecha", 
SUM(precioventa*cantidad) from libros_pedido NATURAL JOIN libro NATURAL JOIN 
pedido where fechaexped is null
group by fechapedido;

--EJERCICIO 15
select idpedido, nombre, titulo, cantidad, precioventa, (cantidad* precioventa) as total
from cliente natural join pedido natural join libros_pedido natural join libro
order by idpedido;
--CORRECCION
SELECT idpedido "Pedido", nombre "Cliente", titulo, cantidad, precioventa "Precio 
Unitario", SUM(precioventa*cantidad) "Total" 
from cliente NATURAL JOIN libros_pedido NATURAL JOIN libro NATURAL JOIN pedido
group by idPedido, nombre, titulo, cantidad, Precioventa
order by idpedido;

--EJERCICIO 16
select idpedido, sum ( cantidad * precioventa)
from pedido natural join libros_pedido natural join libro
having sum (cantidad * precioventa) > 100
group by idpedido
order by idpedido;
--CORRECCION
SELECT idpedido "Pedido", SUM(precioventa*cantidad) "Total Pedido" 
from libros_pedido NATURAL JOIN libro NATURAL JOIN pedido 
group by idpedido
having SUM(precioventa*cantidad)>100
order by SUM(precioventa*cantidad);

--EJERCICIO 17
select idpedido, sum (cantidad * precioventa) as "importe total"
from pedido natural join libros_pedido natural join libro
having count (*) > 1
group by idpedido;
--CORRECION
SELECT idpedido "Pedido", SUM(precioventa*cantidad) "Total Pedido" 
from libros_pedido NATURAL JOIN libro NATURAL JOIN pedido 
group by idpedido
having count(*) >=2
order by SUM(precioventa*cantidad)

--EJERCICIO 18
select idpedido, sum (precioventa*cantidad) as total 
from libros_pedido natural join libro
having sum (cantidad) > 4
group by idpedido;
--CORRECCION
SELECT idpedido "Pedido", SUM(precioventa*cantidad) "Total Pedido" 
from libros_pedido NATURAL JOIN libro NATURAL JOIN pedido
group by idpedido
having sum(cantidad)>=4
order by SUM(precioventa*cantidad);

--EJERCICIO 19
select titulo
from libro
where precioventa = ( select max (precioventa) from libro);
--CORRECCION
SELECT isbn,titulo,precioventa from libro 
where precioventa = (select max(precioventa) from libro);

--EJERCICIO 20
select isbn, titulo
from libro
where isbn not in ( select isbn from libros_pedido) or ((precioventa - preciocompra) < 5);
--CORRECCION
SELECT isbn, titulo from libro l 
where isbn not in (select distinct isbn from libros_pedido) or (precioventa -preciocompra) < 5; 

--EJERCICIO 21
select nombre
from cliente natural join pedido natural join libros_pedido
where cantidad >1 ;
--CORRECCION
SELECT Nombre
FROM cliente c
WHERE EXISTS (SELECT * FROM pedido NATURAL JOIN libros_pedido
WHERE idcliente=c.idcliente AND cantidad > 1);

--EJERCICIO 22
select nombre, idpedido, isbn, titulo
from cliente natural join pedido natural join libros_pedido natural join libro;
--CORRECCION (INCORRECTA)
SELECT nombre,idpedido, isbn, titulo
FROM ((cliente C left join pedido P on C.idcliente=P.idcliente) left join libros_pedido LP 
on LP.idpedido=P.idpedido) left join libro L on LP.isbn=L.isbn;