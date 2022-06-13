`timescale 1ns/1ns

module Xnor_gate(
    input a, input b, output c
);
assign c = !(a^b);
endmodule

module tb;
    reg a,b;
    wire c;
    Xnor_gate call(a,b,c);

    initial begin
        a=0;
        b=0;
        #2;
        $display("a=%b b=%b and a or b = %b",a,b,c);
        a=1;
        b=0;
        #2;
        $display("a=%b b=%b and a or b = %b",a,b,c);
        a=0;
        b=1;
        #2;
        $display("a=%b b=%b and a or b = %b",a,b,c);
        a=1;
        b=1;
        #2;
        $display("a=%b b=%b and a or b = %b",a,b,c);

       
end
endmodule