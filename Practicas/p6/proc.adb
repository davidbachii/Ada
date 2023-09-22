with Ada.Real_Time;
use Ada.Real_Time;

package body Proc is
	procedure P1 is
		T_Inicial : Time;
		T_Final : Time;
	begin
		T_Inicial := Clock;
		T_Final := Clock;
		while Ada.Real_Time.To_Duration(T_Final-T_Inicial) <= 0.400 loop
			T_Final := Clock;
		end loop;
	end P1;

	procedure P2 is
		T_Inicial : Time;
		T_Final : Time;
	begin
		T_Inicial := Clock;
		T_Final := Clock;
		while Ada.Real_Time.To_Duration(T_Final-T_Inicial) <= 0.600 loop
			T_Final := Clock;
		end loop;
	end P2;

	procedure P3 is
		T_Inicial : Time;
		T_Final : Time;
	begin
		T_Inicial := Clock;
		T_Final := Clock;
		while Ada.Real_Time.To_Duration(T_Final-T_Inicial) <= 0.800 loop
			T_Final := Clock;
		end loop;
	end P3;

	procedure P4 is
		T_Inicial : Time;
		T_Final : Time;
	begin
		T_Inicial := Clock;
		T_Final := Clock;
		while Ada.Real_Time.To_Duration(T_Final-T_Inicial) <= 0.800 loop
			T_Final := Clock;
		end loop;
	end P4;
end Proc;	
