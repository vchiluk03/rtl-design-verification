task reset_fifo();
begin 
    rst_n = 1;
    #2;
    rst_n = 0; //Reset Applied -  it will make all outputs zero.
    //make all inputs zero
    wr_en = 0;
    rd_en = 0;
    wr_data = 0;
    $display("time-%0t:\t========RESET APPLIED==========",$time);
    repeat(2) @(posedge clk);
    rst_n = 1;
end
endtask

task write_fifo(input integer num_locations);
begin 
    for(i=0;i<num_locations;i=i+1) begin 
        @(posedge clk);
        if(full) $display("FIFO IS FULL and POINTER POINTS TO LOCATION : %0d",dut.wr_ptr);
        else begin
            wr_en = 1;
            wr_data = $random;
            #1;
            $display("USER WROTE DATA : %0d\t\t\t===>POINTS TO LOCATION : %0d\t==>FULL flag=%b",wr_data,dut.wr_ptr,full);
        end
    end
    @(posedge clk) wr_en=0;
    
end
endtask

task read_fifo(input integer num_locations);
begin 
    for(i=0;i<num_locations;i=i+1) begin 
        fork 
        begin
            @(posedge clk);
            rd_en = 1;
            $display("POINTER POINTS TO LOCATION : %0d",dut.rd_ptr);
        end
        begin
            repeat(2) @(posedge clk);
            #1;
            $display("AND USER READING THE DATA : %0d",rd_data);
        end 
        join
    end

end

endtask