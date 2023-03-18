module dff (
    input d,
    input clk,
    input rst,
    output reg q,
    output qn
    );
    always@ (posedge clk or negedge rst) begin
        if (!rst)
            q <= 0;
        else
            q <= d;
    end
    assign qn = ~q;
endmodule