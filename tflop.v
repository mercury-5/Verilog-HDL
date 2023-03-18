module tflop (t, clk, q);

    input t, clk;
    output reg q;

always @(posedge clk ) begin
    
    case(t)

        1'b0 : q <= ~q;
        1'b1 : q <= q;

    endcase
    
end
    
endmodule