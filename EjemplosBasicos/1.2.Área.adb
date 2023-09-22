with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Area is
    -- Declaramos un tipo longitud en metros con precision de mm
    type longitud_metros_t is delta 0.001 range 0.0..100.0;

    -- Como hemos declarado un tipo nuevo necesitamos un paquete de e/s para ese tipo
    package ES_longitud_metros is new Ada.Text_Io.Fixed_Io(longitud_metros_t);
        
    largo,ancho : longitud_metros_t;
begin
    Put("Introduce el largo en metros: ");
    ES_longitud_metros.Get(largo);
    set_col(5);
    Put("Has introducido: ");
    ES_longitud_metros.Put(largo); 
    New_line(2);
    Put("Introduce el ancho en metros: ");
    ES_longitud_metros.Get(ancho);
    set_col(5);    
    Put("Has introducido: ");
    ES_longitud_metros.Put(ancho);       
    New_line(2);
    set_col(35);
    Put_line("El área total es: " & longitud_metros_t'image(ancho*largo));    
end Area ;
