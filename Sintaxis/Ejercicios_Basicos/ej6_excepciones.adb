with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++
-- with Ada.Exceptions;

procedure Excepciones is
    package ES_nat is new Ada.Text_Io.Integer_Io(Natural);

    function Lee_natural return Natural is
        dato : Natural;
    begin 
        loop
            begin
                -- Ada.Integer_Text_IO.Get(Item =>dato);
                ES_nat.Get(dato);
                exit when dato'valid;   -- Aseguramos que hay un dato válido
            exception
                when Ocurrencia : DATA_ERROR =>   
    --                 Put_Line(Ada.Exceptions.Exception_Information(Ocurrencia));
                    set_col(15);                        
                    Put ("Introduce un número natural valido: ");  
                    Ada.Text_IO.Skip_Line;
            end;
        end loop;
        return dato;
    end Lee_natural;

    -- De esta forma cada vez que creemos un numero naturtal vamos a poder vreficar si es valido o no
    
    canastas2 : Natural;
    triples : Natural;
    libres : Natural;
begin
    Put("Introduce el número de canastas de 2: ");
    canastas2 := Lee_natural;
    set_col(5);
    Put("Has introducido: ");
    ES_nat.Put(canastas2); 
    New_line(1);
    Put("Introduce el número de canastas de 3: ");
    triples := Lee_natural;
    set_col(5);    
    Put("Has introducido: ");
    ES_nat.Put(triples);       
    New_line(1);
    Put("Introduce el número de tiros libres: ");
    libres := Lee_natural;
    set_col(5);    
    Put("Has introducido: ");
    ES_nat.Put(libres);           
    New_line(2);
    set_col(25);    
    Put("Los puntos totales son: " & Integer'image(triples*3+canastas2*2+libres));    
end Excepciones ;
