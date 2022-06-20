`timescale 1ps/1ps
module subtractor ( input a, b, c1, output r, c2);
assign r= (a^(~b)^c1);
assign c2 = (a & (~b)) | ((~b) & c1) | (c1 & a);
endmodule
module four_sub (input wire [3:0] a, b, input wire c, output wire [3:0] r, c2);
subtractor a0 (a[0], b[0], c, r[0], c2[0]);
subtractor a1 (a[1], b[1], c2[0], r[1], c2[1]);
subtractor a2 (a[2], b[2], c2[1], r[2], c2[2]);
subtractor a3 (a[3], b[3], c2[2], r[3], c2[3]);
endmodule
module eight_sub (input wire [7:0] a, b, output wire [7:0] r, output wire [7:0] c);

four_sub four0 (a[3:0], b[3:0], 1'b1, r[3:0], c[3:0]);
four_sub four1 (a[7:4], b[7:4], c[3], r[7:4], c[7:4]);

endmodule
module tb;
reg[7:0] A, B;
wire[7:0] R;
wire [7:0] C;
eight_sub eight0 (A,B,R,C);
initial begin
    A=0;
    B=0;
    #2;
    $monitor("A=%d,B=%d,R=%d",A,B,R);
    repeat(10) begin
    A=$random;
    B=$random;
    #5;
    end
end
endmodule
