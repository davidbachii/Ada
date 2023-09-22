-- Este programa pretende ilustrar la forma de manejo de las herramientas
-- del entorno de desarrollo en Ada.

-- Paquete estándar que vamos a manejar.
with Ada.Text_Io; use Ada.Text_Io;

-- Procedimiento principal.
procedure numeros is

-- Creación de ejemplares, para la entrada/salida de números, a partir
-- de los paquete genéricos "Ada.Text_Io.Integer_Io" y
-- "Ada.Text_Io.Float_Io".
package Ent_Es is new Ada.Text_Io.Integer_Io(Integer);
use Ent_Es;
package Real_Es is new Ada.Text_Io.Float_Io(Float);
use Real_Es;

-- Declaración de variables locales.
I, J: Integer;
X, Y: Float;
-- Cuerpo del procedimiento "Numeros".
begin
-- Entrada/salida de números enteros.
-- Lectura de datos
New_Line;
Put ("Introduce un número entero: ");
Get (I);
Put ("Introduce otro número entero: ");
Get (J);
New_Line;
-- Presentación de los resultados en el sistema decimal
Put (I); Put ('+');
Put (J); Put ('=');
Put (I+J);
New_Line;


-- Presentación de los resultados en binario
Put (I, Base => 2);
Put ('+');
Put (J, Base => 2);
Put ('=');
Put (I+J, Base => 2);
New_Line;

-- Presentación de los resultados en hexadecimal
Put (I, Base => 16);
Put ('+');
Put (J, Base => 16);
Put ('=');
Put (I+J, Base => 16);
New_Line;
 -- Presentación de los resultados con formato
Put (I);
Put ('+');
Put (J, Width => 0);
Put ('=');
Put (I+J, Width => 6);
New_Line; New_Line;

-- Entrada/salida de números reales.
-- Lectura de los datos
Put ("Introduce un número real: ");
Get (X);
Put ("Introduce otro número real: ");
Get (Y);
New_Line;
-- Presentación de los resultados
Put (X); Put ('/'); Real_Es.Put (Y); Put ('=');
Put (X/Y);
New_Line;
-- Presentación de los resultados con formato
Put (X, Fore => 2, Aft => 2, Exp => 3);
Put ('/');
Put (Y, Fore => 0, Aft => 0, Exp => 0);
Put ('=');
Put (X/Y, Fore => 10, Aft => 4, Exp => 0);
New_Line; New_Line;
end numeros;
--4.Cuando llamamos al procedimiento Put de la línea 26 ¿en qué paquete se encuentra este procedimiento?
--Pertenece al paquete Ada.Text_Io

--5.Si quisiéramos poder reescribir la línea 34 para que quedara Put(I+J) ¿qué deberíamos añadir en el código y donde? Deja la línea 34 como se indica en esta cuestión
--y haz los cambios necesarios para que el programa funcione.
--Usando la clausula use (linea 14) que nos sirve para poder usar las funciones del paquete sin tener que llamarlo constantemente. 

--6. En general ¿cómo crees que el lenguaje sabe a qué procedimiento Put tiene que llamar si no se lo indicamos en el código?
--Puede ser debido a que el compilador busca las diferentes funciones de Put que se puedan usar dependiendo de la entrada de la funcion.



