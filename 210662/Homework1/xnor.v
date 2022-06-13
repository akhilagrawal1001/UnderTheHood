`timescale 1ns/1ns
module old(A, B, C);
    input A;
    input B;
    output C;
    assign C= A | B;
endmodule
module new;
    reg A,B;
    wire C;
    old ol(A,B,C);
    initial begin
      $dumpfile("xnor.vcd");
      $dumpvars(0, new);
      $monitor("A = %b, B = %b, C = %b", A, B, C);
      A=0;
      B=0;
      #20;
      A=0;
      B=1;
      #20;
      A=1;
      B=0;
      #20;
      A=1;
      B=1;
      #20;
    end
endmodule