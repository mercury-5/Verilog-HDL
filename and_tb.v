`timescale 1ps/1ps
`include "and_gt.v"

module and_tb();

    reg a, b;
    wire y;

and_gt uut(y, a, b);

initial begin
    
    $dumpfile("and_tb.vcd");
    $dumpvars(0,and_tb);

    #10 a = 0;
        b = 0;
    
    #10 a = 0;
        b = 1;

    #10 a = 1;
        b = 0;

    #10 a = 1;
        b = 1;

    $display("Test Succes");
    $monitor($time, "a = %b, b = %b, y = %b", a, b, y);

    #10 $finish;

end
    
endmodule