`include "ha.v"

module fa (
    input a,
    input b,
    input c,
    output sum,
    output ca
    );
    wire w0;
    wire w1;
    wire w2;
    
    ha ha1(
        .a(a),
        .b(b),
        .sum(w0),
        .ca(w1)
    );

    ha ha2(
        .a(c),
        .b(w0),
        .sum(sum),
        .ca(w2)
    );

    assign ca = w1 | w2;
endmodule