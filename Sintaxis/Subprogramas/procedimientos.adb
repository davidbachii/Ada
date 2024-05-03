with Ada.Text_IO; use Ada.Text_IO;

-- PROCEDIMIENTOS 

-- No retornan ningún valor pero si se pueden modificar sus valores
-- Sus parámetros pueden ser in, out o in out
-- Por omisión son in


-- La diferencia entre in y out es que in es para leer (es decir esos datos no se pueden modificar) y out (es decir esos datos no se pueden modificar) para escribir
-- in out es para leer y escribir

with Ada . Numerics . Elementary_Functions ;
use Ada . Numerics . Elementary_Functions ;
-- Interfaz
procedure resolver (A ,B ,C : Float ; R1 , R2 : out Float ; ok : out Boolean ) is
Z: Float ; -- variable local
begin -- Cuerpo
Z := B* B - 4.0* A*C ;
if Z< 0.0 or A = 0.0 then
Ok := false ;
else
Ok := true ;
R1 := (-B+ sqrt (z)) /( 2.0* A );
R2 := (-B - sqrt (z)) /( 2.0* A );
end if;
end resolver ;

-- Entre el is y el begin se definen las variables locales que se van a utilizar en el procedimiento


-- FUNCIONES

-- Retornan un valor y no pueden modificar sus parámetros
-- Sus parámetros pueden ser in o in out
-- Por omisión son in

function minimo (X , Y: Float ) return Float is
begin
if X>Y then
return Y;
else
return X;
end if;
end minimo ;
