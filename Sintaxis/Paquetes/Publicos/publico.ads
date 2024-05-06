with Ada.Text_IO;  use Ada.Text_IO;

package publico is


package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);

type target_t is record
    x : integer;
    y : integer;
end record;


function Asignar_blanco ( x , y : Integer ) return target_t;
procedure Imprimir_blanco (T : target_t ) ;


end publico;




