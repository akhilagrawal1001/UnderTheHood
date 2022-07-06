
`timescale 1ns/1ns
module function1 (a,b,c,d,res);
    input a,b,c,d;
    output res;

    assign res = (b |(d^1))& (a | (b^1) | d);

endmodule

module one_bit_adder (
    input a, b, c, c_in, output r, c_out 
);  
    function1 add(a,b,c,c_in,r);
    function1 carry(c_in,a,b,c,c_out);

endmodule


module eight_bit_adder(
    input wire [7:0] a, b, c,  input wire [1:0] opcode,
    output wire [7:0] r, output wire c_out
);
    wire [7:0] d;
            one_bit_adder adder0 (a[0]^(opcode[0] & ~opcode[1]), b[0]^(~opcode[0] & opcode[1]), c[0]^(opcode[0] & opcode[1]), opcode[0] | opcode[1], r[0], d[0]);
            one_bit_adder adder1 (a[1]^(opcode[0] & ~opcode[1]), b[1]^(~opcode[0] & opcode[1]), c[1]^(opcode[0] & opcode[1]), d[0], r[1], d[1]);
            one_bit_adder adder2 (a[2]^(opcode[0] & ~opcode[1]), b[2]^(~opcode[0] & opcode[1]), c[2]^(opcode[0] & opcode[1]), d[1], r[2], d[2]);
            one_bit_adder adder3 (a[3]^(opcode[0] & ~opcode[1]), b[3]^(~opcode[0] & opcode[1]), c[3]^(opcode[0] & opcode[1]), d[2], r[3], d[3]);
            one_bit_adder adder4 (a[4]^(opcode[0] & ~opcode[1]), b[4]^(~opcode[0] & opcode[1]), c[4]^(opcode[0] & opcode[1]), d[3], r[4], d[4]);
            one_bit_adder adder5 (a[5]^(opcode[0] & ~opcode[1]), b[5]^(~opcode[0] & opcode[1]), c[5]^(opcode[0] & opcode[1]), d[4], r[5], d[5]);
            one_bit_adder adder6 (a[6]^(opcode[0] & ~opcode[1]), b[6]^(~opcode[0] & opcode[1]), c[6]^(opcode[0] & opcode[1]), d[5], r[6], d[6]);
            one_bit_adder adder7 (a[7]^(opcode[0] & ~opcode[1]), b[7]^(~opcode[0] & opcode[1]), c[7]^(opcode[0] & opcode[1]), d[6], r[7], d[7]);
            assign c_out = d[7];
endmodule

module tb;

    reg [7:0] A, B,C;
    wire [7:0] R;
    wire C_out;
    reg[1:0] opcode;

    eight_bit_adder add(A, B, C,opcode , R, C_out);

    initial begin
        A = 0;
        B = 0;
        C = 0;
        opcode=0;
        #2;

        $monitor("A = %d, B = %d, C= %d , opcode= %d R = %d, Carry = %d", A, B, C,opcode, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            C = $random;
            opcode=$random;
            #15;
        end
    
    end

endmodule