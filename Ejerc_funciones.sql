drop table cursos cascade constraints; 
drop table inscripciones cascade constraints;
drop table cuotas cascade constraints;

create sequence cursoSCC  MINVALUE 1 START WITH 1
   INCREMENT BY 1 NOCACHE;

create table cuotas (
 nivel varchar(20) DEFAULT 'Principiante' NOT NULL
                  CONSTRAINT Nivel_CK CHECK (nivel IN ('Principiante','Intermedio', 'Avanzado')),
 tipo  varchar(10) DEFAULT 'Regular' NOT NULL
                  CONSTRAINT Tip_CK CHECK (tipo IN ('Regular','Intensivo', 'Particular')),       
importe  NUMBER(6,2) DEFAULT 0,
primary key (nivel,tipo));

create table cursos (
 codigo char(8) PRIMARY KEY, 
 nombre varchar(50) NOT NULL,
 nivel varchar(20) NOT NULL,
 tipo  varchar(10) NOT NULL,
 horas NUMBER(3) NOT NULL,
 plazas NUMBER(3) DEFAULT 12,
 foreign key (nivel,tipo) REFERENCES cuotas);

create table inscripciones (
 codigo char(8) NOT NULL,
 id_participante varchar(10) NOT NULL,
 importe NUMBER(6,2) DEFAULT 0,
 ant_alumno NUMBER(1) DEFAULT 0
                 CONSTRAINT alumno_CK CHECK (ant_alumno IN (0,1)),
 primary key(codigo,id_participante),
 foreign key (codigo) references cursos);

insert into cuotas values('Principiante', 'Regular', 675);
insert into cuotas values('Principiante', 'Intensivo', 460);
insert into cuotas values('Principiante', 'Particular', 50);
insert into cuotas values('Intermedio', 'Intensivo', 500);
insert into cuotas values('Intermedio', 'Regular', 800);
insert into cuotas values('Intermedio', 'Particular', 60);
insert into cuotas values('Avanzado', 'Intensivo', 750);
insert into cuotas values('Avanzado', 'Regular', 1000);
insert into cuotas values('Avanzado', 'Particular', 90);


create or replace
procedure "LOADEVENTS" is

begin

delete from cursos;

FOR curso_ingles in 1..5 LOOP

insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Principiante', 'Regular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Principiante', 'Intensivo', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Principiante', 'Particular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Intermedio', 'Regular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Intermedio', 'Intensivo', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Intermedio', 'Particular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Avanzado', 'Regular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Avanzado', 'Intensivo', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Ingl�s '||cursoSCC.CURRVAL,'Avanzado', 'Particular', 10+ (2*cursoSCC.CURRVAL));

END LOOP;

end;



/



/
create or replace
function "haycupo"
(curso in char) return boolean
is
numeroPlazas cursos.plazas%type;
numeroAlumnosInscritos integer := 0;
existeCurso boolean := false;
begin
  select plazas into numeroPlazas
  from cursos
  where codigo = curso;
  existeCurso := true;
  
  select count(id_participante) into numeroAlumnosInscritos 
  from cursos natural join inscripciones
  group by codigo;
  
  if(numeroPlazas>numeroAlumnosInscritos) then
    return true;
  else
    return false;
  end if;
  
  Exception
  when no_data_found then
    if existeCurso then
       return true;
    else
       return false;
  end if;

end;
/