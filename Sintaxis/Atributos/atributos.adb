with Ada.Text_IO; use Ada.Text_IO;

--M : array (1..2 , 0..5) of integer ;

-- type meses_t is (Enero, Febrero, Marzo, Abril, Mayo, Junio) ;

-- package Meses is new Ada.Text_IO.Enumeration_IO (meses_t) ;
-- use Meses ;

-- meses: meses_t ;

-- Atributos aplicables a los tipos de datos

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Image:  Devuelve una cadena (String) con la representación del valor de la variable.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- First: Indica el mínimo valor que puede tomar una variable de un tipo discreto, sea entero o enumeración. Se usa con la forma T’First, siendo T un tipo discreto (entero o enumeración).

-- Integer ’ First -- Primer valor entero
-- M ’ First (1) ; -- 1
-- M ’ First ; -- 1
-- M ’ First (2) ; -- 0


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Last: Indica el máximo valor que puede tomar una variable de un tipo discreto, sea entero o enumeración.

-- Integer ’ Last -- Ultimo valor entero

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Pos: Indica la posición ocupada por un determinado valor en un tipo enumeración. La primera posición se considera 0.

-- Pos (M ’ First) ; -- 0
-- Pos (M ’ Last) ; -- 5

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Length: Devuelve el número de elementos de un tipo de datos compuesto, como un array o una cadena.

-- M ’ Length (1) -- 2
-- M ’ Length (2) ; -- 6

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Val: Devuelve el valor de un tipo enumerado que ocupa una determinada posición.

-- Val (0) ; -- M ’ First
-- Val (5) ; -- M ’ Last

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Succ: Devuelve el valor siguiente a un valor dado en un tipo enumerado.

    --  meses := Enero;
    --  Put_Line (Image (meses));
    --  meses := Succ (meses);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Pred: Devuelve el valor anterior a un valor dado en un tipo enumerado.

    --  meses := Junio;
    --  Put_Line (Image (meses));
    --  meses := Pred (meses);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Digits: Representa el número de decimales de la mantisa de un tipo flotante.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Rounding: Indica el método de redondeo que se aplica a un tipo flotante. Puede ser Round_Up, Round_Down, Round_Nearest, Round_Toward_Zero.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Valid: Indica si un valor de un tipo flotante es válido o no.

-- Resultado : Natural ;

-- if not Resultado ’ Valid then
-- ’Resultado ’ esta fuera del rango , con valor negativo
-- Result := Natural ’ First ;
-- end if

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Range: Devuelve el rango de valores que puede tomar un tipo discreto.