`timescale 1ms/1ms
module f(input a, b,clk, output reg q);
    reg state;
    initial begin
        q=0;
    end
    always @(posedge clk) begin
        q=((~a)&(~b)&q)|(a&b)|(a&(~q));
    end
    // always @(negedge clk) begin
    //     q=state;
    // end
endmodule

module tb;
    reg a,b,clk;
    wire q;
    f ant(a,b,clk,q);
    always begin
        #5;
        clk = ~clk;
    end
    always @(negedge clk) begin
        $display("q=%b", q);
    end
    initial begin 
        clk=0;
        a=0;b=0;
        #10;
        a=1;b=1;
        #10;
        a=0;b=1;
        #10;
        a=1;b=0;
        #10;
        a=0;b=0;
        #10
        a=0;b=1;
        #10;
        $finish;
    end
endmodule
