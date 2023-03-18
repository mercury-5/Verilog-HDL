`timescale 1ns/1ns
`include "counter4_down.v"

module counter4_down_tb ();
    reg clk = 0;
    reg rst;
    wire [3:0] count;

    counter4_down uut(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("counter4_down.vcd");
        $dumpvars(0, counter4_down_tb);

        #5 rst <= 0;
        #10 rst <= 1;
        
        $monitor($time, "clk = %b, rst = %b, count = %b", clk, rst, count);
        #200 $finish;
    end
endmodule