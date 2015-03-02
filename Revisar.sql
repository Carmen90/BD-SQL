drop table Personas cascade constraints;
drop table Autores cascade constraints;
drop table Revisores cascade constraints;
drop table Asistentes cascade constraints;
drop table Articulos cascade constraints;
drop table Sesiones cascade constraints;
drop table Escribe cascade constraints;
drop table ConflictosInteres cascade constraints;
drop table Revisan cascade constraints;
drop table Palabras_clave cascade constraints;
drop table Expertos cascade constraints;

create table Personas
(nombre varchar2(36),
afiliacion varchar2(36),
correo_e varchar2(36) primary key,
pais varchar2(36)
);

create table Autores
(correo_e varchar2(36) primary key,
titulo number(1),--check( titulo = '0' || titulo = '1'),-- 0 no 1 si
foreign key(correo_e) references Personas
);

create table Revisores
(correo_e varchar2(36) primary key,
numero_años number(3),
foreign key(correo_e) references Personas
);

create table Sesiones
(orden number(3),
fecha date,
titulo varchar2(36),
correo_e varchar2(36),
primary key(orden, fecha),
foreign key (correo_e) references Revisores
);

create table Articulos
(numero number(36) primary key, 
resumen varchar2(36),
contenido varchar2(36),
titulo varchar2(36),
aceptado number(1),-- check( aceptado = '0' || aceptado = '1'), --0 no 1 si
orden number(3),
fecha date,
foreign key (orden, fecha) references Sesiones
);

create table Palabras_clave
(numero number(36),
palabras varchar2(36),
primary key (numero, palabras),
foreign key (numero) references Articulos
);

create table Asistentes
(correo_e varchar2(36) primary key,
numero_socio number(36),
tarifa varchar2(36),
vegetariano number(1),-- check( vegetariano = '0' || vegetariano = '1'),
numero number (36),
tickets number (3),
foreign key (numero) references Articulos,
foreign key(correo_e) references Personas
);

create table Escribe
(correo_e varchar2(36),
numero number(36),
primary key(correo_e, numero),
foreign key(correo_e) references Autores,
foreign key(numero) references Articulos
);

create table ConflictosInteres
(correo_e varchar2(36),
numero number(36),
primary key(correo_e, numero),
foreign key(correo_e) references Revisores,
foreign key(numero) references Articulos
);

create table Revisan
(correo_e varchar2(36),
numero number(36),
nivel number(1),-- check( nivel = '1' || nivel = '2' || nivel = '3'),
puntuacion number(1),-- check ( puntuacion = '2' || puntuacion = '1' || puntucion = '-1' || puntucion = '-2'),
primary key(correo_e, numero),
foreign key(correo_e) references Revisores,
foreign key(numero) references Articulos
);

/*-----------------------------------PERSONAS-----------------------------------*/

insert into Personas values ( 'Carlos Muñoz', 'Complutense', 'carmun@hotmail.com', 'España');
insert into Personas values ( 'Luisa Fernandez', 'Telefónica', 'lu_fer@hotmail.com', 'España');
insert into Personas values ( 'Ana Zafiro', 'Politécnica', 'zafiro@gmail.com', 'Francia');
insert into Personas values ( 'Laura Sanchez', 'Complutense', 'lasa@estumail.ucm.es', 'España');
insert into Personas values ( 'Victoria Boiska', 'Curador', 'vikcur@hotmail.com', 'Rusia');
insert into Personas values ( 'Adela Barros', 'Rey Juan Carlos', 'adebar@yahoo.com', 'España');
insert into Personas values ( 'Clara Mennella', 'Complutense', 'clamen@hotmail.com', 'Italia');
insert into Personas values ( 'David Ortega', 'Ramón Y Cajal', 'dorga@gmail.com', 'España');
insert into Personas values ( 'Luis Jimenez', 'Complutense', 'siuljim@hotmail.com', 'España');
insert into Personas values ( 'Lui Chan', 'Complutense', 'luichan@ucm.es', 'China');
insert into Personas values ( 'Jhon Banhutten', 'Politecnica', 'jhon_hutten@hotmail.ge', 'Alemania');
insert into Personas values ( 'Alfed Scott', 'Seguridad Social', 'alScot@hotmail.com', 'Irlanda');
insert into Personas values ( 'Eric Kandel', 'Complutense', 'erkan@hotmail.com', 'Austria');
insert into Personas values ( 'Lourdes Sherrington', 'Complutense', 'lourdes_Sh@hotmail.com', 'Reino Unido');
insert into Personas values ( 'Andrea Lopez', 'Complutense', 'and_lopez@gmail.es', 'España');
insert into Personas values ( 'Felipe Santoral', 'Rey Juan Carlos', 'felSanto@gmail.com', 'España');
insert into Personas values ( 'Lonera Mckennit', 'Complutense', 'loneMc@hotmail.com', 'Finlandia');
insert into Personas values ( 'Sofia Castro', 'Seguridad Social', 'soficas@gmail.es', 'Cuba');
insert into Personas values ( 'Rudolf Hunter', 'Autónoma', 'rudolfHunt@msn.com', 'Alemania');
insert into Personas values ( 'Carlos Ortega', 'C.E.U San Pablo', 'ortega_carlos@msn.com', 'España');
insert into Personas values ( 'Carmen Gallego', 'CarlosIII', 'carGallego@gmai.es', 'España');
insert into Personas values ( 'Pedro Pulcino', 'U.A.H', 'pepu@hotmail.it', 'Italia');
insert into Personas values ( 'Nerea Lamella', 'Complutense', 'ner_lla@hotmail.com', 'España');
insert into Personas values ( 'Sheila Gonzalez', 'Complutense', 'she_gon@ucm.es', 'España');
insert into Personas values ( 'Antonio Perez', 'Complutense', 'atn_perz@hotmail.es', 'España');

/*-------------------------------AUTORES-----------------------------------*/

insert into Autores values ('atn_perz@hotmail.es', 1);
insert into Autores values ('soficas@gmail.es', 0);
insert into Autores values ('ner_lla@hotmail.com', 1);
insert into Autores values ('she_gon@ucm.es', 1);
insert into Autores values ('rudolfHunt@msn.com', 0);
insert into Autores values ('lourdes_Sh@hotmail.com', 0);
insert into Autores values ('adebar@yahoo.com', 1);
insert into Autores values ('carGallego@gmai.es', 1);
insert into Autores values ('pepu@hotmail.it', 0);
insert into Autores values ('dorga@gmail.com', 1);
insert into Autores values ('luichan@ucm.es', 1);
insert into Autores values ('jhon_hutten@hotmail.ge', 1);
insert into Autores values ('alScot@hotmail.com', 0);
insert into Autores values ('lu_fer@hotmail.com', 0);

/*----------------------------REVISORES---------------------------------------------*/

insert into Revisores values ('atn_perz@hotmail.es', 3);
insert into Revisores values ('ner_lla@hotmail.com', 2);
insert into Revisores values ('adebar@yahoo.com', 4);
insert into Revisores values ('dorga@gmail.com', 1);
insert into Revisores values ('luichan@ucm.es', 5);
insert into Revisores values ('jhon_hutten@hotmail.ge', 2);
insert into Revisores values ('alScot@hotmail.com', 1);
insert into Revisores values ('felSanto@gmail.com', 3);
insert into Revisores values ('loneMc@hotmail.com', 4);
insert into Revisores values ('soficas@gmail.es', 3);

/*---------------------------SESIONES--------------------------------*/

insert into Sesiones values (1, '23-Febrero-2012', 'Sistemas Operativos', 'atn_perz@hotmail.es');
insert into Sesiones values (2, '23-Febrero-2012', 'Bases de Datos', 'luichan@ucm.es');
insert into Sesiones values (1, '17-Mayo-2012', 'Redes', 'atn_perz@hotmail.es');
insert into Sesiones values (2, '17-Mayo-2012', 'Inteligencia Artificial', 'atn_perz@hotmail.es');
insert into Sesiones values (3, '23-Febrero-2012', 'Programación Declarativa', 'loneMc@hotmail.com');
insert into Sesiones values (1, '16-Diciembre-2012', 'Investigacion Operativa', 'soficas@gmail.es');
/*-----------------------------ARTICULOS-------------------------------*/

insert into Articulos values (31, 'Resumen de ', 'Informatica', 'Operando con sistemas', 1, 1, '23-Febrero-2012' );
--insert into Articulos values (22, 'Resumen de ', 'Informatica', 'Memorias', 1, 1, '23-Febrero-2012' );
--insert into Articulos values (44, 'Resumen de ', 'Informatica', 'Kernel de Linux' , 1, 1,  '23-Febrero-2012' );
insert into Articulos values (66, 'Resumen de ', 'Informatica', 'Declarando Objetos', 1, 2, '23-Febrero-2012' );
insert into Articulos values (40, 'Resumen de ', 'Informatica', 'Entidad Relación', 1, 3, '23-Febrero-2012' );
insert into Articulos values (33, 'Resumen de ', 'Informatica', 'Heuríticas',  1, 1,'17-Mayo-2012' );
insert into Articulos values (20, 'Resumen de ', 'Informatica', 'TCPIP', 1, 2, '17-Mayo-2012' );
insert into Articulos values (9, 'Resumen de ', 'Informatica', 'Operativa', 1, 1, '16-Diciembre-2012' );

/*---------------------------ASISTENTES-----------------------------------*/

insert into Asistentes values ('luichan@ucm.es', 1234, 'Estudiante', 0, 31, 1);
--insert into Asistentes values ('atn_perz@hotmail.es', 7589, 'Regular', 1, 22, 0);
--insert into Asistentes values ('pepu@hotmail.it', 5014, 'Estudiante', 0, 44, 1);
insert into Asistentes values ('loneMc@hotmail.com', 2204, 'Regular', 0, 0, 2);
insert into Asistentes values ('felSanto@gmail.com', 8695, 'Estudiante', 1, 66, 0);
insert into Asistentes values ('lourdes_Sh@hotmail.com', 3333, 'Estudiante', 1, 40, 0);
insert into Asistentes values ('soficas@gmail.es', 5698, 'Regular', 0, 33, 0);
insert into Asistentes values ('dorga@gmail.com', 7014, 'Estudiante', 1, 20, 2);
insert into Asistentes values ('siuljim@hotmail.com', 8590, 'Estudiante', 0, 0 , 0);
insert into Asistentes values ('carmun@hotmail.com', 4521, 'Estudiante', 0, 0, 2);
insert into Asistentes values ('zafiro@gmail.com', 4658, 'Regular', 1, 0, 0);
insert into Asistentes values ('erkan@hotmail.com', 6589, 'Estudiante', 0, 0, 3);
insert into Asistentes values ('rudolfHunt@msn.com', 5555, 'Estudiante', 0, 9, 1);
insert into Asistentes values ('carGallego@gmai.es', 9541, 'Regular', 1, 20, 1);
insert into Asistentes values ('lasa@estumail.ucm.es', 4421, 'Estudiante', 1, 0, 2);


/*---------------------------ESCRIBE---------------------------------*/

insert into Escribe values ('atn_perz@hotmail.es', 31);
--insert into Escribe values ('soficas@gmail.es', 22);
insert into Escribe values ('ner_lla@hotmail.com', 9);
insert into Escribe values ('she_gon@ucm.es', 40);
insert into Escribe values ('rudolfHunt@msn.com', 20);
insert into Escribe values ('lourdes_Sh@hotmail.com', 9);
insert into Escribe values ('adebar@yahoo.com', 33);
insert into Escribe values ('carGallego@gmai.es', 66);
--insert into Escribe values ('pepu@hotmail.it', 44);
--insert into Escribe values ('dorga@gmail.com', 44);
insert into Escribe values ('luichan@ucm.es', 31);
insert into Escribe values ('jhon_hutten@hotmail.ge', 1);
insert into Escribe values ('alScot@hotmail.com', 20);
--insert into Escribe values ('lu_fer@hotmail.com', 22);


/*--------------------------REVISA----------------------------------*/

insert into Revisan values ('atn_perz@hotmail.es', 31, 3, 2);
/*insert into Revisan values ('ner_lla@hotmail.com', 22, );
insert into Revisan values ('adebar@yahoo.com', 4);
insert into Revisan values ('dorga@gmail.com', 1);
insert into Revisan values ('luichan@ucm.es', 5);
insert into Revisan values ('jhon_hutten@hotmail.ge', 2);
insert into Revisan values ('alScot@hotmail.com', 1);
insert into Revisan values ('felSanto@gmail.com', 3);
insert into Revisan values ('loneMc@hotmail.com', 4);
insert into Revisan values ('soficas@gmail.es', 3);*/

/*-----------------------PROCEDIMIENTOS--------------------------------*/

CREATE OR REPLACE PROCEDURE Experto_moderador 
begin
	open cur_correos_validos
	loop 
		fetch next from cur_correo_revisor
		exit when cur_correo_revisor%NOTFOUND;
		if (cur_correo_revisor == cur_correo_asistente && cur_correo_revisor != cur_correo_articulo) then
			
		end if;
	

DECLARE
(correo_experto in varchar2
, orden_sesion in number
, fecha_sesion in date
, correo_articulo in varchar2
, cursor correo 
is 

select correo_e from Revisores)
end;

--BEGIN
  select correo_e, orden, fecha into correo_experto, orden_sesion, fecha_sesion
  from Sesiones;
  
  select correo_e into correo_articulo
  from Articulos;
  
  /*exception
	when no data found then
	dbms_output.put_line ('No se encontraron datos');*/
  
  
END;

/*type listado_asistentes  is record
(
nombre varchar2(36),
correo_e varchar2 (36),--¿?
cost_tarifa number (10,2),
cost_tickets number (10,2),
cost_descuento number (10,2),
cost_total number (10,2)
)*/


/*-4) Implementar un procedimiento que reciba como parametros el importe de la tarifa de estudiante, la tarifa regular,
el precio del ticket extra para la cena de gala y el descuento que se aplica a los socios de la institución organizadora y 
genere un listado con el nombre de cada sistente, el coste de cada concepto (tarifa, tickets y descuento de socio) y total 
a pagar. Ordénalo por nombre de asistente*/
create or replace procedure listado_costes
(v_imp_estudiante in number, v_imp_regular in number, v_prec_ticket_extra in number, v_descuento in number)
 --v_asistentes out listado_asistente%ROWTYPE
/*v_nombre_asistente out varchar2, v_coste_tarifa out number, v_coste_tickets out number, v_coste_descuento out number, total out number*/
is
declare
	cursor cur_asistentes is
	select nombre, numero_socio, tarifa, tickets 
	from Asistentes
	group by nombre

	pre_socio number(10,2):=0;
	pre_tarifa number(10,2):=0;
	pre_tickets number (10,2):=0;
	pre_descuento number (10,2):=0;
	pre_total number (10,2):=0;
	v_nombre varchar2(36);
	v_socio number (36);
	v_tarifa varchar2(36);
	v_tickets number(36);

begin 
	open cur_asistentes;
	loop 
		fetch cur_asistentes into (v_nombre, v_socio, v_tarifa, v_tickets)
		if ( v_socio != 0) then
			pre_descuento := v_descuento;
		end if;
		if ( v_atrifa == 'Estudiante') then
			pre_tarifa := v_imp_estudiante;
		else
			pre_tafifa := v_imp_regular;
		end if;
		pre_tickets := v_tickets * v_pre_tickets_extra;
		pre_total := pre_tarifa - pre_descuento + pre_tickets;
		dbms_output.put_line ( 'Nombre: ' ||cur_asistentes.nombre || ', Tarifa; ' || pre_tarifa ||', Precio ticekts extra: '
								|| pre_tickets || ', Descuento: '|| pre_descuento || ', Total: ' || pre_total) 
		--insert into v_asistentes values ( v_nombre, cur_asistentes.correo_e, pre_tarifa, pre_tickets, pre_descuento, pre_total);
		exit when cur_asistentes%NOTFOUND;
	end loop;
	/*select *
	from v_asistentes
	order by nombre*/
	close cur_asistintes;

end;
end listado_costes;


/*-5) Implementar un procedimiento que reciba como parámetro un valor que establece la puntuación mínima que requiere 
un artículo para ser aceptado para su presentación en el congreso. Dicha puntuación se calcula sumando los productos de los puntos asignados 
por un revisor y su nivel de conocimiento y dividiendo el total por el número de revisores del artículo. De acuerdo ca la puntuación obtenida 
y el límite establecido se actualizará la decisión del artículo como aceptado o rechazado. Así mismo el procedimiento mostrará la relación de los
artículos (número y título), la puntuación obtenida y la decisión asignada.*/
create or replace procedure decision_articulo
(v_puntuacion_minima in number)
is
declare
	cursor cur_decision is
	select numero, titulo, nivel, puntuacion 
	from Articulos natural join Revisan
	--group by nombre
	v_num number (36);
	v_titulo varchar2(36);
	v_nivel number(36);
	v_punt number(36);
	--r_decision cur_decision%ROWTYPE;
	v_aux number(36);
	media number (36,2);
	v_cont number (10) :=0;
	v_acept varchar2 (36);
	
begin 
	open cur_decision;
	/*select numero 
	into v_aux
	from cur_decision*/
	fetch cor_decision into ( v_num, v_titulo, v_nivel, v_punt);
	v_aux := v_num;
	loop
		--fetch cor_decision into ( v_num, v_titulo, v_nivel, v_punt);
		while ( v_aux == v_num)loop
			v_cont:= v_cont + 1;
			media := (v_nivel + v_punt) / v_cont;
			fetch cor_decision into ( v_num, v_titulo, v_nivel, v_punt);
		end loop
		if ( media >= v_puntuacion_minima) then
			v_acept := 'Aceptado';
		else
			v_acept := 'Rechazado';
		end if;
		dbms_output.put_line ( 'Número: ' || v_num ||', Título: ' || v_titulo || ', Puntuación: ' || media || ', Decisión: ' || v_acept);
		v_aux := v_num;
		exit when cur_decision%NOTFOUND;
	end loop;
end;

/*-6) Implementar un trigger que cree un conflicto de interés cuando se registre un artículo en el que uno de los 
autores sea a su vez revisor en la conferencia.*/
create or replace trigger conflicto_interes
 --Se realiza el trigger despues de insertar en Revisan, para ver si la persona insertada puede, efectivamente, revisar
after insert
on Revisan
when ( Escribe.numero == Revisan.numero)
begin 
	--Comprueba si el correo del escritor y del revisor de un articulo coincide
	if ( Escribe.correo_e == Revisan.correo_e) 
		-- si coincide se añade a la lista de conflicto de interes
		insert into ConflictosInteres values ( Escribe.correo_e, Escribe.numero);
		--y se elimina de la lista de revisan
		delete (correo_e, numero, nivel, puntuacion)
		from Revisan
		where (Revisan.correo_e == Escribe.correo_e and Revisan.numero == Escribe.numero)
		
	end if;
end;