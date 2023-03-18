`timescale 1ps/1ps
`include "halfSubtractor.v"

module halfSubtractor_tb ();
    
    reg A, B;
    wire D, Bo;

halfSubtractor UUT(D, Bo, A, B);

initial begin
    
    $dumpfile("halfSubtractor.vcd");
    $dumpvars(0, halfSubtractor_tb);

    #10 A = 1'b0;
        B = 1'b0;

    #10 A = 1'b0;
        B = 1'b1;

    #10 A = 1'b1;
        B = 1'b0;

    #10 A = 1'b1;
        B = 1'b1;

    $display("Test Succes");
    $monitor($time, "A = %b, B = %b, D = %b, Bo = %b", A, B, D, Bo);

    #40 $finish;

end

endmodule