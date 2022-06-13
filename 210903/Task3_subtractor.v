`timescale 1ns/1ns

module one_bit_adder (
    input a, input b, input cin, output r, output cout
);
assign r = a^b^cin;
assign cout = (a&b)|(a&cin)|(b&cin);
endmodule

module eight_bit_adder(
input [7:0] a,b, output wire[7:0] r, output wire cout
);

wire [7:0] c;

one_bit_adder adder1(a[0],b[0],1'b0,r[0],c[0]);
one_bit_adder adder2(a[1],b[1],c[0],r[1],c[1]);
one_bit_adder adder3(a[2],b[2],c[1],r[2],c[2]);
one_bit_adder adder4(a[3],b[3],c[2],r[3],c[3]);
one_bit_adder adder5(a[4],b[4],c[3],r[4],c[4]);
one_bit_adder adder6(a[5],b[5],c[4],r[5],c[5]);
one_bit_adder adder7(a[6],b[6],c[5],r[6],c[6]);
one_bit_adder adder8(a[7],b[7],c[6],r[7],c[7]);

assign cout = c[7];

endmodule


module one_bit_complement(
    input a, output b
);
assign b = a^1;
endmodule

module eight_bit_two_complement(
input [7:0] a, output wire [7:0] b, output wire[7:0] c
);

one_bit_complement c1 (a[0],b[0]);
one_bit_complement c2 (a[1],b[1]);
one_bit_complement c3 (a[2],b[2]);
one_bit_complement c4 (a[3],b[3]);
one_bit_complement c5 (a[4],b[4]);
one_bit_complement c6 (a[5],b[5]);
one_bit_complement c7 (a[6],b[6]);
one_bit_complement c8 (a[7],b[7]);

wire carry;
eight_bit_adder a1 (8'b00000001,b,c,carry);

endmodule

module tb;

reg [7:0] a,b,c;
wire [7:0] r1;
wire [7:0] r2;
wire [7:0] r3;
wire [7:0] answer;
wire [7:0] answer2;
wire [7:0] rr1;
wire [7:0] rr2;
wire cout;
// if (answer[7]==0) 
// begin
eight_bit_two_complement take(b,r1,r2);
// assign r3 = r2;
eight_bit_adder addem(a,r2,answer,cout);

eight_bit_two_complement addup(answer,rr1,rr2);
    // end
initial begin
    a = 125;
    b=127;
    #15;
    if (answer[7]==0)begin
    $display("a =%b i.e, %d b =%b i.e, %b answer= %b viz=  %d",a,a,b,b,answer,answer);
    end
    if (answer[7]==1) begin
        // eight_bit_two_complement(answer,r1,r2)
        $display("a =%b i.e, %d b =%b i.e, %d answer= %b viz=  -%d",a,a,b,b,rr2,rr2);
    end
end
endmodule