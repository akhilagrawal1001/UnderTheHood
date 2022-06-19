`timescale 1ns/1ps
module Mod_xnor(a,b,c);
    input a,b;
    output c;

    assign c= (a^b)^1;
endmodule

module tb;

    reg A, B;
    wire C;

    Mod_xnor or1(A, B, C);

    initial begin
        $dumpfile("xnor1.vcd");
        $dumpvars(0, tb);
        $monitor("A = %b, B = %b, C = %b", A, B, C);
        A = 1;
        B = 1;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 1;
        B = 0;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 0;
        B = 1;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
        A = 0;
        B = 0;
        #2;
        // $display("A = %b, B = %b, C = %b", A, B, C);
        #15;
    end
    
endmodule