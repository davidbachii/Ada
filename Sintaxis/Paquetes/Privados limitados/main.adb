with Adat.Text_IO; use Adat.Text_IO;

with privado; use privado; -- import the package publico to use the functions and procedures defined in it

procedure main is 

b1 : target_t;
b2 : target_t;


begin

b1 := Asignar_blanco(4 , 7);

Imprimir_blanco(b1);

-- b1.y := -3; -- Error es privado y no se puede acceder a el desde el main

Imprimir_blanco(b1);

-- b2 := b1; -- No Podemos hacer copias de registros 

Imprimir_blanco(b2);

end main;


-- Ese tipo no es accesible desde principal.adb, y no se puede copiar o comparar. No se puede asignar un valor inicial