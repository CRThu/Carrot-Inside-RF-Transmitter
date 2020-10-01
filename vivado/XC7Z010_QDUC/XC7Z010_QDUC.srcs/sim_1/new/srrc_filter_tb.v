`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/30 22:24:40
// Design Name: 
// Module Name: srrc_filter_tb
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


module srrc_filter_tb;
    
    reg reset_n;
    reg clk_in;
    reg [15:0] data_in_I;
    reg [15:0] data_in_Q;
    reg data_in_valid;
    wire data_in_ready;
    
    wire [15:0] data_out_I;
    wire [15:0] data_out_Q;
    wire data_out_valid;
    
    srrc_filter #(
        .DATA_IN_WIDTH  (16),
        .DATA_OUT_WIDTH (16))
    srrc_filter_inst(
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
        
    reg [256-1:0] data_in_vec = 256'h416C7068610D0A427261766F0D0A436861726C69650D0A44656C74610D0A4563;

    integer i;
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #50 data_in_valid = 1'b0;
        
        for(i=0;i<256;i=i+1)
        begin
            // wait for data_in_ready
            while(!data_in_ready)
                #2 data_in_valid = 1'b0;
            
            #3 data_in_valid = 1'b1;
            if(data_in_vec[255-i]==1'b1)
                data_in_I = 16383;
            else
                data_in_I = -16384;
               
            #10 data_in_valid = 1'b0;
        end
        #200 $stop;
    end
        
endmodule
