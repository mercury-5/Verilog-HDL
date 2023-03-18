`timescale 1ps/1ps
`include "upDown_counter.v"

module upDown_counter_tb ();
    reg clk =0;
    reg rst;
    reg enable;
    reg up_down;
    wire [3:0] count;

    upDown_counter uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .up_down(up_down),
        .count(count)
    );

    always begin
        #5 clk = ~clk;
    end
    initial begin
        $dumpfile("upDown_counter.vcd");
        $dumpvars(0, upDown_counter_tb);

        rst <= 1;
        enable <= 0;
        #5;

        rst <= 0;
        enable <= 1;
        up_down <= 1;
        #150;
        up_down <= 0;
        #100;

        $monitor($time, "clk = %b, rst = %b, enable = %b, up_down = %b, count = %b", clk, rst, enable, up_down, count);
        #55 $finish;
    end
endmodule