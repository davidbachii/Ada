with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;



procedure Procedimientos is    -- Necesitamos un paquete de e/s 
    package ES_float is new Ada.Text_Io.Float_Io(Float);

    procedure resolver(A,B,C:Float; R1,R2:out Float; ok:out Boolean) is
    Z: Float;		-- variable local
    begin 			-- Cuerpo
        Z:= B*B - 4.0*A*C;
        if Z<0.0 or A = 0.0 then
            Ok:=false;
        else
            Ok := true; 
            R1:= (-B+sqrt(z))/(2.0*A); 
            R2:= (-B-sqrt(z))/(2.0*A);
        end if;
    end resolver;

    function minimo (X,Y:Float) return Float is
    begin
	if X>Y then
        return Y;
    else
        return X;
    end if;
    end minimo;	

    A, B, C : Float := 0.0;
    R1,R2 : Float := 0.0;
    ok : Boolean :=false;
begin   
    set_col(5);
    Put("Este programa calcula las raices de un polinomio de segundo orden de la forma Ax²+Bx+C=0 y muestra la menor");
    New_line(2);
    set_col(15);
    Put("Introduzca A :");
    ES_float.Get(A);
    New_line(2);    
    set_col(15);
    Put("Introduzca B :");
    ES_float.Get(B);
    New_line(2);    
    set_col(15);
    Put("Introduzca C :");
    ES_float.Get(C);
    New_line(3);  

    set_col(5);
    Put("Las raices para el polinomio " & Float'image(A) &"*x²+" & Float'image(B) &"*x+" & Float'image(C) &"=0 son: " );


    resolver(A,B,C,R1,R2, ok);

    if ok = true then
        Put("R1: " & Float'image(R1) & "  R2: " & Float'image(R2) & " y la menor es " & Float'image(minimo(R1,R2)));
    else
        Put("La ecuación no tiene soluciones reales");
    end if;
    
    New_line(4);  

    
end Procedimientos;
