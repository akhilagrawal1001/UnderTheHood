`timescale 1ns/1ns

module or_gate(A, B, C);
  input A;
  input B;
  output C;
  assign C= A | B;
endmodule

module tb;
   reg A, B;
   wire C;
   or_gate ans(A, B, C);

    initial begin 

        $monitor("A = %b, B = %b, C = %b", A, B, C);
        A=0;
        B=0;
        #10
        A=1;
        B=0;
        #10;
        A=0;
        B=1;
        #10
        A=1;
        B=1;
    
    end
endmodule