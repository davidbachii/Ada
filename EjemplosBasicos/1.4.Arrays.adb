with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Arrays is
    --package ES_ent is new Ada.Text_Io.Integer_Io(Integer);
        
    A: array(1..5) of Integer := (3, 23, 4, 67, 332); 
        -- Esto se puede hacer pero no es lo recomendado ya que crea un tipo sin 
        -- nombrarlo 
begin
    set_col(5);
    Put("La suma de sus elementos es : " & Integer'image(A(1)+A(2)+A(3)+A(4)+A(5)));
    --ES_ent.Put(A(1));
    New_line(2);
    set_col(5);
    Put("La suma de sus elementos impares es : " & Integer'image(A(1)+A(3)+A(5)));
    New_line(2);    
end Arrays;
