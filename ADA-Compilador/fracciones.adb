with Ada.Text_IO; use Ada.Text_IO;

package body fracciones is



package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);
use Integer_IO;


-- Funcion que calcula el mcd
function MCD (A, B : Integer) return Integer is
	X: Integer;
	Y: Integer;
	R: Integer := 0;
begin
	
	X := abs(A);
	Y := abs(B);
	while Y >= 1 loop
		R:= X rem Y;
		X := Y;
		Y := R;
	end loop;
	return X;
end MCD;


-- Funcion que calcula el mcm
function mcm (a, b : integer) return integer is
    begin
        return (a * b) / mcd(a, b);
end mcm;



-- Funcion de suma
function "+" (A, B : fraccion_t) return fraccion_t is
    fraccion_suma : fraccion_t;
    begin

        fraccion_suma.numerador := A.numerador * B.denominador + B.numerador * A.denominador;
        fraccion_suma.denominador := A.denominador * B.denominador;       

    return fraccion_suma;
end "+";


-- Funcion de resta
function "-" (A, B : fraccion_t) return fraccion_t is
    fraccion_resta : fraccion_t;
    begin

        fraccion_resta.numerador := A.numerador * B.denominador - B.numerador * A.denominador;
        fraccion_resta.denominador := A.denominador * B.denominador;

    return fraccion_resta;
end "-";


-- Funcion de multiplicacion
function "*" (A, B : fraccion_t) return fraccion_t is
    fraccion_multiplicacion : fraccion_t;
    begin

        fraccion_multiplicacion.numerador := A.numerador * B.numerador;
        fraccion_multiplicacion.denominador := A.denominador * B.denominador;

    return fraccion_multiplicacion;
end "*";

-- Funcion de division usando el mcd
function "/" (A, B : fraccion_t) return fraccion_t is
    fraccion_division : fraccion_t;
    begin

        fraccion_division.numerador := mcd(A.numerador, B.denominador) * B.numerador;
        fraccion_division.denominador := mcd(A.numerador, B.denominador) * B.denominador;

    return fraccion_division;
end "/";


--FUNCION PARA MOSTRAR POR PANTALLA LA FUNCIN REQUERIDA
procedure Escribir(F: fraccion_t) is
begin
    Put(F.numerador);
    Put("/");
    Put(F.denominador);
    New_line;
end Escribir;



procedure Leer(F: out fraccion_t) is
begin
    -- Lee el numerador desde la consola y lo almacena en F.Num
    Put("Numerador: ");
    Get(F.numerador);

    -- Lee el denominador desde la consola y lo almacena en F.Den
    Put("Denominador: ");
    Get(F.denominador);

    -- Verifica que el denominador no sea cero o negativo
    if F.denominador <= 0 then
        raise Constraint_Error with "El denominador no puede ser cero o negativo";
    end if;

end Leer;



-- Constructor de números fraccionarios a partir de números enteros
function "/" (X, Y: Integer) return fraccion_t is
    F: fraccion_t;
begin

    F.numerador := X;
    F.denominador := Y;

    -- Verifica que el denominador no sea cero o negativo
    if F.denominador <= 0 then
        raise Constraint_Error with "El denominador no puede ser cero o negativo";
    end if;

    return F;

end "/";

--FUNCION QUE TE DEVUELVE EL NUMERADOR DE LA FRACCION
function Numerador(A: fraccion_t) return Integer is
begin
return A.numerador;
end Numerador;


--FUNCION QUE TE DEVUELVE EL DENOMINADOR DE LA FRACCION
function Denominador(A: fraccion_t) return Integer is
begin
return A.denominador;
end Denominador;


--FUNCION QUE DEVUELVE SI DOS FRACCIONES ESTAN IGUALES
function "=" (A, B: fraccion_t) return Boolean is
begin
    -- Compara las fracciones X e Y comparando sus términos numerador y denominador
    return A.numerador * B.denominador = B.numerador * A.denominador;
end "=";

end fracciones;