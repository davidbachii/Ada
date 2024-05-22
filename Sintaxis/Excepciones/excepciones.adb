with Ada.Text_IO; use Ada.Text_IO;

procedure Excepciones is 

-- Constraint_Error: cuando se intenta violar una restricción impuesta en una declaración, tal como indexar más allá de los límites de un array o asignar a una variable un valor fuera del rango de su subtipo

-- Program_Error: se produce cuando se intenta violar la estructura de control, como cuando una función termina sin devolver un valor

-- Storage_Error: es elevada cuando se requiere más memoria de la disponible.

-- Tasking_Error: cuando hay errores en la comunicación y manejo de tareas.

-- Name_Error: se produce cuando se intenta abrir un fichero que no existe.

-- MIRAR PRACTICA DOS MANEJO DE EXCEPCIONES PARA ERRORES EN LAS FRACCIONES

package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);
use Integer_IO;

-- Se declara la variable
X : Integer;

begin

loop
    exit when x'valid; -- Verificamos si el valor es valido para asegurarnos que no se produzca un error
    -- Se abre la opcion de excepciones 
    exception
    when Constraint_Error =>
    Put (" Error de rango .") ;
    when Program_Error | Tasking_Error =>
    Put (" Error de flujo .") ;
    when others =>
    Put (" Otro error .");
    end ;
end loop ;

--Obviamente la sintaxis es erronea pero es para que quede claro el manejo de excepciones

-- Aseguramos que el dato sea valido si no lo es vamos a lanzar la excepcion , que puede ser las definidas por defecto en ada
-- o podemos crear nosotros una excepcion por ejemplo si el dato no es valido lanzamos una excepcion que diga "Dato no valido" o volvemos a pedir el dato 
-- hasta que sea valido


end Excepciones;