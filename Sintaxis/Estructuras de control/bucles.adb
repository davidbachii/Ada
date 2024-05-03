with Ada.Text_IO; use Ada.Text_IO;



procedure bucles is

type array_t is array(integer range <>) of integer;

package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);
use Integer_IO;

valor_1 : Integer := 10;
valor_2 : Integer;
valor_3 : Integer;

array_1 : array_t(1..10) := (1,2,3,4,5,6,7,8,9,10);


begin


-- Bucle simple
loop 
    put(valor_1);
    valor_1 := valor_1 - 1;
    exit when valor_1 = 0;
end loop;


-- Bucle con rango

for i in 1 .. 10 loop
    put(array_1(i));
end loop;

-- Bucle con rango y salto

for i in 1 .. 10 loop
    put(array_1(i));
    exit when i = 5;
end loop;

-- Bucle para arrays

for i in array_1'Range loop
    put(array_1(i));
end loop;

-- Suma de elementos de un array
valor_2 := 0;
for i in array_1'Range loop
    valor_2 := valor_2 + array_1(i);
end loop;

put(valor_2);

--Suma los numeros impares

valor_3 := 0;

for i in array_1'Range loop
    if array_1(i) mod 2 /= 0 then
        valor_3 := valor_3 + array_1(i);
    end if;
end loop;

put(valor_3);


-- Bucle while

valor_1 := 10;

while valor_1 > 0 loop
    Put_Line("Valor: " & valor_1'Image);
    valor_1 := valor_1 - 1;
end loop;



end bucles;