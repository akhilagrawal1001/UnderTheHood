module flip_flop(
    input A, B, output reg C
);
    initial begin
        C = 1'b0;
    end
    always @(A or B) begin
        C = (~A & ~B & C) | (A & ~B & ~C) | (A & B);
    end
endmodule
