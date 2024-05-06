with Adat.Text_IO; use Adat.Text_IO;

with publico; use publico; -- import the package publico to use the functions and procedures defined in it

procedure main is 

b1 : target_t;


begin

b1 := Asignar_blanco(4 , 7);

Imprimir_blanco(b1);

b1.y := -3; -- Cualquiera puede modificar este contenido ya que es clase publica

Imprimir_blanco(b1);

end main;


-- en Ada puedes definir registros, variables, funciones y procedimientos en un archivo de especificación de paquete (.ads).

-- Las funciones y los procedimientos definidos en la especificación del paquete son subprogramas públicos. Pueden ser llamados desde cualquier lugar donde el paquete sea visible.

-- En tu ejemplo, el paquete publico define un tipo de registro target_t y dos subprogramas, Asignar_blanco y Imprimir_blanco. Estos son utilizados en el procedimiento main en el archivo main.adb, que importa el paquete publico con la declaración with publico; use publico;.