`timescale 1ns/1ns
`include "dff_5hz.v"

module dff_5hz_tb();
    reg clk_in = 0;
    reg rst;
    reg d;
    wire clk_out;
    wire q;

    dff_5hz uut(
        .clk_in(clk_in),
        .rst(rst),
        .clk_out(clk_out),
        .d(d),
        .q(q)
    );

    always #5 clk_in = ~clk_in;

    initial begin
        d = 1;
        #500000000;
        d = 0;
        #500000000;
    end

    initial begin
        $dumpfile("dff_5hz.vcd");
        $dumpvars(0, dff_5hz_tb);
        $monitor($time,"clk_in = %b, rst = %b, clk_out = %b, d = %d, q = %b", clk_in, rst, clk_out, d, q);

        //rst = 1;
        //#0.5;
        rst = 0;
        #1000000000 $finish;
    end
endmodule