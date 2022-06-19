`timescale 1ns/1ps
module Mod_or(a,b,c);
    input a,b;
    output c;

    assign c= a|b;
endmodule

module tb;

    reg A, B;
    wire C;

    Mod_or or1(A, B, C);

    initial begin
        $dumpfile("or1.vcd");
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