/***********************************************
Assignment operators: =, +=, -=, *=, /=, %=, &=, |=, ^=, <<=, >>=, <<<=, >>>=
**********************************************************************************************/
module tb;
bit [4:0] a = 5'b10010;
bit [4:0] b = 5'b11001;
int c = -200;
int d = -200;
initial begin 
    a+=b;
    $display("a+=b:%0b",a); //a+=b --> a=a+b = 01011 with carry = 1 --> 41
    a-=b;
    $display("a-=b:%0b",a); //a=a-b = 11001 with borrow = 1 --> -6 
    a*=b;
    $display("a*=b:%0d",a); //a=a*b =  475
    a/=b;
    $display("a/=b:%0d",a); //a=a/b = 1.315
    a%=b;
    $display("a%%=b:%0d",a); //a=a%b = 6 
    a&=b;
    $display("a&=b:%0b",a); //a=a&b = 10000
    a|=b;
    $display("a|=b:%0d",a); //a=a|b = 11011
    a^=b;
    $display("a^=b:%0d",a); //a=a^b = 01011
    c<<=2;
    $display("c<<=2:%0d",c);  
    c>>=2;
    $display("c>>=2:%0d",c); //unisgned right shift
    c<<<=2;
    $display("c<<<=2:%0d",c); 
    c>>>=2; 
    $display("c>>>=2:%0d",c); 
end

endmodule