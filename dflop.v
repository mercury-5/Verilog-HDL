//D-flipflop with Enable

module dflop (Q, Qb, D, clk, En);

    input D, clk, En;
    output reg Q, Qb;

always @(posedge clk) begin
    
    if (En) begin

        Q = D;
        Qb = ~Q;

    end

end
    
endmodule