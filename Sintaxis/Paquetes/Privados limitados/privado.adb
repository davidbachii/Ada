with Ada.Text_IO; use Ada.Text_IO;



package body privado is

function Asignar_blanco (x, y : Integer) return target_t is
   T : target_t;
begin
   T.x := x;
   T.y := y;
   return T;
end Asignar_blanco;

procedure Imprimir_blanco(T : target_t) is
begin
   Put_Line("El blanco esta en " & Integer'Image(T.x) & " " & Integer'Image(T.y));
end Imprimir_blanco;



end privado;