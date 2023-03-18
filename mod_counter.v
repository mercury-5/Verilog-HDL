module mod_counter #(
    parameter N = 10,
    parameter WIDTH = 4
    )
    
    (
        input clk,
        input rst,
        output reg [WIDTH-1:0] count
    );
    
    always @(posedge clk ) begin
        if(!rst) begin
            count <= 0;
        end
        else begin
            if(count == N - 1)begin
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
        end
    end
endmodule