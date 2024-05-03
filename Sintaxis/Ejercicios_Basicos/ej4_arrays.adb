with Ada.Text_IO; use Ada.Text_IO;
--Haz un programa que cree un array de enteros con 5 elementos, inicializado a 3, 23, 4, 67 y 332
-- Mostrar por pantalla la suma de sus elementos
-- Mostrar por pantalla la suma de los elementos impares


procedure  ej4_arrays is 

type array_t is array (integer range <>) of integer;



package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);
use Integer_IO;



a : array_t(1..5) := (3, 23, 4, 67, 332);
suma_e : integer;
suma_i : integer;

begin


--suma de los elementos
suma_e := 0;
for i in a'range loop
    suma_e := suma_e + a(i); --En ada los arrays empiezan en 1 y no en 0
    Put_Line("Elemento "& i'Image & " : " & a(i)'Image);
end loop;
-- Mostraria por pantalla algo asi
-- Elemento  1 :  3
-- Elemento  2 :  23
-- Elemento  3 :  4
-- Elemento  4 :  67
-- Elemento  5 :  332

put("La suma de los elementos es: "& suma_e'Image);


--suma de los elementos impares
suma_i := 0;
for i in a'range loop
    if a(i) mod 2 /= 0 then
        suma_i := suma_i + a(i);
    end if;
end loop;

put("La suma de los elementos impares es: "& suma_i'Image);




end ej4_arrays;