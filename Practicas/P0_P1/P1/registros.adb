-- Paquete estándar que vamos a manejar.
with Ada.Text_Io; use Ada.Text_Io;

--LA TABLA DE LA PARTE B DEL PROBLEMA
--Número entero más pequeño-->-2147483648
--Número entero más grande-->2147483647
--Número natural más pequeño-->0
--Número positivo más pequeño--> 1
--Número de dígitos significativos de los números reales-->7
procedure registros is 

package Ent_Es is new Ada.Text_Io.Integer_Io( Integer );
use Ent_Es;
--Estas dos variables serviran para saber en que posicion del array esta el maximo y el minimo
encontradoMinimo: Boolean := False;
encontradoMaximo: Boolean := False;
I, J,posicionMin,posicionMax: Integer;
media : Float;

-- Definimos los parametros de fehca y sus respectivos paquetes para poder hacer entradas y salidas por pantalla
--TEMPERATURA
type temperatura_t is delta 0.01 range -25.0..75.0;
package ES_temperatura_t is new Ada.Text_Io.Fixed_Io(temperatura_t);
use ES_temperatura_t;
--DIAS
type dias_t is range 1..31;
package ES_dias_t is new Ada.Text_Io.Integer_Io(dias_t);
use Es_dias_t;
--MESES
type meses_t is (enero , febrero , marzo , abril , mayo , junio , julio, agosto, septiembre, octubre, noviembre , diciembre);
package ES_meses_t is new Ada.Text_Io.Enumeration_Io(meses_t);
use ES_meses_t ;
--ANNO
type year_t is range 1900..2100;
package ES_year_t is new Ada.Text_Io.Integer_Io(year_t);
use ES_year_t;

type fecha_t is record
Dia : dias_t ;
Mes : meses_t ;
Year : year_t ;
temp : temperatura_t;
end record ;


type fecha_array is array ( Positive range <> ) of fecha_t ;
-- Creamos un tipo puntero al tipo anterior
type pArray_t is access fecha_array ;
-- Declaramos una variable de tipo puntero a array_t
v: pArray_t ;
--Maximo, Minimo y Media
minimo : temperatura_t;
maximo : temperatura_t;
suma : temperatura_t;
begin
	--Primero obtenemos el numero de parametros y lo almacenamos en la variable I previamente definida
	New_Line;
	Put ("Introduce cuantos valores vas a introducir: ");
	get (I);
	J :=1;
	--Declaramos una nueva instancia al array en el que vamos a almacenar las fechas 
	v:= new fecha_array(1..I) ;
	while J<= I loop
		New_Line; --Salto de linea
		Put ("Introduce el dia: ");
		get(v(J).Dia);
		Put ("Introduce el mes: ");
		get(v(J).Mes);
		Put ("Introduce el anno: ");
		get(v(J).Year);
		Put ("Introduce la temperatura en grados:");
		get(v(J).temp);
		J := J +1;
	end loop ;
	--Empezamos declarando el minimo como la primera posicion del array y vamos comprobando numero a numero del array si es menor y si los es lo declaramos como el nuevo minimo
	minimo := v(1).temp;
	for I in v'Range loop
      		if v(I).temp < minimo then
    		minimo := v(I).temp;
  		end if;
   	end loop;
   	--Empezamos declarando el maximo como la primera posicion del array y vamos comprobando numero a numero del array si es mayor y si los es lo declaramos como el nuevo maximo
   	maximo := v(1).temp;
	for I in v'Range loop
      		if v(I).temp > maximo then
    		maximo := v(I).temp;
  		end if;
   	end loop;
   	
   	for I in v'Range loop
   		
    		suma := v(I).temp+ suma;
    	end loop;
    	media := Float(suma)/Float(I);	--Para calcular la media en este caso necesito la suma de temperaturas y el numero de temperaturas I, como una es de tipo temperatura_t y la otra 
    	--de tipo int por lo que , hago esta conversion a float que es la unica que me deja hacer temperatura_t
    		
    	--Recooremos ek array en base a los booleanos creados , si el minimo es igual al numero del array, es que esta en esa posicion por lo que ponemos la varibale en true y salimos del bucle
    	-- si no es igual pues le sumamos uno a posicion y pasamos a la siguiente posicion del array y comprobamos hasta encontrar el valor .
        posicionMin := 1;
  	for I in v'Range loop
      		if minimo = v(I).temp  then
      		encontradoMinimo := True;
      		elsif encontradoMinimo = False then
    		posicionMin := posicionMin +1;
   		end if;
   	end loop;
   	--Recooremos ek array en base a los booleanos creados , si el maximo es igual al numero del array, es que esta en esa posicion por lo que ponemos la varibale en true y salimos del bucle
    	-- si no es igual pues le sumamos uno a posicion y pasamos a la siguiente posicion del array y comprobamos hasta encontrar el valor .
   	posicionMax := 1;
   	for I in v'Range loop
      		if maximo = v(I).temp  then
      		encontradoMaximo := True;
      		elsif encontradoMaximo = False then
    		posicionMax := posicionMax +1;
   		end if;
   	end loop;
   	--Mostramos por pantalla el maximo el minimo la media y las fehcas registradas de ambas
   	Put("Temperatura minima: " & minimo'Image );
   	Put(" grados, alcanzados el" & v(posicionMin).dia'Image );
   	Put(" de " & v(posicionMin).Mes'Image );
   	Put(" de " & v(posicionMin).Year'Image );
   	New_Line;
   	Put("Temperatura maxima: " & maximo'Image);
   	Put(" grados, alcanzados el" & v(posicionMax).dia'Image );
   	Put(" de" & v(posicionMax).Mes'Image );
   	Put(" de" & v(posicionMax).Year'Image );
   	New_line;
   	Put("La temperatura media del periodo" & v(1).dia'Image);
   	Put(" de " & v(1).Mes'Image );
   	Put(" de " & v(1).Year'Image );
   	Put(" al" & v(v'Last).Dia'Image);
   	Put(" de" & v(v'Last).Mes'Image );
   	Put(" de " & v(v'Last).Year'Image );
   	Put(" ha sido de" & media'Image );
   	Put(" grados");


end registros;





