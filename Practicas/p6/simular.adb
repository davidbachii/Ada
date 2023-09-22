with Ada.Text_Io, Ada.Real_Time, proc, plan;
use Ada.Text_Io, Ada.Real_Time, proc, plan;

procedure Simular is
	task type Tarea (Nombre : Natural;
		T : Natural;
		D : Natural;
		C : Natural;
		P : Natural;
		Codigo_Ciclico: ref_Procedimiento) is pragma Priority (P);
	end Tarea;

	Tarea1: Tarea (1, 2400, 600, 400, 4, P1'Access);
	Tarea2: Tarea (2, 3200, 1200, 600, 3, P2'Access);
	Tarea3: Tarea (3, 3600, 2000, 800, 2, P3'Access);
	Tarea4: Tarea (4, 4000, 3200, 800, 1, P4'Access);

	task body Tarea is
		T_Inicial : Time;
		T_Final : Time;
	begin
		for I in 1..(50000/T) loop
			T_Inicial := Clock;
			Codigo_Ciclico.all;
			T_Final := Clock;
			if Natural(Float'Truncation(Float(Ada.Real_Time.To_Duration(T_Final-T_Inicial)*1000.0)))  <= D then
				Put_Line("Tarea " & Natural'Image(Nombre) & " terminada en plazo CORRECTO");
			else
				Put_Line("Tarea " & Natural'Image(Nombre) & " terminada en plazo ERRONEO");
			end if;
			delay((Duration(T) - Duration(Float'Truncation(Float(Ada.Real_Time.To_Duration(T_Final-T_Inicial)*1000.0))))/1000.0);
		end loop;
		Put_Line("Tarea " & Natural'Image(Nombre) & " ULTIMA EJECUCION");
	end Tarea;

begin
	delay(50.0);
	Put_Line("MAIN TERMINADO");
end Simular;
