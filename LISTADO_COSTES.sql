create or replace 
PROCEDURE LISTADO_COSTES 
(v_imp_estudiante in number, v_imp_regular in number, v_prec_ticket_extra in number, v_descuento in number)
is
--Creamos el cursor
	cursor cur_asistentes is
	select nombre, numero_socio, tarifa, tickets 
	from asistentes natural join personas
	order by nombre;
  
  -- creamos un registro del mismo tipo que el cursor
  r_asistentes cur_asistentes%ROWTYPE;
	
  /*Declaramos una serie de variables que vamos a utilizar en la ejecucion del procedimiento */
  pre_socio number(10,2):=0;
	pre_tarifa number(10,2):=0;
	pre_tickets number (10,2):=0;
	pre_descuento number (10,2):=0;
	pre_total number (10,2):=0;
  
BEGIN 
--Este for se encarga de abrir el cursor, recorrerlo y cerrarlo
  FOR r_asistentes IN cur_asistentes LOOP-- mete en r_asistentes las filas de cur_asistentes
    if ( r_asistentes.numero_socio != 0) then
			pre_descuento := v_descuento;
		end if;
		if ( r_asistentes.tarifa = 'Estudiante') then
			pre_tarifa := v_imp_estudiante;
		else
			pre_tarifa := v_imp_regular;
		end if;
		pre_tickets := r_asistentes.tickets * v_prec_ticket_extra;
		pre_total := pre_tarifa - pre_descuento + pre_tickets;
    --dbms... = system.out...
		dbms_output.put_line ( 'Nombre: ' ||r_asistentes.nombre || ', Tarifa; ' || to_char(pre_tarifa) ||', Precio ticekts extra: '
								|| to_char(pre_tickets) || ', Descuento: '|| to_char(v_descuento) || ', Total: ' || to_char(pre_total));
  end loop;
END LISTADO_COSTES;