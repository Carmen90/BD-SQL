create or replace 
procedure "LOADEVENTS" is

begin

delete from cursos;

FOR curso_ingles in 1..5 LOOP

insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Principiante', 'Regular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Principiante', 'Intensivo', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Principiante', 'Particular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Intermedio', 'Regular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Intermedio', 'Intensivo', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Intermedio', 'Particular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Avanzado', 'Regular', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Avanzado', 'Intensivo', 10+ (2*cursoSCC.CURRVAL));
insert into cursos (codigo, nombre, nivel, tipo, horas) values('C'||cursoSCC.NEXTVAL,'Curso de Inglés '||cursoSCC.CURRVAL,'Avanzado', 'Particular', 10+ (2*cursoSCC.CURRVAL));

END LOOP;
insert into inscripciones values('C271', 'PEPE', 675, 0);

end;