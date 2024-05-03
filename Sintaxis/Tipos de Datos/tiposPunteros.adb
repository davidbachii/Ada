with Ada.Text_IO; use Ada.Text_IO;


--PUNTEROS A TIPOS PRIMITIVOS
--Tipo de puntero a entero
type pInteger_t is access Integer; 
--accedemos a ese puntero
A1: pInteger_t := new Integer'(1); --creamos un puntero a entero y le asignamos el valor 1

--Accedemos al valor del puntero
Put_Line(Integer'Image(A1.all)); --Imprime el valor del puntero



--PUNTEROS A ARRAYS
-- Creamos un tipo array no restringido
type array_t is array ( integer range <>) of integer ;
-- Creamos un tipo puntero al tipo anterior
type pArray_t is access array_t ;
-- Declaramos una variable de tipo puntero a array_t
v : pArray_t ;
-- Dinamicamente reservamos memoria del tamano deseado
v := new array_t ( 1..5) ; -- Reservamos memoria para un array de 5 elem


--PUNTEROS A TIPOS DEFINIDOS POR EL USUARIO
type pfloating_t is access Float;
A2: pfloating_t := new Float'(1.0); --creamos un puntero a float y le asignamos el valor 1.0

--Accedemos al valor del puntero
Put_Line(Float'Image(A2.all)); --Imprime el valor del puntero



--DIFERENCIA ENTRE USAR TIPOS DE DATOS DERIVADOS O PUNTEROS 

--USANDO TIPOS DE DATOS DERIVADOS
type array_t is array ( integer range <>) of integer ;
v : array_t ( 1..5) ; -- Reservamos memoria para un array de 5 elem

--USANDO PUNTEROS
type pArray_t is access array_t ;
v : pArray_t := new array_t ( 1..5) ; -- Reservamos memoria para un array de 5 elem

--En el caso de los punteros, se puede cambiar el tamano del array en tiempo de ejecucion
v := new array_t ( 1..10) ; -- Reservamos memoria para un array de 10 elem

--En el caso de los tipos de datos derivados, no se puede cambiar el tamano del array en tiempo de ejecucion
--v := array_t ( 1..10) ; -- Reservamos memoria para un array de 10 elem

