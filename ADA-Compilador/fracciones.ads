with Ada.Text_IO; use Ada.Text_IO;

package fracciones is


type fraccion_t is private;


-- Constructor de números fraccionarios a partir de números enteros
function "/" (X, Y: Integer) return fraccion_t;

function "+" (A, B : fraccion_t) return fraccion_t;
function "-" (A, B : fraccion_t) return fraccion_t;
function "*" (A, B : fraccion_t) return fraccion_t;
function "/" (A, B : fraccion_t) return fraccion_t;
function "=" (A, B : fraccion_t) return Boolean;


function mcd (A, B : Integer) return Integer;
function mcm (A, B : Integer) return Integer;


function Numerador (A : fraccion_t) return Integer;
function Denominador (A : fraccion_t) return Integer;

-- Operaciones de entrada/salida con la consola
procedure Leer (F: out fraccion_t);
procedure Escribir (F: fraccion_t);

private

    type fraccion_t is record

        numerador : Integer;
        denominador : Integer;

    end record;

    
end fracciones;