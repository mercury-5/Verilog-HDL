module array_ex (rdata, clk, rst, addr, wr, sel, wdata);
    
    input clk, rst, wr, sel;
    input [1:0] addr;
    input [15:0] wdata;
    output [15:0] rdata;
    reg [15:0] register;

always @(posedge clk ) begin

    if (!rst) begin
        
        for (integer i = 0; i < 4; i += 1) begin
            
            register[i] <= 0;

        end

    end

    else begin
        
        if (sel & wr) begin

            register[addr] <= wdata;

        end

        else begin
            
            register[addr] <= register[addr];

        end

    end

end

assign rdata = (sel & (~wr)) ? register[addr] : 0;

endmodule