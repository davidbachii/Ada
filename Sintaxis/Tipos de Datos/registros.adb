with Ada.Text_IO; use Ada.Text_IO;


procedure registros is


type dias_t is range 1 .. 31; -- De tipo Integer 
type meses_t2 is (enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre); -- De tipo Enumerado
type anios_t is range 1900 .. 2024;  -- De tipo Integer

package dias is new Ada.Text_IO.Integer_IO(dias_t);
use dias;

package meses is new Ada.Text_IO.Enumeration_IO(meses_t2);
use meses;

package anios is new Ada.Text_IO.Integer_IO(anios_t);
use anios;

type fecha_t is record
    dia: dias_t;
    mes: meses_t2;
    anio: anios_t;
end record;

Hoy : fecha_t;
Pasado : fecha_t;

begin

Hoy . Dia := 03; Hoy . mes := mayo ; Hoy . anio := 2024;

Put_Line("Hoy es: " & Hoy . Dia'Image & Hoy . mes'Image & Hoy . anio'Image);




Pasado :=( Dia =>04 , Mes => mayo , anio => 2024) ;

Put_Line("Pasado es: " & Pasado . Dia'Image & Pasado . mes'Image & Pasado . anio'Image);



end registros;