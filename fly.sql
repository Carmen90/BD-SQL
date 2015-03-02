
--EJERCICIO 1
--APARTADO a). Crear una funcion que devuelve true si hay supo en un curso para  una nueva inscripcion
create or replace function "hayCupo" ( curso char)
return boolean
is 
alumnos number;
v_plazas cursos.plazas%type;
begin 
select count ( codigo), plazas into alumnos, v_plazas
from inscripciones natural join cursos
where codigo = curso;
if alumnos >= v_plazas then
return false;
else
return true;
end if;

end;

/
/*APARTADO b). Crear un procedimiento para realizar una inscripcion en un determinado curso si hay cupo, 
si no lo hay se mostrara un mensaje indicando que no hay cupo. Recibirá tres parámetros: código del curso, 
identificador del estudiante y un boolean que indique si es viejo alumno o no. El importe corresponderá con
el indicado en las cuotas en caso de cursos regulalres o intensivos. los cursos particulares corresponden a una
hora por lo que dependeran del numero de horas. A los antiguos alumnnos se les aplicará un descuento del 5% en todos los cursos.*/
create or replace procedure inscripcion ( cod in char, id_alum in varchar, viejo in boolean) is
v_importe number;
v_total number;
v_viejo inscripciones.ant_alumno%type;

begin
if hayCupo (cod) then
  if viejo then
  select importe into v_importe from inscripciones natural join cursos where codigo= cod;
  v_total := v_importe* 0.95;
  v_viejo :=1;
  else
  select importe into v_importe from inscripciones natural join cursos where codigo = cod;
  v_viejo := 0;
  end if;
insert into inscripciones values ( cod, id_alum, v_total, v_viejo);
else
dbms_output.put_line ( 'No hay plazas para ese curso');
end if;
end;
/

/*APARTADO c).Crear un procedimiento que liste para cada curso (código, nombre y nivel) el número 
de inscripciones y el importe total recaudado, ordenado por nivel. Parametrizar el 
procedimiento para poder indicar que se muestren solo cursos con un número mínimo 
de matriculas.
*/
create or replace procedure listado is
num_ins number;
imp_total number;
v_cod cursos.codigo%type;
v_nom cursos.nombre%type;
v_nivel cursos.nivel%type;

cursor c_lista is
select codigo, nombre, nivel, count ( id_participante) as num_ins, sum (importe) as imp_total 
from cursos natural join inscripciones 
group by codigo, nombre, nivel
order by nivel;

begin
dbms_output.put_line(rpad('Curso', 10, ' ') || rpad('Nombre', 30, ' ') || rpad('Nivel', 10, ' ')|| rpad('NumInscripciones', 15, ' ')|| rpad('Importe', 10, ' '));
for rlista in c_lista loop
dbms_output.put_line (rlista.codigo || '   ' || rlista.nombre || '   ' || rlista.nivel || '    '|| rlista.num_ins || '    ' || rlista.imp_total);
end loop;
end;