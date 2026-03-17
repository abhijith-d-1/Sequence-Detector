module Sequence_detector_tb;

    reg clk, rst, data_in;
    wire [1:0] detect;

    Sequence_detector dut_1011(
        .clk(clk), 
        .rst(rst), 
        .data_in(data_in), 
        .detect(detect)
    );


    always #5 clk=~clk;

    initial begin
        $dumpfile("Sequence_detector.vcd");
        $dumpvars(0);
    end

    initial begin

        clk = 1'b0;
        rst = 1'b1;
        #10
        rst = 1'b0;
        data_in = 1'b1; #10
        data_in = 1'b0; #10
        data_in = 1'b1; #10
        data_in = 1'b1; #10
        data_in = 1'b0; #10
        data_in = 1'b0; #10
        data_in = 1'b1; #10
        data_in = 1'b0; #10
        data_in = 1'b1; #10
        data_in = 1'b1; #10
        data_in = 1'b0; #10
        data_in = 1'b1; #10
        data_in = 1'b1; #10
        #10
        $finish;
    end

endmodule