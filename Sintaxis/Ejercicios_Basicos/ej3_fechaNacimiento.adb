with Ada.Text_IO; use Ada.Text_IO;

-- Haz un programa de nombre nacimiento que pida por teclado la fecha de nacimiento y la muestre por pantalla
-- Declara de forma adecuada los tipos para el día, mes y año

procedure ej3_fechaNacimiento is

type dia_t is range 1..31; -- Rango de días no hace falta poner new Integer
type meses_t is (enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre); -- Enumerado de meses
type anio_t is range 1900..2020; -- Rango de años no hace falta poner new Integer 


package fechaNacimiento is new Ada.Text_IO.Integer_IO(dia_t); -- Paquete para leer y escribir días
use fechaNacimiento;

package mesNacimiento is new Ada.Text_IO.Enumeration_IO(meses_t); -- Paquete para leer y escribir meses
use mesNacimiento;

package anioNacimiento is new Ada.Text_IO.Integer_IO(anio_t); -- Paquete para leer y escribir años
use anioNacimiento;



dia: dia_t;
mes: meses_t;
anio: anio_t;

begin

    Put("Introduce el día de nacimiento: ");
    Get(dia);

    Put("Introduce el mes de nacimiento: ");
    Get(mes);

    Put("Introduce el año de nacimiento: ");
    Get(anio);

    Put_line("La fecha de tu nacimiento es " & dia_t'image(dia) & " del " & meses_t'image(mes) & " del " & anio_t'image(anio));


end ej3_fechaNacimiento;