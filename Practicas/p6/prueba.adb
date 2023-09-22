with Ada.Text_Io, Ada.Integer_Text_Io, Proc, Plan;
use Ada.Text_Io, Ada.Integer_Text_Io, Proc, Plan;

procedure Prueba is
	--Medidas de tiempo de computo
	Procedimientos: array_ref_Procedimiento := (P1'Access, P2'Access, P3'Access, P4'Access);
	Tiempos: array_Tiempos (Procedimientos'Range);

	--Planificador
--	package Integer_Es is new Integer_Io (Integer);
--	use Integer_Es;
	Tareas: array_reg_Planificacion := (
	-- -------------------------------------------------
	-- Tarea T D C P R Planificable
	-- -------------------------------------------------
	 ( 1, 2400, 600, 400, 1, 0, False ),
	 ( 2, 3200, 1200, 600, 1, 0, False ),
	 ( 3, 3600, 2000, 800, 1, 0, False ),
	 ( 4, 4000, 3200, 800, 1, 0, False )
	 -- -------------------------------------------------
	 );
begin
	--Medidas de tiempo de computo
	Medir (Procedimientos, Tiempos);
	Put_line ("+--------------------------+");
	Put_Line ("| Procedimiento T.computo  |");
	Put_line ("|--------------------------|");
	for I in Tiempos'Range loop
	Put ("| ");Put (I, Width=>13); Put (" ");
	Put (Tiempos(I), Width=> 10); Put (" |");
	New_Line;
	end loop;
	Put_line ("+--------------------------+");

	--Planificador
	Planificar (Tareas);
	Put_line (
	"+---------------------------------------------------+");
	Put_Line (
	"|  Tarea    T    D    C    P    R    Planificable   |");
	Put_line (
	"|---------------------------------------------------|");
	for I in Tareas'Range loop
		Put ("| ");
		Put (Tareas(I).Nombre, Width=>7); Put (" ");
		Put (Tareas(I).T, Width=>4); Put (" ");
		Put (Tareas(I).D, Width=>4); Put (" ");
		Put (Tareas(I).C, Width=>4); Put (" ");
		Put (Tareas(I).P, Width=>4); Put (" ");
		Put (Tareas(I).R, Width=>4); Put ("              ");
		if Tareas(I).Planificable then
			Put_Line (" SI |");
		else
			Put_Line (" NO |");
		end if;
	end loop;
	Put_line (
	"+---------------------------------------------------+");
end Prueba;
