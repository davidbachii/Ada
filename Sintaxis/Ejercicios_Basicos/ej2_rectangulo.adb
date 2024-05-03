--Haz un programa de nombre área que pida por teclado el alto y el ancho de un rectángulo y calcule su área, mostrándolo por pantalla

with Ada.Text_Io;  use Ada.Text_Io;

--OPCION 1  CON EL PAQUETE FLOAT_IO

--procedure ej2_rectangulo is

--package Float_IO is new Ada.Text_IO.Float_IO(float);
--use Float_IO;

--alto, ancho, area : Float;

--begin

--put("Introduce el alto del rectángulo: ");
--get(alto);

--put("Introduce el ancho del rectángulo: ");
--get(ancho);

--area := alto * ancho;
--put_Line("El área del rectángulo es: " & area'Image & " m2") ;


--end ej2_rectangulo;

--OPCION 2 CON UN TIPO DE DATO DEFINIDO POR EL USUARIO

procedure ej2_rectangulo is

-- type longitud is new Float delta 0.001 range 0.0 .. 100.00; --  En Ada, la cláusula delta se usa con tipos Fixed, no con Float.
-- type longitud is new Float digits 4 range 0.0 .. 100.00;  --Lo que si se puede usar con float es digits y range
type longitud is delta 0.001 range 0.0 .. 100.00;  --Definimos un tipo de dato longitud que es un float con un rango de 0 a 100 y una precisión de 0.0001

--Como hemos declarado un tipo nuevo necesitamos un paquete para la entrada y salida de ese tipo de dato

package Longitud_IO is new Ada.Text_IO.Fixed_IO(longitud);
use Longitud_IO;

alto, ancho, area : longitud;

begin 

put("Introduce el alto del rectángulo: ");
get(alto);

put("Introduce el ancho del rectángulo: ");
get(ancho);

area := alto * ancho;
put_Line("El área del rectángulo es: " & area'Image & " m2") ;

end ej2_rectangulo;

