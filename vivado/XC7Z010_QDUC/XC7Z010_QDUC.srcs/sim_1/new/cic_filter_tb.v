`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 15:33:35
// Design Name: 
// Module Name: cic_filter_tb
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


module cic_filter_tb;
    
    reg reset_n;
    reg clk_in;
    reg signed [15:0] data_in_I;
    reg signed [15:0] data_in_Q;
    reg data_in_valid;
    wire data_in_ready;
    
    wire signed [15:0] data_out_I;
    wire signed [15:0] data_out_Q;
    wire data_out_valid;
    
    cic_filter #(
        .DATA_IN_WIDTH  (16),
        .DATA_OUT_WIDTH (16),
        .FILTER_R       (8),
        .FILTER_N       (5),
        .FILTER_M       (1)
        )
    cic_filter_inst(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in_I      (data_in_I),
        .data_in_Q      (data_in_Q),
        .data_in_valid  (data_in_valid),
        .data_in_ready  (data_in_ready),
        .data_out_I     (data_out_I),
        .data_out_Q     (data_out_Q),
        .data_out_valid (data_out_valid));
    
    initial
    begin
        reset_n = 1'b1;
        clk_in = 1'b0;
        data_in_I = 16'b0;
        data_in_Q = 16'b0;
        data_in_valid = 1'b0;
    end
    
    always
        #5 clk_in = ~clk_in;
    
    reg [16-1:0] data_in_vec[128-1:0];
    
    initial
        $readmemh("../../../../XC7Z010_QDUC.srcs/sim_1/new/cic_filter_tb_mem.dat",data_in_vec);
    
    integer i;
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #50 data_in_valid = 1'b0;
        
        for(i=0;i<128;i=i+1)
        begin
            // wait for data_in_ready
            while(!data_in_ready)
                #2 data_in_valid = 1'b0;
            
            #3 data_in_valid = 1'b1;
            data_in_Q = data_in_vec[i];
            
            // delay >= clk_period (?)
            #11 data_in_valid = 1'b0;
        end
        #200 $stop;
    end
    
endmodule
