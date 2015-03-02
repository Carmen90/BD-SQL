create or replace 
PROCEDURE EXPERTO_MODERADOR AS 
  
  cursor cur_moderan is
  select s.fecha, s.orden, rev_as.correo_e
  from Sesiones s, (select correo_e  from  revisores natural join asistentes) rev_as 
  where rev_as.correo_e not in
        ( select correo_e from articulos natural join escribe natural join sesiones
          where fecha = s.fecha and orden = s.orden)
          order by fecha, orden;
  
  
  TB constant varchar2(1):=CHR(9);
  v_nom varchar2(36);

begin
  dbms_output.put_line(rpad('Fecha',12,' ')||TB||rpad('Sesión',10,' ')||TB||rpad('Revisor',20,' '));
  dbms_output.put_line(rpad('-',50,'-')); 
  for r_modera in cur_moderan loop
	select nombre into v_nom
	from personas
	where correo_e = r_modera.correo_e;
    dbms_output.put_line (rpad( r_modera.fecha, 12, ' ')|| TB ||rpad(r_modera.orden, 10, ' ') || TB || rpad(v_nom, 20, ' '));
  end loop;
END EXPERTO_MODERADOR;