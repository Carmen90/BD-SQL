CREATE OR REPLACE PROCEDURE DECISION_ARTICULO2 
(v_puntuacion_minima in number)
is
/*declaranos el cursor*/
	cursor cur_decision is
	select numero, titulo, nivel, puntuacion 
	from Articulos natural join Revisan
	order by titulo;
  
  --declaramos el registro
	r_decision cur_decision%ROWTYPE;
  
  --declaramos las variables a utilizar
	v_num number (36);
	v_titulo varchar2(36);
	v_nivel number(1);
	v_punt number(1);
	v_aux number(36);
	media number (36,2);
	v_cont number (10) :=0;
	v_acept varchar2 (36);
BEGIN
 	open cur_decision;--abrimos el cursor
  --Metemos en v_num, v_titulo... los valores de la linea del cursor, osea numero, titulo...
	fetch cur_decision into  v_num, v_titulo, v_nivel, v_punt; --
	v_aux := v_num;
	loop
		--fetch cor_decision into ( v_num, v_titulo, v_nivel, v_punt);
    /*La idea de este while es que mientras el numero del articulo no varie 
    vaya sumando las puntuaciones y los dividimos por el contador, que indicaria 
    el numero de revisores, obteniendo asi la media de la puntuacion de todos*/
		while ( v_aux = v_num)loop
			v_cont:= v_cont + 1;
			media := (v_nivel + v_punt) / v_cont;
      --En cada iteracion del bucle cargo en v_num... los valores del cursor
			fetch cur_decision into  v_num, v_titulo, v_nivel, v_punt;
		end loop;
    -- Si la puntuacion es mayor que la puntuacion minima se muestra como aceptado y sino como rechazado
		if ( media >= v_puntuacion_minima) then
			v_acept := 'Aceptado';
		else
			v_acept := 'Rechazado';
		end if;
    --Lo muestra
		dbms_output.put_line ( 'Número: ' || v_num ||', Título: ' || v_titulo || ', Puntuación: ' || media || ', Decisión: ' || v_acept);
		v_aux := v_num;
    --Se hace el loop hasta que el cursor se quede vacio %notfound que sale del bucle (loop)
		exit when cur_decision%NOTFOUND;
	end loop;
END DECISION_ARTICULO2;