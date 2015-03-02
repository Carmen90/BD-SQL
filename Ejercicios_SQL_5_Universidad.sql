drop table Professors cascade constraints;
drop table Depts cascade constraints;
drop table WorkDept cascade constraints;
drop table Projects cascade constraints;
drop table Graduates cascade constraints;
drop table WorkProj cascade constraints;
drop table AsistProj cascade constraints;


CREATE TABLE Professors
  (
    prof_ssn CHAR(10),
    name     VARCHAR(64),
    date_arrival DATE,
    rank       NUMBER,
    speciality CHAR(64),
    PRIMARY KEY (prof_ssn)
  );
CREATE TABLE Projects
  (
    pid     CHAR(15),
    sponsor CHAR(32),
    start_date DATE,
    end_date DATE,
    budget NUMBER,
    ip CHAR(10),
    FOREIGN KEY (ip) REFERENCES Professors,
    PRIMARY KEY (pid)
  );
CREATE TABLE WorkProj
  (
    pid      CHAR(15),
    prof_ssn CHAR(10),
    PRIMARY KEY (pid, prof_ssn),
    FOREIGN KEY (prof_ssn) REFERENCES Professors,
    FOREIGN KEY (pid) REFERENCES Projects
  );
CREATE TABLE Depts
  (
    dno   NUMBER,
    dname CHAR(64),
    head  CHAR(10) UNIQUE,
    PRIMARY KEY (dno),
    FOREIGN KEY (head) REFERENCES Professors
  );
CREATE TABLE WorkDept
  (
    dno      INTEGER,
    prof_ssn CHAR(10),
    pc_time  INTEGER,
    PRIMARY KEY (dno, prof_ssn),
    FOREIGN KEY (prof_ssn) REFERENCES Professors,
    FOREIGN KEY (dno) REFERENCES Depts
  );
CREATE TABLE Graduates
  (
    grad_ssn CHAR(10),
    birth_date DATE,
    grad_name VARCHAR(64),
    studies CHAR(6) check (studies in ('MASTER', 'DOCTOR')), 
    senior_ssn CHAR(10), 
    PRIMARY KEY (grad_ssn), 
FOREIGN KEY (senior_ssn) REFERENCES Graduates (grad_ssn,     CHECK ((studies ='MASTER'and senior_ssn is NOT NULL) or (studies ='DOCTOR' and senior_ssn is NULL)) );
 
CREATE TABLE AsistProj
    (
      grad_ssn CHAR(10),
      pid      CHAR(15),
      PRIMARY KEY (grad_ssn, pid),
      FOREIGN KEY (grad_ssn) REFERENCES Graduates,
      FOREIGN KEY (pid) REFERENCES Projects
    );
  insert
  into Professors values
    (
      '012345SR',
      'Antonio Soto Ramal',
      TO_DATE('01/12/1990'),
      1,
      'Analisis Numerico'
    );
  insert
  into Professors values
    (
      '067892DE',
      'Marta Morales Sanchis',
      TO_DATE('01/12/1986'),
      1,
      'Programación declarativa'
    );
  insert
  into Professors values
    (
      '029478WE',
      'Alicia Parra Toro',
      TO_DATE('01/12/2004'),
      2,
      'Bases de Datos'
    );
  insert
  into Professors values
    (
      '004388BH',
      'Alberto Prado Motos',
      TO_DATE('01/12/2000'),
      2,
      'Deducción Automatica'
    );
  insert
  into Professors values
    (
      '053771JI',
      'Nieves Tejedor Lorenzo',
      TO_DATE('01/12/1995'),
      2,
      'Software Testing'
    );
  insert
  into Projects values
    (
      'TINN-092011',
      'Ministerio de Ciencia y Tecn.',
      TO_DATE('01/01/2009'),
      TO_DATE('01/01/2012'),
      132.000,
      '012345SR'
    );
  insert
  into Projects values
    (
      'TINN-122009',
      'Ministerio de Ciencia y Tecn.',
      TO_DATE('01/01/2006'),
      TO_DATE('01/01/2014'),
      320.000,
      '067892DE'
    );
  insert
  into Projects values
    (
      'ULST-0145',
      'Universidad Lo Sabemos Todo',
      TO_DATE('01/01/2010'),
      TO_DATE('01/01/2011'),
      22.000,
      '012345SR'
    );
  insert into WorkProj values
    ('TINN-092011','053771JI'
    );
  insert into WorkProj values
    ('TINN-092011','012345SR'
    );
  insert into WorkProj values
    ('TINN-092011','029478WE'
    );
  insert into WorkProj values
    ('TINN-122009','012345SR'
    );
  insert into WorkProj values
    ('TINN-122009','067892DE'
    );
  insert into WorkProj values
    ('TINN-122009','029478WE'
    );
  insert into WorkProj values
    ('TINN-122009','004388BH'
    );
  insert into WorkProj values
    ('ULST-0145','012345SR'
    );
  insert into WorkProj values
    ('ULST-0145','004388BH'
    );
  insert into Depts values
    (1, 'Departamento de Ciencias Aplicadas','053771JI'
    );
  insert
  into Depts values
    (
      2,
      'Departamento de Arquitectura de Computadores',
      '012345SR'
    );
  insert
  into Depts values
    (
      3,
      'Departamento de Inteligencia Artificial',
      '067892DE'
    );
  insert into WorkDept values
    (1,'053771JI',100
    );
  insert into WorkDept values
    (2,'012345SR',100
    );
  insert into WorkDept values
    (3,'067892DE',100
    );
  insert into WorkDept values
    (1,'029478WE',75
    );
  insert into WorkDept values
    (2,'029478WE',25
    );
  insert into WorkDept values
    (2,'004388BH',45
    );
  insert into WorkDept values
    (3,'004388BH',55
    );

  insert
  into Graduates values
    (
      'P457656R',
       TO_DATE('15/07/1987'),
      'Antonio Diaz Fuentes',
      'DOCTOR',
      null
    );
  insert
  into Graduates values
    (
      'G465668L',
       TO_DATE('10/03/1985'),
      'Soledad Alvarez Castro',
      'DOCTOR',
      null
    );
  insert
  into Graduates values
    (
      'M757456O',
       TO_DATE('08/09/1985'),
      'Alberto de la Fuente',
      'DOCTOR',
      null
    );
  insert
  into Graduates values
    (
      'G234556R',
       TO_DATE('21/06/1986'),
      'Marisa Lara Torres',
      'MASTER',
      'M757456O'
    );
  insert
  into Graduates values
    (
      'F654365U',
       TO_DATE('01/02/1989'),
      'Francisco Machado Rios',
      'MASTER',
      'P457656R'
    );
  
  insert
  into Graduates values
    (
      'W756465R',
       TO_DATE('25/11/1992'),
      'Clara Salinas Diez',
      'MASTER',
      'G465668L'
    );
  insert
  into Graduates values
    (
      'G764346Y',
       TO_DATE('11/03/1992'),
      'Jose Perez Mota',
      'MASTER',
      'P457656R'
    );
  
  insert into AsistProj values
    ('G234556R','TINN-092011'
    );
  insert into AsistProj values
    ('F654365U','TINN-092011'
    );
  insert into AsistProj values
    ('M757456O','TINN-092011'
    );
  insert into AsistProj values
    ('G465668L','TINN-122009'
    );
  insert into AsistProj values
    ('G764346Y','TINN-122009'
    );
  insert into AsistProj values
    ('P457656R', 'TINN-122009'
    );
  insert into AsistProj values
    ('W756465R', 'ULST-0145'
    );
  insert into AsistProj values
    ('G465668L', 'ULST-0145'
    );