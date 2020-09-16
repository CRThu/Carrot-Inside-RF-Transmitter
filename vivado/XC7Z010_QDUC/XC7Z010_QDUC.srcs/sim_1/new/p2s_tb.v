`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/16 16:42:07
// Design Name: 
// Module Name: p2s_tb
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


module p2s_tb;
    
    reg reset_n;
    reg clk_in;
    reg [15:0] data_in;
    reg data_in_valid;
    
    wire data_out;
    wire data_out_valid;
    
    p2s p2s_inst(
    .reset_n        (reset_n),
    .clk_in         (clk_in),
    .data_in        (data_in),
    .data_in_valid  (data_in_valid),
    .data_out       (data_out),
    .data_out_valid (data_out_valid)
    );
    
    initial
    begin
        reset_n = 1'b1;
        clk_in = 1'b0;
        data_in = 1'b0;
        data_in_valid = 1'b0;
    end
    
    always
        #5 clk_in = ~clk_in;

    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #8 data_in_valid = 1'b0;
        data_in = 16'hFFFF;
        #10 data_in_valid = 1'b0;
        data_in = 16'h0;
        
        #100 data_in_valid = 1'b1;
        data_in = 16'hFFFF;
        #10 data_in_valid = 1'b0;
        data_in = 16'h0;
        
        #300 data_in_valid = 1'b1;
        data_in = 16'hCEED;
        #10 data_in_valid = 1'b0;
        data_in = 16'h0;
        
        #250 data_in_valid = 1'b1;
        data_in = 16'h4170;
        #10 data_in_valid = 1'b0;
        data_in = 16'h0;
        
        #300 data_in_valid = 1'b1;
        data_in = 16'h6C65;
        #10 data_in_valid = 1'b0;
        data_in = 16'h0;
        
        #200 $stop;
    end
    
endmodule
