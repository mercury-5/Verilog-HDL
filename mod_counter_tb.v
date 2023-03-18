`timescale 1ns/1ns
`include "mod_counter.v"

module mod_counter_tb ();
    parameter WIDTH = 4;
    reg clk;
    reg rst;
    wire [WIDTH-1:0] count;

    mod_counter uut(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("mod_counter.vcd");
        $dumpvars(0, mod_counter_tb);
        $monitor($time,"clk = %b, rst = %b, count = %b", clk, rst, count);
        
        {clk, rst} <= 0;

        repeat(2) @ (posedge clk);
        rst <= 1;

        repeat(15) @ (posedge clk);
        $finish;
    end
endmodule