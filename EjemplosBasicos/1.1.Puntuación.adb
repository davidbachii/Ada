with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Puntuacion is
    package ES_int is new Ada.Text_Io.Integer_Io(Integer);
    
    canastas2 : Integer;
    triples : Integer;
    libres : Integer;
begin
    Put("Introduce el número de canastas de 2: ");
    ES_int.Get(canastas2);
    set_col(5);
    Put("Has introducido: ");
    ES_int.Put(canastas2); 
    New_line(1);
    Put("Introduce el número de canastas de 3: ");
    ES_int.Get(triples);
    set_col(5);    
    Put("Has introducido: ");
    ES_int.Put(triples);       
    New_line(1);
    Put("Introduce el número de tiros libres: ");
    ES_int.Get(libres);
    set_col(5);    
    Put("Has introducido: ");
    ES_int.Put(libres);           
    New_line(2);
    Put("Los puntos totales son: " & Integer'image(triples*3+canastas2*2+libres));    
end Puntuacion ;
