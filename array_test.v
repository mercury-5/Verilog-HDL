module array_test ();
    
    reg [7:0] arr1;
    reg [7:0] arr2 [0:3];
    reg [15:0] arr3 [0:3][0:1];

initial begin

    arr1 = 8'hA9;
    $display("arr1 = %h", arr1);

    arr2[0] = 8'hAB;
    arr2[1] = 8'hCD;
    arr2[2] = 8'hEF;
    arr2[3] = 8'h12;

    for (integer i = 0; i < 4; i = i+1 ) begin

        $display("arr2[%d] = %h", i, arr2[i]);

    end
    
    for (integer i = 0; i < 4; i += 1 ) begin

        for (integer j = 0; j < 2; j += 1 ) begin

            arr3[i][j] = i + j;
            
            $display("arr3[%d][%d] = %h", i, j, arr3[i][j]);

        end

    end

end

endmodule