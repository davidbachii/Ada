generic
type elemento_t is private;
with function ToString(el_Elemento: elemento_t) return string;
package Colas is
type cola_t is limited private;

procedure Poner (el_Elemento: elemento_t; en_la_Cola: in out cola_t);
procedure Quitar (un_Elemento: out elemento_t; de_la_Cola: in out cola_t);
function Esta_Vacia (La_Cola: cola_t) return Boolean;
function Esta_Llena (La_Cola: cola_t) return Boolean;
procedure MostrarCola (La_Cola: cola_t);
procedure Copiar ( Origen: cola_t; Destino:in out cola_t);


procedure Liberar_Cola( La_Cola : in out cola_t );
function "="(La_Cola, Con_La_Cola: cola_t) return Boolean;
private
-- Definición del tipo "cola_t"
-- En esta ocasión se implementa una cola dinámica
type Nodo;
type ref_Nodo is access Nodo;
type Nodo is record
Dato: elemento_t;
ptr_Siguiente: ref_Nodo;
end record;
type cola_t is record
ptr_Primero,
ptr_Ultimo : ref_Nodo;
n_elementos: Integer := 0;
end record;
end Colas;
