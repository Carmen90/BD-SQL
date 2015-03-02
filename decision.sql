drop drop table Personas cascade constraints;
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
titulo varchar2(36),
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
(numero number(36),
palabras varchar2(36),
primary key (numero, palabras),
foreign key (numero) references Articulos
);

create table Asistentes
(correo_e varchar2(36) primary key,
numero_socio number(36),
TARIFA VARCHAR2(36),
vegetariano number(1),--check( vegetariano = 0 || vegetariano = 1),
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
(CORREO_E VARCHAR2(36),
NUMERO NUMBER(36),
nivel number(1),-- CHECK( NIVEL = 1 || NIVEL = 2 || NIVEL = 3),
puntuacion number(1),-- check ( puntuacion = 2 || puntuacion = 1 || puntucion = -1 || puntucion = -2),
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

INSERT INTO SESIONES VALUES (1, '23-Febrero-2012', 'Sistemas Operativos', null);
INSERT INTO SESIONES VALUES (2, '23-Febrero-2012', 'Bases de Datos', null);
insert into Sesiones values (1, '17-Mayo-2012', 'Redes', null);
insert into Sesiones values (2, '17-Mayo-2012', 'Inteligencia Artificial', null);
insert into Sesiones values (3, '23-Febrero-2012', 'Programación Declarativa', null);
insert into Sesiones values (1, '16-Diciembre-2012', 'Investigacion Operativa', null);
/*-----------------------------ARTICULOS-------------------------------*/

insert into Articulos values (31, 'Resumen de ', 'Informatica', 'Operando con sistemas', null, null, null );
insert into Articulos values (22, 'Resumen de ', 'Informatica', 'Memorias', null, null, null );
INSERT INTO ARTICULOS VALUES (44, 'Resumen de ', 'Informatica', 'Kernel de Linux' , NULL, null,  NULL );
insert into Articulos values (66, 'Resumen de ', 'Informatica', 'Declarando Objetos', null, null, null );
insert into Articulos values (40, 'Resumen de ', 'Informatica', 'Entidad Relación', null, null, null );
insert into Articulos values (33, 'Resumen de ', 'Informatica', 'Heuríticas',  null, null,null );
insert into Articulos values (20, 'Resumen de ', 'Informatica', 'TCPIP', null, null, null);
insert into Articulos values (9, 'Resumen de ', 'Informatica', 'Operativa', null, null, null );

/*---------------------------ASISTENTES-----------------------------------*/

insert into Asistentes values ('luichan@ucm.es', 1234, 'Estudiante', 0, 31, 1);
insert into Asistentes values ('atn_perz@hotmail.es', 7589, 'Regular', 1, 22, 0);
insert into Asistentes values ('pepu@hotmail.it', 5014, 'Estudiante', 0, 44, 1);
insert into Asistentes values ('loneMc@hotmail.com', 2204, 'Regular', 0, null, 2);
insert into Asistentes values ('felSanto@gmail.com', 8695, 'Estudiante', 1, 66, 0);
insert into Asistentes values ('lourdes_Sh@hotmail.com', 3333, 'Estudiante', 1, 40, 0);
insert into Asistentes values ('soficas@gmail.es', 5698, 'Regular', 0, 33, 0);
insert into Asistentes values ('dorga@gmail.com', 7014, 'Estudiante', 1, 20, 2);
insert into Asistentes values ('siuljim@hotmail.com', 8590, 'Estudiante', 0, null , 0);
insert into Asistentes values ('carmun@hotmail.com', 4521, 'Estudiante', 0, null, 2);
insert into Asistentes values ('zafiro@gmail.com', 4658, 'Regular', 1, null, 0);
insert into Asistentes values ('erkan@hotmail.com', 6589, 'Estudiante', 0, null, 3);
insert into Asistentes values ('rudolfHunt@msn.com', 5555, 'Estudiante', 0, 9, 1);
insert into Asistentes values ('carGallego@gmai.es', 9541, 'Regular', 1, 20, 1);
insert into Asistentes values ('lasa@estumail.ucm.es', 4421, 'Estudiante', 1, null, 2);


/*---------------------------ESCRIBE---------------------------------*/

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

INSERT INTO REVISAN VALUES ('atn_perz@hotmail.es', 31, 3, 2);
INSERT INTO REVISAN VALUES ('ner_lla@hotmail.com', 22,NULL,NULL );
INSERT INTO REVISAN VALUES ('adebar@yahoo.com', 9, NULL, NULL );
INSERT INTO REVISAN VALUES ('dorga@gmail.com', 44, 2, 2);
INSERT INTO REVISAN VALUES ('luichan@ucm.es', 20, NULL, NULL);
INSERT INTO REVISAN VALUES ('jhon_hutten@hotmail.ge', 66, NULL, NULL);
INSERT INTO REVISAN VALUES ('alScot@hotmail.com', 9, NULL, NULL);
INSERT INTO REVISAN VALUES ('felSanto@gmail.com', 31, 2, 5);
INSERT INTO REVISAN VALUES ('loneMc@hotmail.com', 22, NULL, NULL);
insert into Revisan values ('soficas@gmail.es', 20, null, null);

/*-----------------------PROCEDIMIENTOS--------------------------------*/
