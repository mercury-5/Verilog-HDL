module test_tb ();
    
    integer int_a;
    real real_b;
    time time_c;
    realtime rtime_d;

initial begin
    
    int_a = 16'd1234;
    real_b = 12.658;

    #20; //advancing simulation by 20ns
    time_c = $time;

    #20.45;
    rtime_d = $time;

//Printing all values
    $display("int_a = %d", int_a);
    $display("real_b = %f", real_b);
    $display("time_c = %d", time_c);
    $display("rtime_d = %f", rtime_d);

end

endmodule