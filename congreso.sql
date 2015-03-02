DROP TABLE Participante CASCADE CONSTRAINTS;
DROP TABLE Revisor CASCADE CONSTRAINTS;
DROP TABLE Autor CASCADE CONSTRAINTS;
DROP TABLE Asistente CASCADE CONSTRAINTS;
DROP TABLE revision CASCADE CONSTRAINTS;
DROP TABLE Articulo CASCADE CONSTRAINTS;
DROP TABLE Palabra_clave CASCADE CONSTRAINTS;
DROP TABLE autoria CASCADE CONSTRAINTS;
DROP TABLE Sesion CASCADE CONSTRAINTS;
DROP TABLE conflicto_Interes CASCADE CONSTRAINTS;


CREATE TABLE Participante
  (
    email      VARCHAR2(30) CONSTRAINT par_PK PRIMARY KEY,
    Nombre     VARCHAR2(64),
    Afiliacion VARCHAR2(35),
    Pais       VARCHAR2(30)
  );
  
CREATE TABLE Revisor
  (
    email VARCHAR2(30) PRIMARY KEY,
    Years NUMBER(2),
    FOREIGN KEY (email) REFERENCES Participante (email) ON
  DELETE CASCADE
  );
  
CREATE TABLE Autor
  (
    email  VARCHAR2(30) PRIMARY KEY,
    Doctor CHAR(2) DEFAULT 'NO',
    FOREIGN KEY (email) REFERENCES Participante (email) ON
  DELETE CASCADE
  );
  
CREATE TABLE Asistente
  (
    email       VARCHAR2(30) PRIMARY KEY,
    Vegetariano CHAR(2) DEFAULT 'NO',
    Tarifa      CHAR(3),
    N_Socio     NUMBER(8),
    Tickets     NUMBER(2),
    FOREIGN KEY (email) REFERENCES Participante (email) ON DELETE CASCADE
  );
  
    
CREATE TABLE Sesion
  (
    Dia DATE,
    NumOrden NUMBER(2),
    Titulo VARCHAR2(60) ,
    emailModerador VARCHAR(30),
    CONSTRAINT Ses_PK PRIMARY KEY(Dia, NumOrden),
    FOREIGN KEY (emailModerador) REFERENCES Revisor(email) on delete set null
  );
  
CREATE TABLE Articulo
  (
    Titulo VARCHAR2(70),
    IdNum NUMBER(7) CONSTRAINT art_PK PRIMARY KEY,
    Resumen VARCHAR2(140),
    emailExpo VARCHAR2(30),
    DiaExpo DATE,
    NumOrdenExpo NUMBER(2),
    FOREIGN KEY (emailExpo) REFERENCES Asistente (email) on delete cascade,
    FOREIGN KEY (DiaExpo,NumOrdenExpo) REFERENCES Sesion (Dia,NumOrden) on delete cascade
  );
CREATE TABLE Palabra_Clave
  (
    Palabra VARCHAR2(15) CONSTRAINT pc_PK PRIMARY KEY,
    numArticulo NUMBER(7),
    FOREIGN KEY (numArticulo) REFERENCES Articulo (IdNum) on delete cascade
  );
    
CREATE TABLE Conflicto_Interes
  (
    emailRevisor VARCHAR2(30),
    NumArticulo NUMBER(7),
    FOREIGN KEY (emailRevisor) REFERENCES Revisor (email) on delete cascade,
    FOREIGN KEY (numArticulo) REFERENCES Articulo (IdNum) on delete cascade
  );
  
CREATE TABLE Autoria
  (
    emailAutor VARCHAR2(30),
    NumArticulo NUMBER(7),
    FOREIGN KEY (emailAutor) REFERENCES Autor (email) on delete cascade,
    FOREIGN KEY (numArticulo) REFERENCES Articulo (IdNum) on delete cascade
  );
  
CREATE TABLE Revision
  (
    emailRevisor VARCHAR2(30),
    NumArticulo NUMBER(7),
    Conocimiento NUMBER(1) default 2,
    Puntuacion NUMBER(1),
    FOREIGN KEY (emailRevisor) REFERENCES Revisor (email) on delete cascade,
    FOREIGN KEY (numArticulo) REFERENCES Articulo (IdNum) on delete cascade
  );

/*PARTICIPANTES*/
INSERT INTO participante VALUES('JuanPerez@mail.com', 'Juan Perez', 'Instituto A', 'España'); 
INSERT INTO participante VALUES('JoseCuervo@mail.com','Jose Cuervo','Instituto B','Méjico');
INSERT INTO participante VALUES('PabloPuebla@mail.com','Pablo Puebla','Instituto C', 'Panamá');
INSERT INTO participante VALUES('MariaKahn@mail.com','Maria Kahn','Universidad B','Alemania');
INSERT INTO participante VALUES('LuisaCardenas@mail.com','Luisa Cardenas','Universidad C','España');

INSERT INTO participante VALUES('IgnacioSanchez@mail.com','Ignacio Sanchez','Instituto D','España');
INSERT INTO participante VALUES('PedroAlmeida@mail.com','Pedro Almeida','Universiadad A','Portugal');
INSERT INTO participante VALUES('AdaLovelace@mail.com','Ada Lovelace','Universidad D','Inglaterra');
INSERT INTO participante VALUES('JavierLopez@mail.com','Javier Lopez','Universidad E','Argentinca');
INSERT INTO participante VALUES('AnneLeBlanc@mail.com','Anne LeBlanc','Universidad A','Francia');
INSERT INTO participante VALUES('RichardStallman@mail.com','Richard Stallman','MIT','Estados Unidos');
INSERT INTO participante VALUES('LinusTorvalds@mail.com','Linus Torvalds ','Universidad de Helsinki','Finlandia');
INSERT INTO participante VALUES('JuanaMarquez@mail.com','Juana Márquez','Universidad D','Colombia');
INSERT INTO participante VALUES('JamesHetfield@mail.com','James Hetfield','Escuela A','Estados Unidos');
INSERT INTO participante VALUES('RamonRamos@mail.com','Ramon Ramos','Universidad Complutense','España');

INSERT INTO participante VALUES('IreneAlvarez@mail.com','Irene Alvarez','Universidad Politecnica','España');
INSERT INTO participante VALUES('AlvaroAlfaro@mail.com','Alvaro Alfaro','Universidad Complutense','España');
INSERT INTO participante VALUES('RobertoCarlos@mail.com','Roberto Carlos','Universidad 1','Brasil');
INSERT INTO participante VALUES('AlejandroToledo@mail.com','Alejandro Toledo','Universidad Complutense','Perú');
INSERT INTO participante VALUES('CarlosMolina@mail.com','Carlos Molina','Universidad CarlosIII','España');
INSERT INTO participante VALUES('MiguelRodriguez@mail.com','Miguel Rodriguez','Universidad Complutense','España');
INSERT INTO participante VALUES('RaquelCastellano@mail.com','Raquel Castellano','Universidad Complutense','España');
INSERT INTO participante VALUES('IvanCastro@mail.com','Ivan Castro','Universidad Complutense','España');
INSERT INTO participante VALUES('CarmenAlonso@mail.com','Carmen Alonso','Universidad Complutense','España');
INSERT INTO participante VALUES('RosaSalinas@mail.com','Rosa Salinas','Universidad Complutense','España');

/*AUTORES*/
INSERT INTO autor VALUES('IgnacioSanchez@mail.com','NO');
INSERT INTO autor VALUES('PedroAlmeida@mail.com','NO');
INSERT INTO autor VALUES('AdaLovelace@mail.com', 'SI');
INSERT INTO autor VALUES('AnneLeBlanc@mail.com','NO');
INSERT INTO autor VALUES('RichardStallman@mail.com','SI');
INSERT INTO autor VALUES('LinusTorvalds@mail.com','SI');
INSERT INTO autor VALUES('JuanaMarquez@mail.com','NO');
INSERT INTO autor VALUES('JamesHetfield@mail.com','SI');

INSERT INTO autor VALUES('RamonRamos@mail.com','SI');
INSERT INTO autor VALUES('IreneAlvarez@mail.com','SI');
INSERT INTO autor VALUES('AlvaroAlfaro@mail.com','SI');
INSERT INTO autor VALUES('JavierLopez@mail.com','NO');


/*REVISORES*/
INSERT INTO revisor VALUES('RamonRamos@mail.com',3);
INSERT INTO revisor VALUES('IreneAlvarez@mail.com',0);
INSERT INTO revisor VALUES('AlvaroAlfaro@mail.com',5);
INSERT INTO revisor VALUES('JavierLopez@mail.com',3);

INSERT INTO revisor VALUES('JuanPerez@mail.com',1); 
INSERT INTO revisor VALUES('JoseCuervo@mail.com',1);
INSERT INTO revisor VALUES('PabloPuebla@mail.com',0);

/*ASISTENTES*/
INSERT INTO asistente VALUES('IreneAlvarez@mail.com','NO','EST',NULL,1);
INSERT INTO asistente VALUES('AlvaroAlfaro@mail.com','SI','REG', 55555555,0);
INSERT INTO asistente VALUES('RobertoCarlos@mail.com','NO','REG',66666666,0);
INSERT INTO asistente VALUES('AlejandroToledo@mail.com','SI','EST',77777777,3);
INSERT INTO asistente VALUES('CarlosMolina@mail.com','NO','EST',NULL,1);
INSERT INTO asistente VALUES('MiguelRodriguez@mail.com','NO','EST',NULL,0);
INSERT INTO asistente VALUES('RaquelCastellano@mail.com','NO','REG',88888888,0);
INSERT INTO asistente VALUES('IvanCastro@mail.com','SI','EST',11111111,0);
INSERT INTO asistente VALUES('CarmenAlonso@mail.com','NO','EST',NULL, 1);
INSERT INTO asistente VALUES('RosaSalinas@mail.com','NO','REG',NULL, 2);

INSERT INTO asistente VALUES('JuanPerez@mail.com','NO','REG', 22222222, 0);
INSERT INTO asistente VALUES('JoseCuervo@mail.com','NO','REG', 33333333, 0);

INSERT INTO asistente VALUES('RamonRamos@mail.com','NO','REG', 44444444, 1);

/*SESIONES*/

INSERT INTO sesion VALUES('1-FEB-2013', 1, 'Sesión 1/Dia 1', 'JuanPerez@mail.com');
INSERT INTO sesion VALUES('1-FEB-2013', 2, 'Sesión 2/Dia 1', 'JoseCuervo@mail.com');
INSERT INTO sesion VALUES('1-FEB-2013', 3, 'Sesión 3/Dia 1', 'RamonRamos@mail.com');

INSERT INTO sesion VALUES('2-FEB-2013', 1, 'Sesión 1/Dia 2', 'JuanPerez@mail.com');
INSERT INTO sesion VALUES('2-FEB-2013', 2, 'Sesión 2/Dia 2', 'JoseCuervo@mail.com');
INSERT INTO sesion VALUES('2-FEB-2013', 3, 'Sesión 3/Dia 2', 'RamonRamos@mail.com');

INSERT INTO sesion VALUES('3-FEB-2013', 1, 'Sesión 1/Dia 3', 'JuanPerez@mail.com');
INSERT INTO sesion VALUES('3-FEB-2013', 2, 'Sesión 2/Dia 3', 'JoseCuervo@mail.com');
INSERT INTO sesion VALUES('3-FEB-2013', 3, 'Sesión 3/Dia 3', 'RamonRamos@mail.com');

/*ARTICULOS*/

INSERT INTO articulo VALUES('Números de Bernoulli', 0000000, 'resumen articulo 1', 'IreneAlvarez@mail.com', '1-FEB-2013', 1);
INSERT INTO articulo VALUES('Software Libre', 1111111, 'Resumen articulo 2', 'AlvaroAlfaro@mail.com', '1-FEB-2013', 2);


