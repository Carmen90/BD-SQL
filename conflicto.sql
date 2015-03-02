create or replace 
trigger conflicto_interes
after insert on escribe
for each row

DECLARE 

existe_correo varchar2(36)= null;

BEGIN

select correo_e into existe_correo
from Revisores 
where correo_e =:new.correo_e;

if ( exite_correo is not null) then
insert into ConflictosInteres values (:new.correo_e,:new.numero);
end if;

exception
when NO_DATA_FOUND or TOO_MANY_ROWS then
 null;
END;
