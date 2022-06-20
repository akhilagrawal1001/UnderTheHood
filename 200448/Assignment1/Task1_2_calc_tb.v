`timescale 1ns/1ns
`include "Task1_2_calc.v"

module tb;

    reg [7:0] A, B, C;
    reg [1:0] op;
    wire [7:0] R;
    wire c_out;

    calc mycalc(A, B, C, op, R, C_out);

    initial begin
        A = 0;
        B = 0;
        C = 0;
        op = 0;
        #2;

        $monitor("A = %b, B = %b, C = %b, op=%b, R = %b, Carry = %b", A, B, C, op, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            op = $random;
            #15;
        end
    
    end

endmodule
