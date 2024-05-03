with Ada.Text_IO; use Ada.Text_IO;



procedure ifElse is 

package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);
use Integer_IO;


a: Integer := 10;
b: Integer := 20;
c: Integer := 30;

Mayor : Integer;
Menor : Integer;



begin

--Caso Basico de if-else 
if a > b then
    Mayor := a;
    Put_Line("El mayor es: " & Mayor'Image);
    Menor := b;
    Put_Line("El menor es: " & Menor'Image);
else
    Mayor := b;
    Put_Line("El mayor es: " & Mayor'Image);
    Menor := a;
    Put_Line("El menor es: " & Menor'Image);
end if;


-- En ada el diferente igual es /=
-- El and o && en ada es and then

if a /= 0 and then b /= 0 then --En el and ambos deben ser verdaderos
    Put_Line("Ambos son diferentes de 0");
else
    Put_Line("Al menos uno es 0");
end if;

-- El or o || en ada es or else

if a = 0 or else b = 0 then --En el or con que uno de los dos sea verdadero se cumple
    Put_Line("Al menos uno es 0");
else
    Put_Line("Ninguno es 0");
end if;

-- El not o ! en ada es not

if not (a = 0) then
    Put_Line("a es diferente de 0");
else
    Put_Line("a es igual a 0");
end if;

-- El else if en ada es elsif

if a > b and then a > c then
    Mayor := a;
    Put_Line("El mayor es: " & Mayor'Image);
elsif b > a and then b > c then
    Mayor := b;
    Put_Line("El mayor es: " & Mayor'Image);
else
    Mayor := c;
    Put_Line("El mayor es: " & Mayor'Image);
end if;

end ifElse;