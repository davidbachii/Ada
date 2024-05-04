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

-- TEMPERATURA

type temperatura_t is delta 0.01 range -25.00 .. 75.00; -- Definimos el tipo de dato temperatura_t que va de -25 a 75 de tipo real

-- Permitir la e/s

package temperatura_IO is new Ada.Text_IO.Fixed_IO(temperatura_t);
use temperatura_IO;

-- Definimos el tipo de dato fecha_t que es un registro con los campos dia, mes y anio

type fecha_t is record
  dia : dias_t;
  mes : meses_t;
  anio : anios_t;
  temperatura : temperatura_t;
end record;


-- Aqui tenemos dos opciones y es crear un array y ya pasarle un tamaño fijo

type array_fechas is array(integer range <>) of fecha_t; -- Definimos el tipo de dato array_fechas que es un array de fechas


-- El problema que nosotros pedimos por pantalla el numero de elementos que va a recoger el array
-- array_f : array_fechas(1 .. 10); -- Declaramos un array de fechas de 10 elementos


-- La mejor opcion es crear un puntero al ese array por que los punteros nos permiten cambiar sus valores


type ptr_fechas is access array_fechas;

array_f : ptr_fechas := new array_fechas(1 .. 10); --Creamos un puntero al array de fechas que en un futuro modificaremos

--  Numero de elementos 
package Integer_IO is new Ada.Text_IO.Integer_IO(integer);
use Integer_IO;

numero_registros : integer; -- Declaramos una variable de tipo entero numero_registros

function maximo (array_TEM : ptr_fechas) return temperatura_t is
  max : temperatura_t := array_TEM(array_TEM'First).temperatura;

begin

  for i in array_TEM'range loop

    if array_TEM(i).temperatura > max then
      max := array_TEM(i).temperatura;
    end if;

  end loop;

return max;

end maximo;

function minimo (array_TEM : ptr_fechas) return temperatura_t is
  min : temperatura_t := array_TEM(array_TEM'First).temperatura;

begin

    for i in array_TEM'range loop
  
        if array_TEM(i).temperatura < min then
          min := array_TEM(i).temperatura;
        end if;
  
    end loop;
  
  return min;
  
end minimo;

function media (array_TEM : ptr_fechas) return temperatura_t is
  suma : temperatura_t := 0.00;
  media : temperatura_t := 0.00;

begin

    for i in array_TEM'range loop
  
        suma := suma + array_TEM(i).temperatura;
  
    end loop;

  media := suma / array_TEM'length;

  return media;

end media;

begin


-- Le pedimos al usuario que introduzca el numero de registros que quiere introducir

put("Introduce el numero de registros que quieres introducir: ");
get(numero_registros);


-- Esto lo podemos hacer gracias a los punteros con los tipos no podemos modificar sus fatos
array_f := new array_fechas(1 .. numero_registros); 


-- Le pedimos al usuario que introduzca los datos de los registros

for i in 1 .. numero_registros loop

put("Introduce la " & i'image & " temperatura: ");
get(array_f(i).temperatura);

put("Introduce el dia: ");
get(array_f(i).dia);

put("Introduce el mes: ");
get(array_f(i).mes);

put("Introduce el anio: ");
get(array_f(i).anio);

end loop;



Put_Line("La temperatura maxima es: " & maximo(array_f)'Image);

Put_Line("La temperatura minima es: " & minimo(array_f)'Image);

Put_Line("La temperatura media es: " & media(array_f)'Image & " alcanzada entre el " & array_f(array_f'First).dia'Image & " de " & array_f(array_f'First).mes'Image & " de " & array_f(array_f'First).anio'Image & " y el " & array_f(array_f'Last).dia'Image & " de " & array_f(array_f'Last).mes'Image & " de " & array_f(array_f'Last).anio'Image);








end registros;
