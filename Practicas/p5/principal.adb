with Ada.Text_Io, Sensor, Calefactor, PID, Horno; 
use Ada.Text_Io;
procedure Principal is
	package mi_PID is new PID (Real => Float, Entrada => Float, Salida => Float);
	use mi_PID;
	el_Controlador : Controlador;
	T : Horno.Temperaturas;
	C : Float;
--	R : Float := 100.0;
	R : Float := 200.0;
	U : Float := 0.0;

begin
--	Programar(el_Controlador, 0.571875, 0.42885, 0.1906);
	Programar(el_Controlador, 0.5047, 0.5047, 0.1262);
--	k=64.99
--	L=3
--	t=82
--	Kp=0,5047
--	Ti=6
--	Td=1.5
--	Ki=0,5047
--	Kd=0,1262

	while True loop
		Sensor.Leer(Sensor.Temperaturas(T));
		C := Float(T);
		Controlar(el_Controlador, R, C, U);
--		Put("Potencia calculada y aplicada es: ");
--		Put_Line(Float'Image(U));
		Calefactor.Escribir(Calefactor.Potencias(U));

		Put_Line(Horno.Temperaturas'Image(T));
		delay(6.0);
	end loop;
end Principal;
