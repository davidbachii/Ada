with Ada.Text_IO; use Ada.Text_IO;





   type My_Array is array (Positive range <>) of Integer; -- Definimos un tipo de array de enteros 
   type My_Array_Access is access My_Array;  --Creamos un puntero a el tipo de array de enteros que hemos creado
   type My_Array_Access_Access is access My_Array_Access; --Creamos un puntero a el puntero de el tipo de array de enteros que hemos creado



   -- La diferencia que a los punteros en ejecucion si se le puede modificar el tamaño del array o los datos de este 
  
    --Formas de inicializar un array de enteros
   A : My_Array (1 .. 3) := (1, 2, 3);
   A1: My_Array := (1 => 1, 2 => 2, 3 => 3);
   A2: My_Array := (others => 0); --Inicializamos todos los elementos a 0
   A4: My_Array := (1 => 1, others => 0); --Inicializamos el primer elemento a 1 y el resto a 0

    

   B : My_Array_Access := new My_Array'(1 .. 3 => 4); --Creamos un puntero a un array de enteros de 3 elementos con valor 4
   C : My_Array_Access_Access := new My_Array_Access'(1 .. 3 => new My_Array'(1 .. 3 => 5));


