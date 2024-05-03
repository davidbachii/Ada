with Ada.Text_IO; use Ada.Text_IO;



procedure registros is


type dias_t is range 1 .. 31; -- Definimos el tipo de dato dias_t que va de 1 a 31 de tipo entero
type meses_t is (Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto, Septiembre, Octubre, Noviembre, Diciembre); -- Definimos el tipo de dato meses_t que es un enumerado con los meses del año
type anios_t is range 1900 .. 2024; -- Definimos el tipo de dato anios_t que va de 1900 a 2024 de tipo entero

-- Permitir la e/s 

package dias_IO is new Ada.Text_IO.Integer_IO(dias_t);
use dias_IO;
package meses_IO is new Ada.Text_IO.Enumeration_IO(meses_t);
use meses_IO;
package anios_IO is new Ada.Text_IO.Integer_IO(anios_t);
use anios_IO;

-- Definimos el tipo de dato fecha_t que es un registro con los campos dia, mes y anio

type fecha_t is record
  dia : dias_t;
  mes : meses_t;
  anio : anios_t;
end record;

-- TEMPERATURA

type temperatura_t is delta 0.01 range -25.00 .. 75.00; -- Definimos el tipo de dato temperatura_t que va de -25 a 75 de tipo real

-- Permitir la e/s

package temperatura_IO is new Ada.Text_IO.Fixed_IO(temperatura_t);
use temperatura_IO;


type array_fechas is array(integer range <>) of fecha_t; -- Definimos el tipo de dato array_fechas que es un array de fechas
type array_temperaturas is array(integer range <>) of temperatura_t; -- Definimos el tipo de dato array_temperaturas que es un array de temperaturas


array_f : array_fechas(1 .. 10); -- Declaramos un array de fechas de 10 elementos
array_t : array_temperaturas(1 .. 10); -- Declaramos un array de temperaturas de 10 elementos

package Integer_IO is new Ada.Text_IO.Integer_IO(integer);
use Integer_IO;

numero_registros : integer; -- Declaramos una variable de tipo entero numero_registros

function maximo (array_TEM : array_temperaturas) return temperatura_t is
  max : temperatura_t := array_TEM(array_TEM'First);

begin

  for i in array_TEM'range loop

    if array_TEM(i) > max then
      max := array_TEM(i);
    end if;

  end loop;

return max;

end maximo;

function minimo (array_TEM : array_temperaturas) return temperatura_t is
  min : temperatura_t := array_TEM(array_TEM'First);

begin

    for i in array_TEM'range loop
  
        if array_TEM(i) < min then
          min := array_TEM(i);
        end if;
  
    end loop;
  
  return min;
  
end minimo;

function media (array_TEM : array_temperaturas) return temperatura_t is
  suma : temperatura_t := 0.00;
  media : temperatura_t := 0.00;

begin

    for i in array_TEM'range loop
  
        suma := suma + array_TEM(i);
  
    end loop;

  media := suma / array_TEM'length;

  return media;

end media;

begin


-- Le pedimos al usuario que introduzca el numero de registros que quiere introducir

put("Introduce el numero de registros que quieres introducir: ");
get(numero_registros);


-- Le pedimos al usuario que introduzca los datos de los registros

for i in 1 .. numero_registros loop

put("Introduce la " & i'image & " temperatura: ");
get(array_t(i));

put("Introduce el dia: ");
get(array_f(i).dia);

put("Introduce el mes: ");
get(array_f(i).mes);

put("Introduce el anio: ");
get(array_f(i).anio);

end loop;



Put_Line("La temperatura maxima es: " & maximo(array_t)'Image);

Put_Line("La temperatura minima es: " & minimo(array_t)'Image);

Put_Line("La temperatura media es: " & media(array_t)'Image & " alcanzada entre el " & array_f(array_t'First).dia'Image & " de " & array_f(array_t'First).mes'Image & " de " & array_f(array_t'First).anio'Image & " y el " & array_f(array_t'Last).dia'Image & " de " & array_f(array_t'Last).mes'Image & " de " & array_f(array_t'Last).anio'Image);








end registros;


-- Ya esta todo implementado, el problema es el tamaño del array entonces la clave va a ser crear un putero al array y ahi se que podremos tocar el array como mas nos guste, otra cosa tambien es meter
-- en el registro de fecha tambien la temperatura. Asi nos dejamos de rollos, pero se podria hacer con el POS.