--TIPO DERIVIADO: es construido a partir de otro existente, por lo que hereda sus características, pero tiene un nombre distinto y
-- puede tener un rango de valores distinto

--SUBTIPO: permite asignarle un nombre y rango nuevos a un tipo ya existente, pero sin crear un tipo nuevo


-- Tipo derivado de Float
type masa1_t is new Float range 0.0..10 _000 .0;  -- Tipo derivado de Float con rango de 0.0 a 10.000.0 HEREDA DE FLOAR PERO CREO UN TIPO NUEVO (FIJARSE EN EL NEW FLOAT)
-- Subtipo (el tipo es Float )
Subtype masa2_t is Float range 0.0..12 _000 .0;   -- Subtipo de Float con rango de 0.0 a 12.000.0 HEREDA DE FLOAT PERO NO CREA UN TIPO NUEVO POR LO QUE SIGUE SIENDO UN FLOAT (NO TIENE NEW)


-- Variables
X: Float := 5 _000 ; -- Variable de tipo Float
Y: masa1_t ; -- Variable de tipo masa1_t
Z: masa2_t ; -- Variable de tipo masa2_t (de tipo Float )

Y := X; -- Error de tipo ya que X es de tipo Float y Y es de tipo masa1_t 
Z := X; -- Legal ya que X es de tipo Float y Z es de tipo masa2_t (subtipo de Float )
Z := Y; -- Error de tipo ya que Y es de tipo masa1_t y Z es de tipo masa2_t
Z :=20 _000 .0; -- Ilegal , fuera de rango


-- DIGITS: Especifica el número de dígitos que se pueden almacenar en un tipo de datos numérico
-- RANGE: Especifica el rango de valores que se pueden almacenar en un tipo de datos numérico
-- Al combinarlos hace que sean 9 decimales y una cifra antes de la coma
type real_t is new Float digits 10 range -1.0..1.0;


-- DELTA: Especifica la diferencia entre valores consecutivos que se pueden almacenar en un tipo de datos numérico
-- Tipo en coma fija
-- Delta ( Diferencia entre valores consecutivos ) de 0.125
-- Range en el intervalo [0.0 , 12.0]
type masa_t is delta 0.125 range 0.0..12.0;