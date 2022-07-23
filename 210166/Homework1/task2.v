module xnor_gate(
    input A,
    input B,
    output C
);
    assign C = (~A | B) & (A | ~B);
endmodule
