with Ada.Text_IO; use Ada.Text_IO;

procedure CalculaIVA is

--Iniciamos el paquete que Float_IO lo que maneja los Float
package Float_IO is new Ada.Text_IO.Float_IO(Float);
use Float_IO; --Para no tener que poner Float_IO.Float en cada llamada a Float como en la linea 15 Float_IO.get(precio);

precio: Float;
IVA: Float;

begin

put("Introduce el precio con Iva: ");
get(precio);

Put_Line("El precio del producto es: " & precio'Image); --'Image convierte el valor a string

IVA := precio * (1.0 - 1.0 / 1.21); --Calculamos el IVA del producto con el 21% de IVA en vez de 0.21 para que sea más claro el cálculo y no haya errores de redondeo

put_Line("El iva del producto es: " & IVA'Image); --'Image convierte el valor a string



end CalculaIVA;