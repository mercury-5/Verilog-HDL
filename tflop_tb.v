`timescale 1ns/1ns
`include "tflop.v"

module tflop_tb ();

    reg t, clk = 0;
    wire q;

tflop UUT (t, clk, q);

always begin

    clk = ~clk;
    #5;
    
end

initial begin
    
    $dumpfile("tflop.vcd");
    $dumpvars(0, tflop_tb);

    t <= 0;
    #20 t <= $random;
    //#20 t < = 0;

    $display("Test Success");
    $monitor($time, "clk = %b, t = %b, q = %b", clk, t, q);

    $finish;

end
    
endmodule