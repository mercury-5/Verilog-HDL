`timescale 1ns/1ns
`include "dflop.v"

module dflop_tb ();

    reg D = 0, clk = 0, En = 0;
    wire Q, Qb;

dflop UUT(Q, Qb, D, clk, En);

always begin
    
    clk = ~clk;
    #20;

end

initial begin
    
    $dumpfile("dflop.vcd");
    $dumpvars(0, dflop_tb);

    En = 0;
    #40;
    D = 0;
    #40;
    D = 1;
    #40;
    D = 0;
    #40;

    En = 1;
    #40;
    D = 0;
    #40;
    D = 1;
    #40;
    D = 0;
    #40;

    $display("Test Succes");
    $monitor($time, "D = %b, clk = %b, En = %b, Q = %b, Qb = %b", D, clk, En, Q, Qb);

    $finish;

end
    
endmodule