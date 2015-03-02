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