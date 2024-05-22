with Ada.Text_IO, fracciones; use Ada.Text_IO, fracciones;
with Ada.Exceptions; use Ada.Exceptions;



procedure main is


-- Permitimos la entrada y salida de los enteros en este caso del numerador y denominador de la fraccion
package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);
use Integer_IO;

-- Definimos la excepcion de practica no apta

Practica_no_Apta: exception;


-- La fraccion espera dos enteros, el numerador y el denominador y se lo estamos pasando como uno partido de otro y eso no lo entiende

-- Luegi ahi que crear una funcion llamada "/" que le pases dos enteros con formador numerador / denomiador y te devuelva una fraccion_t

A: fraccion_t := 2/3;
B: fraccion_t := (-9)/18;
P: fraccion_t := 0/5;



begin

Put("El valor de A = ");
Escribir(A);
Put(" El valor de B = ");
Escribir(B);
Put(" El valor de P = ");
Escribir(P);
Put_Line(" ");

-- Operaciones de suma
Put("A+B = ");
Escribir(A+B);

-- Operaciones de resta
Put("A-B = ");
Escribir(A-B);


-- Operaciones de multiplicacion
Put("A*B = ");
Escribir(A*B);


-- Operaciones de division
Put("A/B = ");
Escribir(A/B);





-- Creamos el apartado de las excepciones

exception
    when Ocurrencia : Practica_no_Apta => 
        Put_line ("Práctica no apta.");
        Put (Ada.Exceptions.Exception_Information (Ocurrencia));
    when Ocurrencia : Constraint_Error =>
        Put_Line ("Práctica no apta:");
        Put_Line ("Las fracciones tienen que representarse mediante");
        Put_Line ("fracciones irreducibles");
        Put_Line ("Es necesario reducir las fracciones");
        Put_Line (Ada.Exceptions.Exception_Information (Ocurrencia));
    when Ocurrencia : others =>
        Put_Line ("Práctica no apta:");
        Put_Line ("Error no controlado");
        Put_Line (Ada.Exceptions.Exception_Information (Ocurrencia));
end main;