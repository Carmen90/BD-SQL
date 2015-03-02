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