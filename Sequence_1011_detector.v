module Sequence_detector(clk, rst, data_in, detect);

    input clk,rst,data_in;
    output reg [1:0] detect;

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk or negedge rst) begin

        if (rst == 1'b1) begin
            state   <= S0;
            detect  <= 2'b00;
        end
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state) 

            S0: begin
                if (data_in == 1'b1) begin
                    next_state  <= S1;
                    detect      <=2'b00;
                end
                else begin
                    next_state  <= S0;
                    detect      <= 2'b00;
                end
            end

            S1: begin
                if (data_in == 1'b1) begin
                    next_state  <= S1;
                    detect      <=2'b00;
                end
                else begin
                    next_state  <= S2;
                    detect      <= 2'b00;
                end
            end

            S2: begin
                if (data_in == 1'b1) begin
                    next_state  <= S3;
                    detect      <=2'b00;
                end
                else begin
                    next_state  <= S0;
                    detect      <= 2'b00;
                end
            end

            S3: begin
                if (data_in == 1'b1) begin
                    next_state  <= S1;
                    detect      <=2'b01;
                end
                else begin
                    next_state  <= S2;
                    detect      <= 2'b00;
                end
            end

        endcase

    end

endmodule