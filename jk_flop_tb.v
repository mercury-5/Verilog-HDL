`timescale 1ns/1ns
`include "jk_flop.v"

module jk_flop_tb ();

    reg j, k, clk = 0;
    wire q;

jk_flop UUT (q, j, k, clk);

always begin
    
    clk = ~clk;
    #5;

end

initial begin

    $dumpfile("jk_flop.vcd");
    $dumpvars(0, jk_flop_tb);
    
    j <= 0;
    k <= 0;

    #20 j <= 0;
        k <= 1;
    
    #20 j <= 1;
        k <= 0;

    #20 j <= 1;
        k <= 1;

    $display("Test Success");
    $monitor($time, "clk = %b, j = %b, k = %b, q = %b", clk, j, k, q);

    #20 $finish;

end
    
endmodule