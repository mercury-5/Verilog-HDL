`timescale 1ns/1ns
`include "ripple_counter.v"

module ripple_counter_tb ();
    reg clk;
    reg rst;
    wire [3:0] count;

    ripple_counter uut(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("ripple_counter.vcd");
        $dumpvars(0, ripple_counter_tb);
        $monitor($time,"clk = %b, rst = %b, count = %b", clk, rst, count);

        rst <=0;
        clk <= 0;

        repeat(4) @ (posedge clk);
        rst <= 1;

        repeat(25) @ (posedge clk);
        $finish;
    end
endmodule