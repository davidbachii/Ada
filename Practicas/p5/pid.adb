with Ada.Text_IO;
use Ada.Text_IO;
package body PID is
	procedure Programar (el_Controlador: in out Controlador; Kp, Ki, Kd: Real) is
	begin
		el_Controlador.Kp := Kp;
		el_Controlador.Ki := Ki;
		el_Controlador.Kd := Kd;
	end Programar;

	procedure Controlar(con_el_Controlador: in out Controlador; R, C: Entrada; U: out Salida) is
	err : Real;
	begin

		err := Real(R-C);
		U := Salida(con_el_Controlador.Kp * err + con_el_Controlador.Ki*con_el_Controlador.S_Anterior + con_el_Controlador.Kd*(err - con_el_Controlador.Error_Anterior));

		con_el_Controlador.S_Anterior := Real(con_el_Controlador.S_Anterior + err);
		con_el_Controlador.Error_Anterior := err;
	end Controlar;

end PID;
