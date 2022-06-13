`timescale 1ns/1ns 

module xnor_gate(A, B, C);
    input A;
    input B;
    output C;
    assign C = (A&B)|((~A)&(~B));
endmodule


module tb;

    reg A, B;
    wire C;
    xnor_gate ans(A, B, C);

    initial begin
        A = 1;
        B = 1;
        
        $display("A = %b, B = %b, C = %b", A, B, C);
        #10;
        A = 0;
        B = 1;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #10;
        A=1;
        B=0;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
        #10;
        A = 0;
        B = 0;
        #2;
        $display("A = %b, B = %b, C = %b", A, B, C);
    end
endmodule
