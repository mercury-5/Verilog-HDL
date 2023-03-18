module halfSubtractor (D, Bo, A, B);

    input A,B;
    output D, Bo;
    wire x;

xor X1(D, A, B); //Difference
not N1(x, A); //Not of A
and A1(Bo, x, B);
    
endmodule