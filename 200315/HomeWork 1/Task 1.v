module or_gate (a,b,out);
input a,b;
output out;
assign out = a|b;
endmodule 

//test bench

module gate_tb;
wire t_out;
reg t_a, t_b;
or_gate gate (.a(t_a), .b(t_b), .out(t_out));

initial
begin
    $monitor("A = %b, B = %b, Out = %b", t_a, t_b, t_out);

    t_a = 1'b0;
    t_b = 1'b0;
    #10
    t_a = 1'b0;
    t_b = 1'b1;
    #10
    t_a = 1'b1;
    t_b = 1'b0;
    #10
    t_a = 1'b1;
    t_b = 1'b1;
end
endmodule

