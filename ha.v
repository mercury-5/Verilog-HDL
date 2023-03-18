module ha (
    input a,
    input b,
    output sum,
    output ca
    );
    
    assign sum = a ^ b;
    assign ca = a & b;
endmodule