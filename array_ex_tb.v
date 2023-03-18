`timescale 1ps/1ps
`include "array_ex.v"

module array_ex_tb ();
    
    reg clk = 0, rst, wr, sel;
    reg [1:0] addr;
    reg [15:0] wdata;
    wire [15:0] rdata;

array_ex UUT(rdata, clk, rst, addr, wr, sel, wdata);

always begin
    
    clk = ~clk;
    #10;

end

initial begin
    
    $dumpfile("array_ex.vcd");
    $dumpvars(0, array_ex_tb);

    rst = 1'b0;
    wr = 1'b1;
    sel = 1'b1;
    addr = 2'b00;
    wdata = 16'hABCD;
    #20;

    rst = 1'b1;
    wr = 1'b1;
    sel = 1'b1;
    addr = 2'b01;
    wdata = 16'hABCD;
    #20;

    rst = 1'b1;
    wr = 1'b0;
    sel = 1'b1;
    addr = 2'b10;
    wdata = 16'hABCD;
    #20;

    rst = 1'b1;
    wr = 1'b0;
    sel = 1'b1;
    addr = 2'b11;
    wdata = 16'hABCD;
    #20;

    $display("Test Success");
    $monitor($time, "clk = %b, rst = %b, sel = %b, wr = %b, wdata = %h, rdata = %h", clk, rst, sel, wr, wdata, rdata);

    $finish;

end

endmodule