with Ada.Text_Io, Ada.Real_time; 
use Ada.Text_Io, Ada.Real_time;
with Horno; use Horno;
with Sensor; use Sensor;
with Calefactor; use Calefactor; 


procedure Medir2 is
   Potencia : constant Calefactor.Potencias := 1000.0; -- Potencia de prueba
   Temperatura_ini: Sensor.Temperaturas := 25.00;
   Temperatura_act, T_regTrans: Sensor.Temperaturas;
   Cp: Float := 2.50489E+01;
   Ct : Float;
   I : Integer;
   Delta_t : Integer;

begin

   
   
  
   
   
    -- Aplicar potencia y medir tiempo que tarda el horno en responder
   Calefactor.Escribir(Potencia);


   
   --Calculo los deltas
	--Considero el intervalo donde el incremeto (los deltas) son los mayores posibles, los primeros 6 segundos
	Delta_t := 6;
	I := 1;
	while I <= Delta_t loop
		Sensor.Leer(Temperatura_act);
		delay(2.0);
		I := I+2;
	end loop;
	--Guardo el valor de la temperatura en ese instante
	Sensor.Leer(T_regTrans);
	Put_line("Delta_t es: ");
	Put_Line(Integer'Image(Delta_t));
	Put("Delta_T es: ");
	Put_Line(Float'Image(Float(T_regTrans)-Float(Temperatura_ini)));
	Put("T_regTrans es: ");
	Put_Line("Temperatura regimen transitorio: " & T_regTrans'Image & " grados Celsius");
	

  
   
   --Calculo la capacidad termica Ct
   Ct := (((1000.0 - Cp*(Float(T_regTrans)-Float(Temperatura_ini)))/(Float(T_regTrans)-Float(Temperatura_ini)))*(Float(Delta_t)));
   Put("La capacidad termica Ct es: ");
   Put_Line(Float'Image(Ct));

   end Medir2;
