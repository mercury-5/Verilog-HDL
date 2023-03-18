`timescale 1ns/1ns
`include "shift_reg.v"

module shift_reg_tb ();
    reg clk = 0;
    reg shift_left;
    reg shift_right;
    reg [3:0] data_in;
    wire [3:0] data_out;

    shift_reg uut(
        .clk(clk),
        .shift_left(shift_left),
        .shift_right(shift_right),
        .data_in(data_in),
        .data_out(data_out)
    );

    always begin
        #10 clk = ~clk;
    end

    initial begin
        $dumpfile("shift_reg.vcd");
        $dumpvars(0, shift_reg_tb);

        data_in = 4'b1111;
        shift_left = 0;
        shift_right = 1;
        #100;
        data_in = 4'b0000;
        shift_left = 1;
        shift_right = 0;
        #100;
        data_in = 4'b1111;
        shift_left = 0;
        shift_right = 1;
        #100;

        $monitor($time, "shift_left = %b, shift_right = %b, clk = %b, data_in = %b, data_out = %b", shift_left, shift_right, clk, data_in, data_out);
        #1000 $finish;
    end
endmodule