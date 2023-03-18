module dff_5hz(
    input clk_in,
    input d,
    input rst,
    output reg clk_out,
    output reg q
    );

    reg [24:0] count = 0;
    reg [2:0] divide_count = 0;

    always @(posedge clk_in) begin
        if(!rst) begin
            count = 0;
            clk_out <= 0;
        end
        else begin
            count <= count + 1;
            if (count == 20000000) begin
                count <= 0;
                divide_count <= divide_count + 1;
            end
        end
    end

    always @(posedge clk_in) begin
        if (divide_count == 4) begin
            clk_out <= ~clk_out;
            divide_count <= 0;
        end
    end

    always @(posedge clk_out) begin
        if(!rst) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end
endmodule