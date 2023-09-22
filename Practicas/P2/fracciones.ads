with Ada.Text_Io; use Ada.Text_Io;
package fracciones is
 type fraccion_t is private;
 

 -- Constructor de números fraccionarios a partir de números enteros
 function "/" (X, Y: Integer) return fraccion_t;

 function "+" (X, Y: fraccion_t) return fraccion_t;      
 function "-" (X: fraccion_t) return fraccion_t;
 function "-" (X, Y: fraccion_t) return fraccion_t;
 function "*" (X, Y: fraccion_t) return fraccion_t;
 function "/" (X, Y: fraccion_t) return fraccion_t;
 function "=" (X, Y: fraccion_t) return Boolean;
 function MCD (A, B : Integer) return Integer;

 function Es_Negativo (n : Integer) return Boolean;
 -- Operaciones de entrada/salida con la consola
 procedure Leer (F: out fraccion_t);
 procedure Escribir (F: fraccion_t);


 -- Operaciones para obtener las partes de una fracción
 function Numerador (F: fraccion_t) return Integer;
 function Denominador(F:fraccion_t) return Positive;

 private
 type fraccion_t is record
 	Num: Integer;
 	Den: Positive;
 end record;
end fracciones;
