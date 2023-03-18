`include "vending_machine.v"

module vending_machine_tb;

    // Inputs
    reg clk = 0;
    reg reset;
    reg [2:0] coin;
    reg [1:0] selection;

    // Outputs
    wire [3:0] dispense;

    // Instantiate the DUT
    vending_machine UUT (
        .clk(clk),
        .reset(reset),
        .coin(coin),
        .selection(selection),
        .dispense(dispense)
    );

    // Clock generator
    always #5 clk = ~clk;

    // Reset generator
    initial begin
        reset = 1;
        #10 reset = 0;
    end

    // Testcase 1: No coin inserted, no selection made
    initial begin
        coin = 3'b000;
        selection = 2'b00;
        #20;
        if (dispense !== 4'b0000) $error("Testcase 1 failed!");
    end

    // Testcase 2: Coin inserted, no selection made
    initial begin
        coin = 3'b001;
        selection = 2'b00;
        #20;
        if (dispense !== 4'b0000) $error("Testcase 2 failed!");
    end

    // Testcase 3: Coin inserted, selection made, insufficient balance
    initial begin
        coin = 3'b010;
        selection = 2'b01;
        #20;
        if (dispense !== 4'b0000) $error("Testcase 3 failed!");
    end

    // Testcase 4: Coin inserted, selection made, sufficient balance
    initial begin
        coin = 3'b100;
        selection = 2'b10;
        #20;
        if (dispense !== 4'b0100) $error("Testcase 4 failed!");
    end

    initial begin
        $dumpfile("vending_machine.vcd");
        $dumpvars(0, vending_machine_tb);
        $monitor($time,"clk = %b, reset = %b, coin = %b, selection = %b, dispense = %b", clk, reset, coin, selection, dispense);
        #200 $finish;
    end
endmodule