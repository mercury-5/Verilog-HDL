`timescale 1ns/1ns
`include "jk_ff_race.v"

module jk_ff_race_tb();
    reg j;
    reg k;
    reg clk = 0;
    wire q;
    wire qn;

    jk_ff_race uut(
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .qn(qn)
    );
    always #5 clk = ~clk;

    initial begin
        $dumpfile("jk_ff_race.vcd");
        $dumpvars(0, jk_ff_race_tb);
        $monitor($time,"j = %b, k = %b, clk = %b, q = %b, qn = %b", j, k, clk, q, qn);

        j = 0;
        k = 0;
        #5;
        
        j = 0;
        k = 1;
        #5;

        j = 1;
        k = 0;
        #5;

        j = 1;
        k = 1;
        #20;
        #10 $finish;
    end
endmodule
