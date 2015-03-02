create or replace 
TRIGGER REVISOR_CONFLICTO 
AFTER INSERT ON Escribe 

  declare
  cursor cur_conflicto is
  select s.fecha, s.orden,r_asis.numero, r_asis.correo_e
  from sesiones s, (select correo_e, numero from revisores natural join asistentes) r_asis
  where r_asis.correo_e in (select correo_e from articulos natural join escribe natural join sesiones 
                    where fecha = s.fecha and
                          orden = s.orden);
BEGIN
  for r_conflicto in cur_conflicto loop
    insert into ConflictosInteres values (r_conflicto.correo_e, r_conflicto.numero);
    dbms_output.put_line ( 'conflicto con: ' || r_conflicto.correo_e);
  end loop;
END;