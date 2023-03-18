`timescale 1ps/1ps
`include "mem16.v"

module mem16_tb ();
    
    reg clk = 0, rst, sel, wr;
    reg [15:0] wdata;
    wire [15:0] rdata;
    wire [15:0] register;

mem16 UUT(rdata, clk, rst, sel, wr, wdata);

always begin
        
    clk = ~clk;
    #10;

end

initial begin
    
    $dumpfile("mem16.vcd");
    $dumpvars(0, mem16_tb);

    rst = 1'b1;
    sel = 1'b1;
    wr = 1'b1;
    wdata = 8'h56;
    #50;

    rst = 1'b0;
    sel = 1'b0;
    wr = 1'b1;
    wdata = 8'hAB;
    #50;

    rst = 1'b1;
    sel = 1'b1;
    wr = 1'b0;
    wdata = 8'h12;
    #50;

    rst = 1'b0;
    sel = 1'b1;
    wr = 1'b1;
    wdata = 8'hAB;
    #50;

    $display("Test Success");
    $monitor($time, "clk = %b, rst = %b, sel = %b, wr = %b, wdata = %h, rdata = %h", clk, rst, sel, wr, wdata, rdata);

    $finish;

end

endmodule