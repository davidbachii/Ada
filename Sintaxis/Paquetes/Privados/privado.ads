with Ada.Text_IO;  use Ada.Text_IO;

package privado is


package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);



function Asignar_blanco ( x , y : Integer ) return target_t;
procedure Imprimir_blanco (T : target_t ) ;


type target_t is private; -- Anticipamos que habra un tipo privado llamado target_t se puede hacer una copia de este tipo de dato (no se puede hacer un target_t := target_t)

private -- Esto no sera visible fuera del paquete luego no podremos acceder a x e y 

type target_t is record
    x : Integer;
    y : Integer;
end record;




end privado;




