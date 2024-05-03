with Ada.Text_IO; use Ada.Text_IO;



procedure switchCase is 


type meses_t is (Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto, Septiembre, Octubre, Noviembre, Diciembre);

package meses is new Ada.Text_IO.Enumeration_IO (meses_t);
use meses;

mes : meses_t;

begin

mes := agosto;
-- Switch case basico
case mes is
when Enero => 
    Put_Line("Enero");
when Febrero => 
    Put_Line("Febrero");
when Marzo => 
    Put_Line("Marzo");
when Abril => 
    Put_Line("Abril");
when Mayo => 
    Put_Line("Mayo");
when Junio => 
    Put_Line("Junio");
when Julio => 
    Put_Line("Julio");
when Agosto => 
    Put_Line("Agosto");
when Septiembre => 
    Put_Line("Septiembre");
when Octubre => 
    Put_Line("Octubre");
when Noviembre => 
    Put_Line("Noviembre");
when Diciembre => 
    Put_Line("Diciembre");

when others => null;
end case;   

case mes is
when enero | mayo => 
    Put_Line("Enero o Mayo");

when junio .. septiembre => 
    Put_Line("Junio a Septiembre");
when others => null ;
end case ;


end switchCase;