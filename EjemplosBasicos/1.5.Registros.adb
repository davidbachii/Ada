with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Registros is
    package ES_pos is new Ada.Text_Io.Integer_Io(Positive);

    -- Declaramos un tipo longitud en metros con precision de mm
    type anno_t is range 1950..2000;
    type meses_t is (enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre);
    type dia_t is range 1..31;
    
    -- Como hemos declarado un tipo nuevo necesitamos un paquete de e/s para ese tipo
    package ES_mes is new Ada.Text_Io.Enumeration_Io(meses_t);
    package ES_anno is new Ada.Text_Io.Integer_Io(anno_t);
    package ES_dia is new Ada.Text_Io.Integer_Io(dia_t);

    type fecha_t is record
        dia : dia_t;
        mes : meses_t;
        anno : anno_t;
    end record;

    type ficha_t is record
        canastas2 : Positive;
        triples : Positive;
        libres : Positive;
        nacimiento : fecha_t;
    end record;


    jugador : ficha_t;
begin
    Put("Introduce el número de canastas de 2: ");
    ES_pos.Get(jugador.canastas2);
    set_col(5);
    Put("Has introducido: ");
    ES_pos.Put(jugador.canastas2); 
    New_line(1);
    Put("Introduce el número de canastas de 3: ");
    ES_pos.Get(jugador.triples);
    set_col(5);    
    Put("Has introducido: ");
    ES_pos.Put(jugador.triples);       
    New_line(1);
    Put("Introduce el número de tiros libres: ");
    ES_pos.Get(jugador.libres);
    set_col(5);    
    Put("Has introducido: ");
    ES_pos.Put(jugador.libres);           
    New_line(2);
    Put("Introduce el día: ");
    ES_dia.Get(jugador.nacimiento.dia);
    set_col(5);
    Put("Has introducido: ");
    ES_dia.Put(jugador.nacimiento.dia); 
    New_line(2);
    Put("Introduce el mes: ");
    ES_mes.Get(jugador.nacimiento.mes);
    set_col(5);    
    Put("Has introducido: ");
    ES_mes.Put(jugador.nacimiento.mes);       
    New_line(2);
    Put("Introduce el año: ");
    ES_anno.Get(jugador.nacimiento.anno);
    set_col(5);    
    Put("Has introducido: ");
    ES_anno.Put(jugador.nacimiento.anno);       
    New_line(2);
    set_col(35);
    Put_line("La fecha de nacimiento es " & dia_t'image(jugador.nacimiento.dia) & " del " & meses_t'image(jugador.nacimiento.mes) & " del " & anno_t'image(jugador.nacimiento.anno));  
    set_col(35);    
    Put("Los puntos totales son: " & Positive'image(jugador.triples*3+jugador.canastas2*2+jugador.libres));    
end Registros ;
