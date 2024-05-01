--TIPOS DE DATOS DEFINIDOS POR EL USUARIO
--TIPOS DE DATOS DEFINIDOS POR EL USUARIO: se pueden definir nuevos tipos de datos a partir de los tipos de datos predefinidos en Ada (Integer, Float, etc.)
-- mediante el uso de los tipos derivados y subtipos

-- Tipo derivado de Integer
type edad_t is new Integer range 0..100; -- Tipo derivado de Integer con rango de 0 a 100

-- Subtipo (el tipo es Integer )
Subtype edad2_t is Integer range 0..120; -- Subtipo de Integer con rango de 0 a 120

-- Variables
A: Integer := 50; -- Variable de tipo Integer
B: edad_t ; -- Variable de tipo edad_t
C: edad2_t ; -- Variable de tipo edad2_t (de tipo Integer )

B := A; -- Error de tipo ya que A es de tipo Integer y B es de tipo edad_t
C := A; -- Legal ya que A es de tipo Integer y C es de tipo edad2_t (subtipo de Integer )
C := B; -- Error de tipo ya que B es de tipo edad_t y C es de tipo edad2_t
C :=130; -- Ilegal , fuera de rango


--Tipo derivado de Positive
type dias_t is new Positive range 1..31;

--Subtipo (el tipo es Positive)
Subtype dias2_t is Positive range 1..30;

--Variables
D: Positive := 10;
E: dias_t;
F: dias2_t;

E := D; -- Error de tipo ya que D es de tipo Positive y E es de tipo dias_t
F := D; -- Legal ya que D es de tipo Positive y F es de tipo dias2_t (subtipo de Positive)
F := E; -- Error de tipo ya que E es de tipo dias_t y F es de tipo dias2_t
F := 40; -- Ilegal, fuera de rango

--Tipo derivado de Natural
type meses_t is new Natural range 1..12;

--Subtipo (el tipo es Natural)
Subtype meses2_t is Natural range 1..11;

--Variables
G: Natural := 5;
H: meses_t;
I: meses2_t;

H := G; -- Error de tipo ya que G es de tipo Natural y H es de tipo meses_t
I := G; -- Legal ya que G es de tipo Natural y I es de tipo meses2_t (subtipo de Natural)
I := H; -- Error de tipo ya que H es de tipo meses_t y I es de tipo meses2_t
I := 20; -- Ilegal, fuera de rango




