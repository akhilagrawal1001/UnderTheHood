`include "sub_8bit_3.v"

module tb;

    reg [3:0] A, B;
    wire [3:0] R;
    wire C_out;

    four_bit_subtract sub(A, B, R, C_out);

    initial begin
        A = 0;
        B = 0;
        #2;

        $monitor("A = %d, B = %d, R = %d, Carry = %b", A, B, R, C_out);

        repeat(10) begin
            A = $random;
            B = $random;
            #15;
        end
    
    end

endmodule