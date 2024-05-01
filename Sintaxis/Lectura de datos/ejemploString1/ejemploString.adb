with Ada.Text_IO; use Ada.Text_IO;



procedure ejemploString is

s1: String(1 .. 5); -- Declaración de un string de 2 caracteres
s2:String(1 .. 3); -- Declaración de un string de 3 caracteres

--Lo que no deja es declarar un string de tamaño variable sin valor inicial osea así:
--s3: String; -- Declaración de un string de tamaño variable

s4: String := "Su nombre es: "; -- Declaración de un string de tamaño variable con valor inicial

begin 

put("Ingrese un nombre de 5 caracteres y pulse enter... ");
get(s1); -- Lectura de un string de 2 caracteres

Put_Line(s4 & s1); -- Concatenación de strings se usa & es como el + en java

end ejemploString;