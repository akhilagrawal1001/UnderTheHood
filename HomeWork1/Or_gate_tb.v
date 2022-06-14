module gate_tb;

reg A,B;
wire C;
or_gate gate(.a(A) , .b(B) , .c(C));
initial begin
    $monitor("A = %b, B = %b , C = %b", A, B, C);

    A = 1'b0;
    B = 1'b0;
    #12;

    A = 1'b0;
    B = 1'b1;
    #12;

    A = 1'b1;
    B = 1'b0;
    #12;

    A = 1'b1;
    B = 1'b1;
    #12;
end
endmodule
