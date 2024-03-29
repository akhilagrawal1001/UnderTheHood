`include "subtracter.v"

module tb;

    reg [7:0] A, B;
    wire [7:0] R;
    wire C_out;

    eight_bit_subtract sub(A, B, R, C_out);

    initial begin
        A = 0;
        B = 0;
        #2;

        $monitor("A = %d, B = %d, R = %d, Carry = %d", A, B, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            #15;
        end
    
    end

endmodule
