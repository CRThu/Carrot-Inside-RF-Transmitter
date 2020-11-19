`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/18 17:45:23
// Design Name: 
// Module Name: duc_nco_tb
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


module duc_nco_tb;
    
    reg reset_n;
    reg clk_in;
    reg [31:0] freq_in;
    reg freq_in_valid;
    reg [15:0] data_in_I;
    reg [15:0] data_in_Q;
    reg data_in_valid;
    
    wire [15:0] data_out;
    wire data_out_valid;
    
    duc_nco #(
        .DATA_IN_WIDTH  (16),
        .DATA_OUT_WIDTH (16),
        .FREQ_WIDTH     (32))
    duc_nco_inst(
        .clk_in         (clk_in),
        .freq_in        (freq_in),
        .freq_in_valid  (freq_in_valid),
        .data_in_I      (data_in_I),
        .data_in_Q      (data_in_Q),
        .data_in_valid  (data_in_valid),
        .data_out       (data_out),
        .data_out_valid (data_out_valid));
    
    initial
    begin
        reset_n = 1'b1;
        clk_in = 1'b0;
        freq_in = 32'b0;
        freq_in_valid = 1'b0;
        data_in_I = 16'b0;
        data_in_Q = 16'b0;
        data_in_valid = 1'b0;
    end
    
    always
        #1 clk_in = ~clk_in;
        
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #30 freq_in = $pow(2,32)/300*25;
        #10 freq_in_valid = 1'b1;
        
        #30000 freq_in = $pow(2,32)/300*10;
        #10 freq_in_valid = 1'b1;
        
        // TODO DATA IN
        
        
        
        #20000 $stop;
    end
    
endmodule
