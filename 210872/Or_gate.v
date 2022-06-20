module OR_GATE (
    input a, b, output wire c
);
    assign c = a | b;
endmodule

module tb;
reg A, B;
wire R;
OR_GATE GATE0 (A,B,R);
initial begin 
    A=0;
    B=0;
    #2;
    $monitor("A=%b,B=%b,R=%b",A,B,R);
    repeat(10) begin
    A=$random;
    B=$random;
    #5;
    end
end
endmodule
