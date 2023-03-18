module jk_ff_race(
    input j, 
    input k,
    input clk,
    output reg q,
    output reg qn
    );

    always @(posedge clk) begin
        if (j && k) begin
            q <= ~q;
            qn <= ~q;
        end
        else if (j) begin
            q <= 1;
            qn <= ~qn;
        end 
        else if (k) begin
            q <= 0;
            qn <= ~q;
        end
    end
endmodule