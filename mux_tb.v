`timescale 1ns / 1ns
`include "mux.v"

module mux_tb();

    reg [3:0] a;

    reg [1:0] s;

    wire o;

mux uut (.a(a), .s(s), .o(o));

initial begin

    $dumpfile("mux_tb.vcd");
    $dumpvars(0, mux_tb);

    #10 a = 4'b0101;

    #10 s = 2'b00;

    #10 s = 2'b01;

    #10 s = 2'b10;

    #10 s = 2'b11;

    $display("Test Succes");
    $monitor($time, "a = %b, s = %b", a, s);

    #10 $finish;

end

endmodule