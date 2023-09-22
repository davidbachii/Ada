with Ada.Text_Io, Ada.Real_time; 
use Ada.Text_Io, Ada.Real_time;

procedure delayCode is 
package ES_SPAN is new Ada.Text_Io.Fixed_Io(Duration);
T_inicial : Time := Clock;
T_final : Time;
T_aux : Time;
plazo_loop : Time_span := Milliseconds(500);
plazo_aux  : Time_span;
i : integer := 0;

begin
T_final := Clock;
for i in 0 .. 9 loop 
	T_final := T_final + plazo_loop;

	T_aux := Clock;
	plazo_aux := T_aux - T_inicial;
	ES_SPAN.put(To_Duration(plazo_aux) , Fore => 1, Aft => 2);

	new_line;
	
	Put_line("Tiempo:" & To_Duration(plazo_aux)'img);


	delay until T_final;
	end loop;
	

end delayCode;
