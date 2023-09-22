with Ada.Real_Time;
use Ada.Real_Time;
with Ada.Text_IO;
use Ada.Text_IO;

package body Plan is
	procedure Medir (Procedimientos: array_ref_Procedimiento; Tiempos : out array_Tiempos) is
		T_Inicial : Time;
		T_Final : Time;
	begin
		for I in Procedimientos'Range loop
			T_Inicial := Clock;
			Procedimientos(I).all; --Ejecuto el procedimiento que apunta el puntero de la posicion I del array
			T_Final := Clock;

			Tiempos(I) := Positive(Float'Truncation(Float(Ada.Real_Time.To_Duration(T_Final-T_Inicial)*1000.0)));
		end loop;
	end Medir;

	procedure Intercambia(x,y : in out reg_Planificacion) is
		temp : reg_Planificacion:=x;
	begin
		x:=y;
		y:=temp;
	end Intercambia;
	
	procedure Planificar (Tareas: in out array_reg_Planificacion) is
		W_anterior : Natural;
		W_posterior : Natural;
		W_temp : Natural := 0;
	begin
		--Ordenamos por prioridad
		for i in 1..Tareas'Last-1 loop
			for j in reverse i+1..Tareas'Last loop
				if Tareas(j).D < Tareas(j-1).D then
					Intercambia(Tareas(j), Tareas(j-1));
				end if;
			end loop;
		end loop;

		--Asignamos la prioridad
		for I in Tareas'Range loop
			Tareas(5-I).P := I;
		end loop;

		--Calculamos el tiempo de respuesta
		for I in Tareas'Range loop --Bucle que recorre las tareas

			--Tarea con mayor prioridad
			if I = 1 then
				Tareas(I).R := Tareas(I).C;
			end if;

			--Tareas con prioridad menor a la de mayor prioridad
			if I /= 1 then
				W_anterior := 0;
				for J in 1..I loop --Bucle sumatorio del tiempo de computo de tareas(C) con mayor prioridad(P)
					W_anterior := W_anterior + Tareas(J).C;
				end loop;
				W_temp := 0;
				loop --Bucle que calcula las diferentes W
					W_posterior := Tareas(I).C;
					if W_temp /= 0 then
						W_anterior := W_temp;
					end if;
					for J in 1..(I-1) loop --Bucle sumatorio de Ceiling(W_anterior/Tj) * Cj
						W_posterior := W_posterior + (Natural(Float'Ceiling(Float(Float(W_anterior)/Float(Tareas(J).T)))) * Tareas(J).C);
					end loop;
					if W_anterior /= W_posterior then
					W_temp := W_posterior;
					end if;
					exit when W_anterior = W_posterior;
				end loop;
				Tareas(I).R := W_posterior;
			end if;

			--Comprobamos si es planificable
			if Tareas(I).R <= Tareas(I).D then
				Tareas(I).Planificable := true;
			else
				Tareas(I).Planificable := false;
			end if;
		end loop;
	end Planificar;
end Plan;
