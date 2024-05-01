with Ada.Text_IO; use Ada.Text_IO;


procedure ejemploString2 is

s1: String(1 .. 2);
s2: String(1 .. 3);

begin

put("Introduce 5 caracteres alfaumercios y pulse enter: "); --Se almacena en una varible temporal
get(s1); --Pasa esa varible temporal a la variable s1 , pero solo los dos primeros caracteres

Put_Line("Primeros dos caracteres: " & s1);

get(s2); --De la varibale temporal inicial quedan todavia 3 caracteres que se pasan a s2

Put_Line("Ultimos tres caracteres: " & s2);

end ejemploString2;