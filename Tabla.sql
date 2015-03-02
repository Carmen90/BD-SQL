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

create table Personas
(nombre varchar2(36),
afiliacion varchar2(36),
correo_e varchar2(36) primary key,
pais varchar2(36)
);

create table Autores
(CORREO_E VARCHAR2(36) PRIMARY KEY,
titulo number(1),-- check( titulo = 0 || titulo = 1),-- 0 no 1 si
foreign key(correo_e) references Personas
);

create table Revisores
(correo_e varchar2(36) primary key,
numero_años number(3),
foreign key(correo_e) references Personas
);

create table Sesiones
(ORDEN NUMBER(3),
fecha date,
titulo_ses varchar2(36),
correo_e varchar2(36),
primary key(orden, fecha),
foreign key (correo_e) references Revisores
);

create table Articulos
(numero number(36) primary key, 
resumen varchar2(36),
contenido varchar2(36),
TITULO VARCHAR2(36),
aceptado number(1),--check( aceptado = 0 || aceptado = 1), --0 no 1 si
orden number(3),
fecha date,
foreign key (orden, fecha) references Sesiones
);

create table Palabras_clave
(numero number(10),
palabras varchar2(36),
primary key (numero, palabras),
foreign key (numero) references Articulos
);

create table Asistentes
(correo_e varchar2(36) primary key,
numero_socio number(10),
TARIFA VARCHAR2(36),
vegetariano number(1),--check( vegetariano = 0 || vegetariano = 1),
numero number (10),
tickets number (3),
foreign key (numero) references Articulos,
foreign key(correo_e) references Personas
);

create table Escribe
(correo_e varchar2(36),
numero number(10),
primary key(correo_e, numero),
foreign key(correo_e) references Autores,
foreign key(numero) references Articulos
);

create table ConflictosInteres
(correo_e varchar2(36),
numero number(10),
primary key(correo_e, numero),
foreign key(correo_e) references Revisores,
foreign key(numero) references Articulos
);

create table Revisan
(CORREO_E VARCHAR2(36),
NUMERO NUMBER(10),
nivel number(1),-- CHECK( NIVEL = 1 || NIVEL = 2 || NIVEL = 3),
puntuacion number(1),-- check ( puntuacion = 2 || puntuacion = 1 || puntucion = -1 || puntucion = -2),
primary key(correo_e, numero),
foreign key(correo_e) references Revisores,
foreign key(numero) references Articulos
);

/*-----------------------------------PERSONAS-----------------------------------*/
                                  --Nombre,     Afiliavion,       Correo_e,         Pais
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
                             --Correo_e,        ¿titulo?
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
                               --Correo_e           nºaños
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
                          --orden  fecha            titulo                 correo_e
INSERT INTO SESIONES VALUES (1, '23-Febrero-2012', 'Sistemas Operativos', 'atn_perz@hotmail.es');
INSERT INTO SESIONES VALUES (2, '23-Febrero-2012', 'Bases de Datos', null);
insert into Sesiones values (1, '17-Mayo-2012', 'Redes', null);
insert into Sesiones values (2, '17-Mayo-2012', 'Inteligencia Artificial', null);
insert into Sesiones values (3, '23-Febrero-2012', 'Programación Declarativa', null);
insert into Sesiones values (1, '16-Diciembre-2012', 'Investigacion Operativa', null);

/*-----------------------------ARTICULOS-------------------------------*/
                            --numero resumen      contenido      titulo           ¿aceptado? orden fecha
insert into Articulos values (31, 'Resumen de ', 'Informatica', 'Operando con sistemas', 1, 1, '23-Febrero-2012' );
insert into Articulos values (22, 'Resumen de ', 'Informatica', 'Memorias', null, null, null );
INSERT INTO ARTICULOS VALUES (44, 'Resumen de ', 'Informatica', 'Kernel de Linux' , NULL, null,  NULL );
insert into Articulos values (66, 'Resumen de ', 'Informatica', 'Declarando Objetos', null, null, null );
insert into Articulos values (40, 'Resumen de ', 'Informatica', 'Entidad Relación', null, null, null );
insert into Articulos values (33, 'Resumen de ', 'Informatica', 'Heuríticas',  null, null,null );
insert into Articulos values (20, 'Resumen de ', 'Informatica', 'TCPIP', null, null, null);
insert into Articulos values (9, 'Resumen de ', 'Informatica', 'Operativa', null, null, null );

/*---------------------------ASISTENTES-----------------------------------*/
                              --Correo_e      num_socio  tarifa    ¿veg? num tickets 
insert into Asistentes values ('luichan@ucm.es', null, 'Estudiante', 0, 31, 1);
insert into Asistentes values ('atn_perz@hotmail.es', 7589, 'Regular', 1, 31, 0);
insert into Asistentes values ('pepu@hotmail.it', null, 'Estudiante', 0, 44, 1);
insert into Asistentes values ('loneMc@hotmail.com', 2204, 'Regular', 0, null, 2);
insert into Asistentes values ('felSanto@gmail.com', null, 'Estudiante', 1, 66, 0);
insert into Asistentes values ('lourdes_Sh@hotmail.com', 3333, 'Estudiante', 1, 40, 0);
insert into Asistentes values ('soficas@gmail.es', 5698, 'Regular', 0, 33, 0);
insert into Asistentes values ('dorga@gmail.com', 7014, 'Estudiante', 1, 20, 2);
insert into Asistentes values ('siuljim@hotmail.com', 8590, 'Estudiante', 0, null , 0);
insert into Asistentes values ('carmun@hotmail.com', 4521, 'Estudiante', 0, null, 2);
insert into Asistentes values ('zafiro@gmail.com', null, 'Regular', 1, null, 0);
insert into Asistentes values ('erkan@hotmail.com', 6589, 'Estudiante', 0, null, 3);
insert into Asistentes values ('rudolfHunt@msn.com', 5555, 'Estudiante', 0, 9, 1);
insert into Asistentes values ('carGallego@gmai.es', null, 'Regular', 1, 20, 1);
insert into Asistentes values ('lasa@estumail.ucm.es', 4421, 'Estudiante', 1, null, 2);


/*---------------------------ESCRIBE---------------------------------*/
                             --Correo_e           num
insert into Escribe values ('atn_perz@hotmail.es', 31);
insert into Escribe values ('soficas@gmail.es', 22);
insert into Escribe values ('ner_lla@hotmail.com', 9);
insert into Escribe values ('she_gon@ucm.es', 40);
insert into Escribe values ('rudolfHunt@msn.com', 20);
insert into Escribe values ('lourdes_Sh@hotmail.com', 9);
insert into Escribe values ('adebar@yahoo.com', 33);
insert into Escribe values ('carGallego@gmai.es', 66);
insert into Escribe values ('pepu@hotmail.it', 44);
insert into Escribe values ('dorga@gmail.com', 44);
INSERT INTO ESCRIBE VALUES ('luichan@ucm.es', 31);
insert into Escribe values ('jhon_hutten@hotmail.ge', 66);
insert into Escribe values ('alScot@hotmail.com', 20);
insert into Escribe values ('lu_fer@hotmail.com', 22);


/*--------------------------REVISA----------------------------------*/
                           --Correo_e             num niv puntuacion
INSERT INTO REVISAN VALUES ('atn_perz@hotmail.es', 31, 3, 2);
INSERT INTO REVISAN VALUES ('ner_lla@hotmail.com', 22,2,-1 );
INSERT INTO REVISAN VALUES ('adebar@yahoo.com', 9, 1, 2 );
INSERT INTO REVISAN VALUES ('dorga@gmail.com', 44, 2, 2);
INSERT INTO REVISAN VALUES ('luichan@ucm.es', 20, 1, 1);
INSERT INTO REVISAN VALUES ('jhon_hutten@hotmail.ge', 66, 3, -2);
INSERT INTO REVISAN VALUES ('alScot@hotmail.com', 9, 2, -1);
INSERT INTO REVISAN VALUES ('felSanto@gmail.com', 31, 2, 2);
INSERT INTO REVISAN VALUES ('loneMc@hotmail.com', 22, 1, -1);
insert into Revisan values ('soficas@gmail.es', 20, 2, 2);

/*-----------------------PROCEDIMIENTOS--------------------------------*/
/
create or replace 
procedure decision_articulo
(v_puntuacion_minima in number)
is
  
	cursor cur_decision is
	select titulo, numero, sum(puntuacion * nivel)/count(*) as media
	from articulos natural join revisan
	group by numero, titulo;
  
  v_aceptado varchar2(36) := null;
  TB constant varchar2(1):=CHR(9);

begin 
  dbms_output.put_line(rpad('Número',8,' ')||TB||rpad('Título',40,' ')||TB||rpad('Evaluación',12,' ')||TB||rpad('Decisión',10,' '));
  dbms_output.put_line(rpad('-',85,'-'));
  for r_decision in cur_decision loop
    if (r_decision.media < v_puntuacion_minima) then
      v_aceptado := 'Rechazado';
    else
      v_aceptado := 'Aceptado';
    end if;
    dbms_output.put_line ( rpad(r_decision.numero, 8,' ') ||TB || rpad(r_decision.titulo, 40, ' ') || TB||
                            rpad(r_decision.media, 12, ' ')|| TB ||rpad(v_aceptado, 10, ' '));
  end loop;
exception
when NO_DATA_FOUND or TOO_MANY_ROWS then
 dbms_output.put_line( 'Se ha detectado una excepción, o no no hay datos para el into o son demasiadas filas');
END DECISION_ARTICULO;
/
create or replace 
PROCEDURE LISTADO_COSTES 
(v_imp_estudiante in number, v_imp_regular in number, v_prec_ticket_extra in number, v_descuento in number)
is
--Creamos el cursor
	cursor cur_asistentes is
	select nombre, numero_socio, decode (tarifa, 'Estudiante', v_imp_estudiante
                                                          , v_imp_regular)  tarifas, 
                              decode (numero_socio, null, 0
                                                        , v_descuento)  descuentos,
                              (tickets*v_prec_ticket_extra) extra
	from asistentes natural join personas
	order by nombre;
	
	
  /*Declaramos la variable pre_total que vamos a utilizar en la ejecucion del procedimiento para ahorrarnos
  hacer todas las operaciones dentro del dbms*/
	pre_total number (10,2):=0;
  TB constant varchar2(1):=CHR(9);
   
BEGIN 
  dbms_output.put_line(rpad('Nombre',30,' ')||TB||rpad('Tarifa',10,' ')||TB||rpad('Extra',10,' ')||TB||rpad('Socio',10,' ')||TB||rpad('Total',10,' '));
  dbms_output.put_line(rpad('-',70,'-'));
  
  FOR r_asistentes IN cur_asistentes LOOP
  
		pre_total := r_asistentes.tarifas - r_asistentes.descuentos + r_asistentes.extra;
    
		dbms_output.put_line ( rpad(r_asistentes.nombre,30, ' ') || TB || rpad(r_asistentes.tarifas, 10, ' ') || TB
								|| rpad(r_asistentes.extra,10, ' ') || TB|| rpad(r_asistentes.descuentos, 10, ' ') || TB || rpad(pre_total, 10, ' '));
  end loop;
  exception
when NO_DATA_FOUND or TOO_MANY_ROWS then
 null;
END LISTADO_COSTES;
/

create or replace 
PROCEDURE EXPERTO_MODERADOR AS 
  
  --Hacemos el natural join con personas para poder ordenarlo por nombre tambien
  cursor cur_moderan is
  select s.fecha, s.orden, rev_as.correo_e, rev_as.nombre
  from Sesiones s , (select correo_e, nombre from  revisores natural join asistentes natural join personas)rev_as
  where rev_as.correo_e not in
        ( select correo_e 
          from articulos natural join escribe natural join sesiones
          where fecha = s.fecha and orden = s.orden)
  order by fecha, orden, nombre;
  
  
  TB constant varchar2(1):=CHR(9);
  
  --Utilizamos v_fecha y v_orden para que una misma fecha en un mismo orden solo se muestre una vez
  v_fecha date;
  v_orden number := 0;

begin
  dbms_output.put_line(rpad('Fecha',12,' ')||TB||rpad('Sesión',10,' ')||TB||rpad('Revisor',20,' '));
  dbms_output.put_line(rpad('-',50,'-')); 
  for r_modera in cur_moderan loop
    if ( r_modera.fecha != v_fecha or r_modera.orden != v_orden) then
       dbms_output.put_line (rpad( r_modera.fecha, 12, ' ')|| TB ||rpad(r_modera.orden, 10, ' ') || TB || rpad(r_modera.nombre, 20, ' '));
       v_fecha := r_modera.fecha;
       v_orden := r_modera.orden;
    else
      dbms_output.put_line (rpad( ' ', 12, ' ')|| TB ||rpad(' ', 10, ' ') || TB || rpad(r_modera.nombre, 20, ' '));
    end if;
  end loop;
exception
when NO_DATA_FOUND or TOO_MANY_ROWS then
 null;
END EXPERTO_MODERADOR;
/
create or replace 
trigger conflicto_interes
after insert on escribe
for each row

DECLARE 

existe_correo varchar2(36):= null;

BEGIN

select correo_e into existe_correo
from Revisores natural join sesiones
where correo_e =:new.correo_e;

if ( existe_correo is not null) then
insert into ConflictosInteres values (:new.correo_e,:new.numero);
end if;

exception
when NO_DATA_FOUND or TOO_MANY_ROWS then
 null;
END;
/