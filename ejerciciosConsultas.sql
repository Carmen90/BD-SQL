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
insert into Cliente values ('0000005','Ambrosio Perez', 'Corredera de San Antonio 1', '1224569890123456'); /* error clave duplicada*/
insert into Cliente values ('0000006','Lola Arribas', NULL, NULL); /* error valores nulos*/
insert into Cliente values ('0000006','Lola Arribas', 'Lope de Vega 32', '2444889890123456' );


insert into Pedido values ('0000001P','0000001', TO_DATE('01/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000002P','0000001', TO_DATE('01/12/2011'),null);
insert into Pedido values ('0000003P','0000002', TO_DATE('02/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000004P','0000004', TO_DATE('02/12/2011'),TO_DATE('05/12/2011'));
insert into Pedido values ('0000005P','0000005', TO_DATE('03/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000006P','0000003', TO_DATE('04/12/2011'),null);
insert into Pedido values ('0000007P','0000003', NULL,NULL); /* error valores nulos*/
insert into Pedido values ('0000007P','0000008', TO_DATE('04/11/2011'),null); /* error clave externa */
insert into Pedido values ('0000006P','0000003', TO_DATE('04/11/2011'),null); /* error clave duplicada*/

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



insert into Autor_lIBRO values ('0482174555366',7); /* error clave duplicada*/
insert into Autor_lIBRO values ('0111111155366',7); /* error clave externa ISBN*/
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



insert into Libros_Pedido values ('8233771378567','0000006P', 0); /* error CANTIDAD*/
insert into Libros_Pedido values ('5463467723747','0000005P', 6); /* error clave duplicada*/
insert into Libros_Pedido values ('5463467723747','1111111P', 6); /* error clave externa PEDIDO*/
insert into Libros_Pedido values ('1111111111111','0000005P', 6); /* error clave externa ISBN*/


/* EJERCICIO 1: Lista de libros disponibles con su autor y año de publicación ordenada por este ultimo. */
select autor, año
from Autor_libro natural join libro
order by año;

/* EJERCICIO 2:Lista de libros disponibles publicados después del año 2000. */
select titulo, año
from libro
where año > 2000
order by año;

/* EJERCICIO 3 Lista de Clientes que han realizado algún pedido*/
select idcliente, nombre
from cliente natural join pedido
order by nombre;

/* EJERCICIO 4 Lista de clientes que han adquirido el libro con ISBN= 4554672899910*/
select idcliente, nombre
from (libros_pedido natural join pedido) natural join cliente
where ISBN = '4554672899910';

/* EJERCICIO 5 Lista de los clientes y los libros adquiridos por ellos cuyo nombre contenga ‘San’*/
select idcliente, nombre, isbn
from (libros_pedido natural join pedido)  natural join cliente
where nombre like '%San%';

/* EJERCICIO 6 Lista de Clientes que hayan comprado libros de más de 10 euros. */
select idcliente, nombre
from ((libros_pedido natural join pedido)natural join libro) natural join cliente
where precioventa > 10;

/* EJERCICIO 7 Clientes que han hecho más de un pedido el mismo día.*/
select idcliente, fechapedido
from pedido
group by idcliente, fechapedido
having count(*) > 1;

/* EJERCICIO 8 Clientes y fecha de pedidos que no han sido expedidos aun.*/
select idcliente, fechapedido
from (pedido natural join cliente)
where fechaexped is null;

/* 9. Lista de clientes que no han comprado libros de precio superior a 10 euros*/
select idpedido, preciocompra, idcliente
from libros_pedido natural join libro natural join cliente
where preciocompra > 10;

/* 10. Lista de libros vendidos con precio superior a 30 euros o publicados antes del año 2000 */
select titulo, precioventa, año
from libro natural join libros_pedido
where precioventa > 30 or año<2000;

/* 11. Lista de ventas de libros  */
select titulo, precioventa
from libro natural join libros_pedido;

/*12. Lista de Clientes con el importe total gastado en la librería*/
select nombre, sum(cantidad*preciocompra) as importe  
from libros_pedido natural join libro natural join pedido natural join cliente
group by nombre
order by nombre;

--  13. Ganancias obtenidas con las ventas
select sum(precioventa) as Ganancias
from libro natural join libros_pedido;

/*14. Lista de importe total de pedidos por fecha, que se hayan realizado después del 01/12/2011 y no hayan sido expedidos*/
select sum(preciocompra) , fechapedido
from pedido natural join libros_pedido natural join libro
where fechapedido > '01/12/2011' and fechaexped is null
group by fechapedido
order by fechapedido;

/* 15. Detalle líneas de pedido */

/* 16. Pedidos con importe superior a 100 euros */

/* 17. Pedidos con importe total que contengan más de un titulo */

/* 18. Pedidos con importe total que contengan más de 4 libros (ejemplares) */

/* 19. Lista de libros más caros. */

/* 20. Libros de los que no se haya vendido ningún ejemplar o cuyo beneficio sea inferior a 5 euros */

/* 21. Clientes que hayan comprado más de un ejemplar de un titulo en alguna ocasión */

/* 22. Lista de Nombre de cliente, numero de pedido, isbn y titulo de libros adquiridos usando relaciones */
