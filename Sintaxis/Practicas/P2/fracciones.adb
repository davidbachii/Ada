with Ada.Text_IO;  use Ada.Text_IO;
package body fracciones is
package Integer_Es is new Integer_Io (Integer);
use Integer_es;



--FUNCION PARA CALCULAR EL MAXIMO COMUN DIVISOR QUE SERA USADA EN EL RESTO DE FUNCIONES PARA SIMPLIFICAR LAS FRACCIONES

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
   
--FUNCION PARA MOSTRAR POR PANTALLA LA FUNCIN REQUERIDA
 procedure Escribir(F: fraccion_t) is
begin
  Put(F.Num);
  Put("/");
  Put(F.Den);
  New_line;
end Escribir;
 
procedure Leer(F: out fraccion_t) is
begin
    -- Lee el numerador desde la consola y lo almacena en F.Num
    Put("Numerador: ");
    Get(F.Num);

    -- Lee el denominador desde la consola y lo almacena en F.Den
    Put("Denominador: ");
    Get(F.Den);

    -- Verifica que el denominador no sea cero o negativo
    if F.Den <= 0 then
        raise Constraint_Error with "El denominador no puede ser cero o negativo";
    end if;

end Leer;
--FUNCION QUE TE DEVUELVE EL NUMERADOR DE LA FRACCION
function Numerador(F: fraccion_t) return Integer is
begin
  return F.Num;
end Numerador;
--FUNCION QUE TE DEVUELVE EL DENOMINADOR DE LA FRACCION
function Denominador(F: fraccion_t) return Positive is
begin
  return F.Den;
end Denominador;
--FUNCION PARA SABER SI UN PARAMETRO INTRODUCIDO ES NEGATIVO AUN QUE VALE CON PONER <0, PERO AQUI DEVUELVE UN BOOLEANO
function Es_Negativo (n : Integer) return Boolean is
begin
   if n < 0 then
      return True;
   else
      return False;
   end if;
end Es_Negativo;

--FUNCION CONSTRUCOR
function "/" (X, Y: Integer) return fraccion_t is
  F: fraccion_t;
  MCD_Num : Integer;
begin
  MCD_Num := MCD(X,Y);--OBTENGO EL Maximo Comun Divisor 
  --put(MCD_Num);
  if  Y = 0 then --SI EL DENOMINADOR ES IGUAL A 0, HAGO EL CAMBIO RESPECTIVO Y LE APLICO EL MCD 10/0 --> 0/1
  F.Num := Y;
  F.Den := X/MCD_Num;
  elsif Es_Negativo(Y) then --Si y es negativa por ejemplo 1/-2 tengo que poner -1/2
  F.Num := -(X/MCD_NUM);
  F.Den := Abs(Y/MCD_NUM);
  else  --SI EL DENOMINADOR ES > QUE 0 OPERACION NORMAL CON EL MCD
  F.Num := X/MCD_Num;
  F.Den := Y/MCD_Num; 
  end if;
  return F;
end "/";


--FUNCION SUMA , TODAS SIGUEN EL MISMO PROCEDIMIENTO CHECKEO SI EL DENOMINADOR ES MENOR O IGUAL QUE 0 Y HAGO SUS PERTINENTES CAMBIOS Y SI NO LO ES LA OPERACION ESTANDAR
function "+" (X, Y: fraccion_t) return fraccion_t is 
    Resultado: fraccion_t;
    MCD_x : Integer;
begin
    
    if (X.Den * Y.Den) = 0 then  --Si me queda 10/0 tengo que tener 0/10
    
    Resultado.Num := X.Den * Y.Den ; --Obtengo el numeradr
    Resultado.Den := X.Num * Y.Den + Y.Num * X.Den;--Obtengo el denominador 
    MCD_x := MCD(Resultado.Num, Resultado.Den);--Les aplico el mcd por si se puede simplificar la fraccion
    Resultado.Num := X.Den * Y.Den/MCD_x ;
    Resultado.Den := X.Num * Y.Den + Y.Num * X.Den/MCD_x ;
    
    elsif (X.Den * Y.Den) <0 then  --Si y es negativa por ejemplo 1/-2 tengo que poner -1/2
    Resultado.Num := -(X.Num * Y.Den + Y.Num * X.Den) ;--Obtengo el numerador
    Resultado.Den := Abs(X.Den * Y.Den) ;--Obtengo el denominador 
    MCD_x := MCD(Resultado.Num, Resultado.Den);--Les aplico el mcd por si se puede simplificar la fraccion
    Resultado.Num := -(X.Num * Y.Den + Y.Num * X.Den/MCD_x) ;
    Resultado.Den := Abs(X.Den * Y.Den/MCD_x);
    else  --HAGO LA OPERACION ESTANDAR Y USO EL MCD PARA SIMPLIFICAR
    Resultado.Num := X.Num * Y.Den + Y.Num * X.Den;
    Resultado.Den := X.Den * Y.Den;
    MCD_x := MCD(Resultado.Num, Resultado.Den);
    Resultado.Num := X.Num * Y.Den + Y.Num * X.Den/MCD_x ;
    Resultado.Den := X.Den * Y.Den/MCD_x ;
    end if;
    return Resultado;
end "+";

--FUNCION RESTA , TODAS SIGUEN EL MISMO PROCEDIMIENTO CHECKEO SI EL DENOMINADOR ES MENOR O IGUAL QUE 0 Y HAGO SUS PERTINENTES CAMBIOS Y SI NO LO ES LA OPERACION ESTANDAR
function "-" (X, Y: fraccion_t) return fraccion_t is
    Result: fraccion_t;
    MCM: Integer;
begin
    -- calcula el mínimo común múltiplo de los denominadores
    MCM := X.Den * Y.Den / MCD(X.Den, Y.Den);
    if MCM = 0 then  --Si me queda 10/0 tengo que tener 0/10
    Result.Num := MCM;
    Result.Den := X.Num * (MCM/X.Den) - Y.Num * (MCM/Y.Den);
    elsif MCM < 0 then  --Si y es negativa por ejemplo 1/-2 tengo que poner -1/2
    Result.Num := -(X.Num * (MCM/X.Den) - Y.Num * (MCM/Y.Den)) ;
    Result.Den := Abs(MCM);
    else
    -- realiza la resta de fracciones con denominador común
    Result.Num := X.Num * (MCM/X.Den) - Y.Num * (MCM/Y.Den);
    Result.Den := MCM;
    end if;
    return Result;
end "-";


--FUNCION DIVISION , TODAS SIGUEN EL MISMO PROCEDIMIENTO CHECKEO SI EL DENOMINADOR ES MENOR O IGUAL QUE 0 Y HAGO SUS PERTINENTES CAMBIOS Y SI NO LO ES LA OPERACION ESTANDAR
function "/" (X, Y: fraccion_t) return fraccion_t is 
    Resultado: fraccion_t;
    MCD_x : Integer;
begin
   
    if (X.Den * Y.Num) = 0 then  --CHEKEO SI EL DENOMINADOR ES IGUAL A 0, Si me queda 10/0 tengo que tener 0/1
    
    Resultado.Num := X.Den * Y.Num ;--Obtengo el numerador
    Resultado.Den := X.Num * Y.Den;--Obtengo el denominador
    MCD_x := MCD(Resultado.Num, Resultado.Den);--Les aplico el mcd por si se puede simplificar la fraccion
    Resultado.Num := X.Den * Y.Num/MCD_x ;
    Resultado.Den := X.Num * Y.Den/MCD_x ;
    
    elsif (X.Den * Y.Num) <0 then  --Si y es negativa por ejemplo 1/-2 tengo que poner -1/2
    Resultado.Num := -(X.Num * Y.Den) ;--Obtengo el denominador
    Resultado.Den := Abs(X.Den * Y.Num) ;--Obtengo el denominador
    MCD_x := MCD(Resultado.Num, Resultado.Den);--Les aplico el mcd por si se puede simplificar la fraccion
    Resultado.Num := -(X.Num * Y.Den/MCD_x) ;
    Resultado.Den := Abs(X.Den * Y.Num/MCD_x);
    else 
    Resultado.Num := X.Num * Y.Den;--Obtengo el numerador
    Resultado.Den := X.Den * Y.Num;
    MCD_x := MCD(Resultado.Num, Resultado.Den);--Les aplico el mcd por si se puede simplificar la fraccion
    Resultado.Num := X.Den * Y.Num/MCD_x ;
    Resultado.Den := X.Num * Y.Den/MCD_x ;
    end if;
     
    return Resultado;

end "/";

--FUNCION DIVISION , TODAS SIGUEN EL MISMO PROCEDIMIENTO CHECKEO SI EL DENOMINADOR ES MENOR O IGUAL QUE 0 Y HAGO SUS PERTINENTES CAMBIOS Y SI NO LO ES LA OPERACION ESTANDAR
function "*" (X, Y: fraccion_t) return fraccion_t is 
    Resultado: fraccion_t;
    MCD_Num : Integer;
begin
   if (X.Den * Y.Den) = 0 then  --Si me queda 10/0 tengo que tener 0/10
    
    Resultado.Num := X.Den * Y.Den ;
    Resultado.Den := X.Num * Y.Num;
    MCD_Num := MCD(Resultado.Num, Resultado.Den);
    Resultado.Num := X.Den * Y.Den/MCD_Num ;
    Resultado.Den := X.Num * Y.Num/MCD_Num ;
    
    elsif (X.Den * Y.Den) <0 then  --Si y es negativa por ejemplo 1/-2 tengo que poner -1/2
    Resultado.Num := -(X.Num * Y.Num) ;
    Resultado.Den := Abs(X.Den * Y.Den) ;
    MCD_Num := MCD(Resultado.Num, Resultado.Den);
    Resultado.Num := -(X.Num * Y.Num/MCD_Num) ;
    Resultado.Den := Abs(X.Den * Y.Den/MCD_Num);
    else 
    Resultado.Num := X.Num * Y.Num;
    Resultado.Den := X.Den * Y.Den;
    MCD_Num := MCD(Resultado.Num, Resultado.Den);
    Resultado.Num := X.Num * Y.Num/MCD_Num ;
    Resultado.Den := X.Den * Y.Den/MCD_Num ;
    end if;
     
    return Resultado;
   
end "*";
--FUNCION QUE CALCULA EL OPUESTO
function "-" (X: fraccion_t) return fraccion_t is
    Result: fraccion_t;
begin
    Result.Num := -X.Num;
    Result.Den := X.Den;
    return Result;
end "-";
--FUNCION QUE DEVUELVE SI DOS FRACCIONES ESTAN IGUALES
function "=" (X, Y: fraccion_t) return Boolean is
begin
    -- Compara las fracciones X e Y comparando sus términos numerador y denominador
    return X.Num * Y.Den = Y.Num * X.Den;
end "=";
end fracciones;
    
