/*****************************
Equality operators:
    1. logical equality operators (==, !==) - Compares only 1,0 -  from verilog.
    2. Case equality operators (===,!==) - compares 0,1,x, and z - from verilog.
    3. Wild equality operators - newly added in SV

    //==,!== always return 1 or 0 as output.
    //===,!== can return 1,0 or x as output.
***********************************************************/
module tb;
    logic [3:0] a,b,c;
    logic f;
    
    initial begin
        a = 4'bx01x; //possible combinations: 0010, 0011, 1010, 1011
        b = 4'bx00z; //possible combinations: 0000, 0001, 1000, 1001
        f = (a===b);
        $display("case equality: === : a=%b, b=%b, f=%b",a,b,f); 
        f = (a!==b);
        $display("case inequality: !== : a=%b, b=%b, f=%b",a,b,f); 
        f = (a==b);
        $display("logical equality: == : a=%b, b=%b, f=%b",a,b,f);    
        f = (a!=b);
        $display("logical inequality: != : a=%b, b=%b, f=%b",a,b,f); 

        a = 4'bx00x; //possible combinations: 0000, 0001, 1000, 1001
        b = 4'bx00z; //possible combinations: 0000, 0001, 1000, 1001
        f = (a===b);
        $display("case equality: === : a=%b, b=%b, f=%b",a,b,f); 
        f = (a!==b);
        $display("case inequality: !== : a=%b, b=%b, f=%b",a,b,f); 
        f = (a==b);
        $display("logical equality: == : a=%b, b=%b, f=%b",a,b,f);    
        f = (a!=b);
        $display("logical inequality: != : a=%b, b=%b, f=%b",a,b,f); 
    end


endmodule 