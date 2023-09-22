with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Atributos is
    --package ES_ent is new Ada.Text_Io.Integer_Io(Integer);
        
    A: array(1..5) of Integer := (3, 23, 4, 67, 332); 
    -- Esto se puede hacer pero no es lo recomendado ya que crea un tipo sin 
    -- nombrarlo 

    suma : Integer :=0;   -- Inicializamos que va a ser un acumulador
    suma_impar : Integer :=0;   -- Inicializamos que va a ser un acumulador
begin
    for I in A'First..A'Last loop
        if I rem 2 = 1 then
            suma_impar := suma_impar + A(I);
        end if;

        suma := suma + A(i);
    end loop;
    
    set_col(5);
    Put("La suma de sus elementos es : " & integer'image(suma));
    New_line(2);
    set_col(5);
    Put("La suma de sus elementos impares es : " & Integer'image(suma_impar));
    New_line(2);    
end Atributos;
