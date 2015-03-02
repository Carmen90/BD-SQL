drop table cursos cascade constraints; 
drop table inscripciones cascade constraints;
drop table cuotas cascade constraints;
drop sequence cursoSC;
create sequence cursoSC  MINVALUE 1 START WITH 1
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

insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Principiante', 'Regular', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Principiante', 'Intensivo', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Principiante', 'Particular', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Intermedio', 'Regular', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Intermedio', 'Intensivo', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Intermedio', 'Particular', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Avanzado', 'Regular', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Avanzado', 'Intensivo', 10+ (2*cursoSC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSC.NEXTVAL,'Curso de Inglés '||cursoSC.CURRVAL,'Avanzado', 'Particular', 10+ (2*cursoSC.CURRVAL));

END LOOP;
insert into inscripciones values('C21', 'PEPE', 675, 0);
end;

/
/*a. Crear una función que devuelva un valor boolean que indique si 
hay cupo en un curso para una nueva inscripción.*/
create or replace 
function haycupo
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
/*b. Crear un procedimiento para realizar una inscripción en un determinado curso en caso
de que haya cupo; en otro caso se mostrará un mensaje indicando la imposibilidad de realizarla.
El procedimiento recibirá 3 parámetros: código del curso, identificador del estudiante, y un valor
boolean que indique si es o no antiguo alumno. El importe de la inscripción corresponderá al indicado
en las cuotas en el caso de inscripción en cursos regulares o intensivos. 
La cuota de los cursos particulares corresponde a una hora de clase, por lo que la inscripción dependerá 
del número de horas asociado al curso. A los antiguos alumnos se les aplicará un descuento del 5% en todos los cursos.*/
create or replace 
procedure "realizaInscripcion"
(curso in char, idAlumno in varchar, alumnoAntiguo in boolean)
is
ImporteHallado number := 0;
antiguo number:= 0;
importeTotal number := 1;
begin
  if(haycupo(curso)) then
      --HALLAR IMPORTEAL
      select importe into ImporteHallado
      from cursos natural join cuotas
      where codigo = curso;
      
      if(alumnoAntiguo) then
          antiguo:=1;
          importeTotal:= ImporteHallado*0.95;
      else 
          importeTotal:= ImporteHallado;
          antiguo := 0;
      end if;
      insert into inscripciones values(curso, idAlumno, importeTotal, antiguo);  
  else
    DBMS_OUTPUT.PUT_LINE('No se ha podido realizar la inscripcion');
  end if;
  
  Exception
  when no_data_found then
      dbms_output.put_line('No existe el curso');
  when too_many_rows then
      dbms_output.put_line('TOO_MANI_ROWS');
      
end;

/
/*c. Crear un procedimiento que liste para cada curso (código, nombre y nivel) el número de inscripciones 
y el importe total ordenado por nivel. Parametrizar el procedimiento para poder indicar que se muestren
solo cursos con un número mínimo de matriculas.*/
create or replace 
procedure "Listar"
(numMatriculas number)
is
--Declaraciones
numInscripciones number := 0;
importeTotal number := 0;
    cursor cursor1 is
    select codigo, nombre, nivel, count(id_participante) as contador, sum(importe) as suma
    from cursos natural join inscripciones
    group by codigo, nombre, nivel
    having count(id_participante) > numMatriculas;
begin
    dbms_output.put_line(rpad('Curso', 10, ' ') || rpad('Nombre', 30, ' ') || rpad('Nivel', 10, ' ')|| rpad('NumInscripciones', 15, ' ')|| rpad('Importe', 10, ' '));
    for rcursos in cursor1 loop
    dbms_output.put_line(rpad(rcursos.codigo, 10, ' ') || rpad(rcursos.nombre, 30, ' ') || rpad(rcursos.nivel, 10, ' ')|| rpad(rcursos.contador, 15, ' ')|| rpad(rcursos.suma, 10, ' '));
    end loop;
    
end; --begin

