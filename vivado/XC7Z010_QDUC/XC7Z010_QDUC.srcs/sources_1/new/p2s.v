`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/14 11:31:29
// Design Name: 
// Module Name: p2s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module p2s
    #(parameter PARALLEL_WIDTH = 16)(
    input reset_n,
    input clk_in,
    input [PARALLEL_WIDTH-1:0] data_in,
    input data_in_valid,
    output data_in_ready,
    output data_out,
    output data_out_valid
    );
    
    reg data_in_ready_r;
    reg data_out_r;
    reg data_out_valid_r;
    reg [$clog2(PARALLEL_WIDTH):0] cnt;
    reg [PARALLEL_WIDTH-1:0] data_r;
    
    assign data_in_ready = data_in_ready_r;
    assign data_out = data_out_r;
    assign data_out_valid = data_out_valid_r;
    
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            cnt                     <= 0;
            data_r                  <= 0;
            data_out_r              <= 1'b0;
            data_out_valid_r        <= 1'b0;
            data_in_ready_r         <= 1'b0;
        end
        else
        begin
            if(cnt != 0)
            begin
                cnt                 <= cnt - 1'b1;
                data_r              <= (data_r << 1'b1);
                data_out_r          <= data_r[PARALLEL_WIDTH-1];
                data_out_valid_r    <= 1'b1;
                data_in_ready_r     <= 1'b0;
            end
            else if(data_in_valid & data_in_ready_r)
            begin
                cnt                 <= PARALLEL_WIDTH;
                data_r              <= data_in;
                data_out_r          <= 1'b0;
                data_out_valid_r    <= 1'b0;
                data_in_ready_r     <= 1'b0;
            end
            else
            begin
                cnt                 <= cnt;
                data_r              <= data_r;
                data_out_r          <= data_out_r;
                data_out_valid_r    <= 1'b0;
                data_in_ready_r     <= 1'b1;
            end
        end
    end
endmodule
