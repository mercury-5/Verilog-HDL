module mem16 (rdata, clk, rst, sel, wr, wdata);

    input clk, rst, sel, wr;
    input [15:0] wdata; //16-bit data to be pushed into the register
    output [15:0] rdata; //16-bit data to read out
    reg [15:0] register;

always @(posedge clk ) begin
    
    if(!rst) begin
        
        register <= 0;

    end

    else begin
        
        if(sel & wr) begin

            register <= wdata;

        end

        else begin
            
            register <= register;

        end

    end

end

assign rdata = (sel & (~wr)) ? register : 0;
    
endmodule