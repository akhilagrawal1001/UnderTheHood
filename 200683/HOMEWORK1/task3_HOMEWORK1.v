module halfadder(a,b,sum,carry);
input a,b;
output sum,carry;
xor(sum,a,b);
and(carry,a,b);
end module




module fulladder(a,b,cin,cout,sum);
input a,b,cin;
output sum,cout;
wire temp,temp1,temp2;
halfadder a1 (.a(a),.b(b),.sum(temp),.carry(temp1));
halfadder a2 (.a(temp),.b(cin),.sum(sum),.carry(temp2));
or(cout,temp1,temp2);
endmodule




module 4bitsubtractor(a,b,cin,cout,out);
input [3:0]a,b;
output cout;
output [3:0]out;
wire w1,w2,w3;
not(b[0],b[0]);
not(b[1],b[1]);
not(b[2],b[2]);
not(b[3],b[3]);
fulladder a1(.a(a[0],.b(b[0]),.cin(cin),.cout(w1),.sum(out[0]));
fulladder a2(.a(a[1]),.b(b[1]),.cin(w1),.cout(w2),.sum(out[1]));
fulladder a3(.a(a[2]),.b(b[2]),.cin(w2),.cout(w3),.sum(out[2]));
fulladder a4(.a(a[3]),.b(b[3]),.cin(w3),.cout(cout),.sum(out[3]));
endmodule




module 8bitsubtractor(a,b,out,cout);
input [7:0]a,b;
output [7:0]c;output cout;
wire w1;
4bitsubtractor a1(.a({a[3],a[2],a[1],a[0]}),.b({b[3],b[2],b[1],b[0]}),.cin(1'b1),.cout(w1),.out({out[3],out[2],out[1],out[0]}));
4bitsubtractor a1(.a({a[7],a[6],a[5],a[4]}),.b({b[7],b[6],b[5],b[4]}),.cin(w1),.cout(cout),.out({out[7],out[6],out[5],out[4]}));
endmodule







