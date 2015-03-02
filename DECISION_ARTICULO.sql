create or replace 
procedure decision_articulo
(v_puntuacion_minima in number)
is
  
	cursor cur_decision is
	select titulo, numero, sum(puntuacion * nivel)/count(*) as media
	from articulos natural join revisan
	group by numero, titulo;
  
  v_aceptado varchar2(36) := null;

begin 
  for r_decision in cur_decision loop
    if (r_decision.media < v_puntuacion_minima) then
      v_aceptado := 'Rechazado';
    else
      v_aceptado := 'Aceptado';
    end if;
    dbms_output.put_line ( r_decision.numero || ', '  || r_decision.titulo || ', ' || r_decision.media || ', ' ||
                           v_aceptado);
  end loop;
END DECISION_ARTICULO;