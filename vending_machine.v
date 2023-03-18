module vending_machine (
    input clk,
    input reset,
    input [2:0] coin,
    input [1:0] selection,
    output reg [3:0] dispense
    );

    parameter S_IDLE = 2'b00;
    parameter S_SELECTION = 2'b01;
    parameter S_DISPENSE = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;
    reg [3:0] balance;

    parameter COKE_PRICE = 2;
    parameter PEPSI_PRICE = 3;
    parameter SPRITE_PRICE = 4;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S_IDLE;
            balance <= 0;
        end
        else begin
            state <= next_state;
            case (state)
            S_IDLE: begin
                if (coin > 0) begin
                    next_state <= S_SELECTION;
                    balance <= coin;
                end
                else begin
                    next_state <= S_IDLE;
                    balance <= 0;
                end
            end
            S_SELECTION: begin
                if (selection == 2'b00 && balance >= COKE_PRICE) begin
                    next_state <= S_DISPENSE;
                    balance <= balance - COKE_PRICE;
                    dispense <= 4'b0001;
                end
                else if (selection == 2'b01 && balance >= PEPSI_PRICE) begin
                    next_state <= S_DISPENSE;
                    balance <= balance - PEPSI_PRICE;
                    dispense <= 4'b0010;
                end
                else if (selection == 2'b10 && balance >= SPRITE_PRICE) begin
                    next_state <= S_DISPENSE;
                    balance <= balance - SPRITE_PRICE;
                    dispense <= 4'b0100;
                end
                else if (coin > 0) begin
                    next_state <= S_SELECTION;
                    balance <= balance + coin;
                end
                else begin
                    next_state <= S_SELECTION;
                    balance <= balance;
                end
            end
            S_DISPENSE: begin
                next_state <= S_IDLE;
                balance <= 0;
                dispense <= 4'b0000;
            end
            default: next_state <= S_IDLE;
            endcase
        end
    end
endmodule