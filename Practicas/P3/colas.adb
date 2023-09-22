with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
package body Colas is
package Integer_Es is new Integer_Io (Integer);
use Integer_es;



n_actual : ref_Nodo ; -- Punteros a ref_nodo


procedure Poner (el_Elemento: elemento_t; en_la_Cola: in out cola_t) is
begin
-- Asignacion dinamica
n_actual := new Nodo ; -- Reservamos memoria para el nodo
n_actual.Dato := el_Elemento;
n_actual.ptr_Siguiente := NULL;

--Si no hay punteros en la cola le asigno el primer puntero a nuevo nodo
    if en_la_Cola.ptr_Primero = null then
        en_la_Cola.ptr_Primero := n_actual;
    else
    --Si ya hay ptr primero ya tiene valor al puntero ultimo le paso el puntero siguiente y le asigno el nodo actual
        en_la_Cola.ptr_Ultimo.ptr_Siguiente := n_actual;
    end if;
    en_la_Cola.ptr_Ultimo := n_actual;
    en_la_Cola.n_elementos := en_la_Cola.n_elementos +1 ;
end Poner;


procedure MostrarCola (La_Cola: cola_t) is
  
begin
--Le asigno al nodo que he creado el primer puntero de la cola y lo recorro hasta que se vacio y voy mostrando en cada posicion su elemento por pantalla
 n_actual := La_Cola.ptr_Primero;
    while n_actual /= null loop
        Put(ToString(n_actual.Dato));
        Put(" ");
        n_actual := n_actual.ptr_Siguiente;
    end loop;
    New_Line;
end MostrarCola;

procedure Liberar is new Ada.Unchecked_Deallocation(Nodo, ref_Nodo);

function Esta_Vacia (La_Cola: cola_t) return Boolean is 
begin 
--Simplemente compruebo si el primero elemento esta vacio, si lo esta devuelvo true , si no devuevlo false
if La_Cola.ptr_Primero = null then
return true;
else 
return false;
end if;
end Esta_Vacia;
function Esta_Llena (La_Cola: cola_t) return Boolean is 
begin 
--Simplemente compruebo si el primero elemento esta vacio, si lo esta devuelvo false , si no devuevlo true
if La_Cola.ptr_Primero = null then
return false;
else 
return true;
end if;
end Esta_Llena;

function "="(La_Cola, Con_La_Cola: cola_t) return Boolean is
--Creo dos nodos uno para cola 
    Nodo_Actual_1: ref_Nodo := La_Cola.ptr_Primero;
    Nodo_Actual_2: ref_Nodo := Con_La_Cola.ptr_Primero;
begin
--Recorro ambas colas hasta que esten vacias
    while Nodo_Actual_1 /= null and Nodo_Actual_2 /= null loop
        if Nodo_Actual_1.Dato /= Nodo_Actual_2.Dato then --Verifico si son iguales si no lanzo el nodo al siguiente puntero
            return false;
        end if;
        Nodo_Actual_1 := Nodo_Actual_1.ptr_Siguiente;
        Nodo_Actual_2 := Nodo_Actual_2.ptr_Siguiente;
    end loop;
    return Nodo_Actual_1 = null and Nodo_Actual_2 = null;
end "=";


procedure Liberar_Cola( La_Cola : in out cola_t ) is
    Nodo_Actual : ref_Nodo := La_Cola.ptr_Primero;
begin
--Funcion que vacia todos los elementos de la cola que en un futuro usare para copiar una cola en otra, usando la funcion liberar 
    while Nodo_Actual /= null loop
        La_Cola.ptr_Primero := Nodo_Actual.ptr_Siguiente;
        Liberar( Nodo_Actual );
        Nodo_Actual := La_Cola.ptr_Primero;
    end loop;
end Liberar_Cola;

procedure Copiar ( Origen: cola_t; Destino:in out cola_t) is
n_actual : ref_Nodo ; -- Punteros a ref_nodo
begin
--Vaciamos la cola destino y despues copiamos los elementos de la cola origen en la cola destino
Liberar_Cola(Destino);
n_actual := Origen.ptr_Primero;
 while n_actual /= null loop
       Poner(n_actual.Dato,Destino);
        n_actual := n_actual.ptr_Siguiente;
    end loop;

end Copiar;

procedure Quitar (un_Elemento: out elemento_t; de_la_Cola: in out cola_t) is
n_actual: ref_Nodo;
begin	
--Comprobamos primramente que la cola no este vacio si no lo esta, le asiganmos el primer nodo y vamos recorriendo la cola hasta dejarla vacia y usamos la funcion liberar para eliminar el nodo de memoria
	if(Esta_Vacia(de_la_Cola)) then
	   Put("Cola vacia");
	else
	  n_actual := de_la_Cola.ptr_Primero;
	  de_la_Cola.ptr_Primero := de_la_Cola.ptr_Primero.ptr_Siguiente;
			
	if(de_la_Cola.ptr_Primero=null) then
	  de_la_Cola.ptr_Ultimo := null;
	end if;
	un_Elemento := n_actual.Dato;
	n_actual.ptr_Siguiente := null;
	Liberar(n_actual);
	end if;
	end Quitar;

end Colas;
