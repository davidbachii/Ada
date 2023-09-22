with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Nacimiento is
    -- Declaramos un tipo longitud en metros con precision de mm
    type anno_t is range 1950..2000;
    type meses_t is (enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre);
    type dia_t is range 1..31;
    
    -- Como hemos declarado un tipo nuevo necesitamos un paquete de e/s para ese tipo
    package ES_mes is new Ada.Text_Io.Enumeration_Io(meses_t);
    package ES_anno is new Ada.Text_Io.Integer_Io(anno_t);
    package ES_dia is new Ada.Text_Io.Integer_Io(dia_t);
        
    dia : dia_t;
    mes : meses_t;
    anno : anno_t;
begin
    Put("Introduce el día: ");
    ES_dia.Get(dia);
    set_col(5);
    Put("Has introducido: ");
    ES_dia.Put(dia); 
    New_line(2);
    Put("Introduce el mes: ");
    ES_mes.Get(mes);
    set_col(5);    
    Put("Has introducido: ");
    ES_mes.Put(mes);       
    New_line(2);
    Put("Introduce el año: ");
    ES_anno.Get(anno);
    set_col(5);    
    Put("Has introducido: ");
    ES_anno.Put(anno);       
    New_line(2);
    set_col(35);
    Put_line("La fecha de tu nacimiento es " & dia_t'image(dia) & " del " & meses_t'image(mes) & " del " & anno_t'image(anno));    
end Nacimiento ;
