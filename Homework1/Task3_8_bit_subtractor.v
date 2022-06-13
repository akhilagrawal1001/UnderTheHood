module subtractor_8bit()
module add_sub_4 (A, B, In, Res, Out);
    input [3:0] A, B;
    input In;
    output reg [3:0] Res;
    output reg Out;
    wire [3:0]t; //b xor in


          xor x3(t[0],B[0],In);
          xor x4(t[1],B[1],In);
          xor x5(t[2],B[2],In);
          xor x6(t[3],B[3],In);
          full_adder f0(Res[0],Out1,A[0],t[0],In);
          full_adder f1(Res[1],Out2,A[1],t[1],In);
          full_adder f2(Res[2],Out3,A[2],t[2],In);
          full_adder f3(Res[3],Out4,A[3],t[3],In);  
endmodule
module full_adder(a,b,c,S,C)
input a,b,c;
output reg S,C;
wire s1, c1,c2;

half_adder ha1(s1,c1,a,b);
half_adder ha2(S,c2,s1,z);
endmodule
module half_adder(a,b,S,C)
input a,b;
output reg S, C;
xor (S,a,b);
and (C,a,b);
endmodule