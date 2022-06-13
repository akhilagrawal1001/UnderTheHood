`timescale 1ns/1ns
module one_bit_subtractor (input a, b, c_in, output r, c_out 
);  
    // wire a, b, c_in;
    assign r = (a ^ (~b) ^ c_in);
    assign c_out = (a & (~b) )| ((~b) & c_in) | (a & c_in);
    
endmodule

module one_bit_adder (input a, b, c_in, output r, c_out 
);  
    // wire a, b, c_in;
    assign r = (a ^ (b) ^ c_in);
    assign c_out = (a & b) | (b & c_in) | (a & c_in);
    
endmodule

module four_bit_subtractor(input  [3:0] a, b, input d,  output [3:0] r,output wire c);
  
     wire c_a[3:0];
    one_bit_subtractor subtractor0 (a[0], b[0], d,   r[0], c_a[0]);
    one_bit_subtractor subtractor1 (a[1], b[1], c_a[0], r[1], c_a[1]);
    one_bit_subtractor subtractor2 (a[2], b[2], c_a[1], r[2], c_a[2]);
    one_bit_subtractor subtractor3 (a[3], b[3], c_a[2], r[3], c_a[3]);
    assign c= c_a[3];

endmodule

module eight_bit_subtractor;

reg  [7:0] a,  b;
   wire [7:0] sub ;
   wire  c_out;

wire  [3:0] r, s;
wire c_a, c_b;


    
    

    four_bit_subtractor ans1(a[3:0], b[3:0], 1'b1,  r[3:0], c_a);

   

 four_bit_subtractor ans2(a[7:4], b[7:4], 1'b0,  s[3:0], c_b);

   /* one_bit_subtractor subtractor4 (a[4], b[4], 1'b1, s[0], c_b[0]);
    one_bit_subtractor subtractor5 (a[5], b[5], c[4], s[1], c_b[1]);
    one_bit_subtractor subtractorr6 (a[6], b[6], c[5], s[2], c_b[2]);
    one_bit_subtractor subtractorr7 (a[7], b[7], c[6], s[3], c_b[3]);*/




wire [3:0] d;
wire g;
assign sub[0]= r[0];
assign sub[1]= r[1];
assign sub[2]= r[2];
assign sub[3]= r[3];
one_bit_adder adder9 (1'b0, s[0], c_a,  sub[4], d[0] );
one_bit_adder adder10(1'b0, s[1], d[0], sub[5], d[1] );
one_bit_adder adder11(1'b0, s[2], d[1], sub[6], d[2] );
one_bit_adder adder12(1'b0, s[3], d[2], sub[7], d[3] );
 assign c_out= c_b;

 initial begin
        a = 0;
        b = 0;
        #2;

        $monitor("A = %d, B = %d, R = %d, Carry = %d", a, b, sub, c_out);

        repeat(10) begin
            a = $random;
            b = $random;
            #15;
        end
    
    end

endmodule