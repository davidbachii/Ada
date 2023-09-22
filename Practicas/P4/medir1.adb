with Ada.Text_Io, Ada.Real_time; 
use Ada.Text_Io, Ada.Real_time;
with Horno; use Horno;
with Sensor; use Sensor;
with Calefactor; use Calefactor; 


procedure Medir1 is
   Potencia : constant Calefactor.Potencias := 1000.0; -- Potencia de prueba
   Tiempo_ini, Tiempo_fin: Time;
   Temperatura_ini, Temperatura_act: Sensor.Temperaturas;
   L: Time_span;
   Cp: Float;
   

begin

   
   -- Medición de Te
   Sensor.Leer(Temperatura_ini);
   Put_Line("Temperatura en reposo: " & Temperatura_ini'Image & " grados Celsius");
   
   
    -- Aplicar potencia y medir tiempo que tarda el horno en responder
   Calefactor.Escribir(Potencia);
   Tiempo_ini := Clock;
   loop
      Sensor.Leer(Temperatura_act);
      exit when Temperatura_act /= Temperatura_ini; -- Se considera que el horno ha respondido
   end loop;
   Tiempo_fin := Clock; 
   -- Calcular L
   L := Tiempo_fin - Tiempo_ini;
   Put("Valor del retardo es: ");
   Put(duration'image(to_duration(L)));
   
   
   -- Esperar a que el horno alcance régimen permanente que tras hacer una prueba con un bucle infinito la temperatura se ha estabilizado en 6.49235E+01 grados Celsius
  while Temperatura_act < 64.92 loop
      delay 2.0; -- Esperar 1 segundo
      Sensor.Leer(Temperatura_act);
      Put_Line("Temperatura en actual: " & Temperatura_act'Image & " grados Celsius");
  end loop;
  --Apago el horno
	Calefactor.Escribir(0.00);
	Put_Line("Horno apagado");
  
   -- Calcular Cp
   Cp := 1000.0/(Float(Temperatura_act)-Float(Temperatura_ini));
   Put_Line("Coeficiente de pérdidas: " & Cp'Image);


   end Medir1;
