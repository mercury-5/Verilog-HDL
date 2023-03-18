module example1 ();
    
    reg [8*11:1]str1;
    reg [8*5:1]str2;
    reg [8*20:1]str3;

initial begin
    
    str1 = "Hello World";
    str2 = "Hello World";
    str3 = "Hello World";

    $display("str1 = %s", str1);
    $display("str2 = %s", str2);
    $display("str3 = %s", str3);

end

endmodule