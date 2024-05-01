-- Haz un programa de nombre puntuación que pida por teclado el número de canastas de 3, de 2 y personales y calcule los puntos totales del jugador, mostrándolos por pantalla


with Ada.Text_IO; use Ada.Text_IO;


procedure ej1_puntuacion is

package Integer_IO is new Ada.Text_IO.Integer_IO(Integer); -- Para leer enteros en este caso no renta crear un tipo nuevo para los enteros
use Integer_IO;

numero_triples: Integer;
numero_dobles: Integer;
numero_personales: Integer;
puntos_totales: Integer;

begin

put("Introduce el numero de triples del jugador 1: ");
get(numero_triples);

put("Introduce el numero de dobles del jugador 1: ");
get(numero_dobles);

put("Introduce el numero de personales del jugador 1: ");
get(numero_personales);

puntos_totales:= numero_triples*3 + numero_dobles*2 + numero_personales;

put("El jugador 1 ha conseguido un total de " & puntos_totales'Image & " puntos"); -- 'Image convierte el entero a string




end ej1_puntuacion;