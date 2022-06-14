module one_bit_adder (input a, b, c_in, output r, c_out);

    assign r = (a ^ b ^ c_in);
    assign c_out = (a & b) | (b & c_in) | (a & c_in);

endmodule

module four_bit_subtractor(a, b, c_in, r, c_out);
    input [3:0] a, b;
    input c_in;
    output [3:0] r;
    output c_out;

    wire [3:0] c;
    one_bit_adder add0 (a[0], ~b[0], c_in, r[0], c[0]);
    one_bit_adder add1 (a[1], ~b[1], c[0], r[1], c[1]);
    one_bit_adder add2 (a[2], ~b[2], c[1], r[2], c[2]);
    one_bit_adder add3 (a[3], ~b[3], c[2], r[3], c[3]);
    assign c_out = c[3];

endmodule

module eight_bit_subtractor(a, b, r, c_out);

    input [7:0] a, b;
    output [7:0] r;
    output c_out;

    wire [1:0] c;
    four_bit_subtractor sub0 (a[3:0], b[3:0], 1'b1, r[3:0], c[0]);
    four_bit_subtractor sub1 (a[7:4], b[7:4], c[0], r[7:4], c[1]);
    assign c_out = c[1];

endmodule 