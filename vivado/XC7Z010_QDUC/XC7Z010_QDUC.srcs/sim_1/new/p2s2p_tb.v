`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/16 21:00:04
// Design Name: 
// Module Name: p2s2p_tb
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


module p2s2p_tb;

    reg reset_n;
    reg clk_in;
    reg [15:0] data_p_in;
    reg data_p_in_valid;
    
    wire data_p_in_ready;
    
    wire data_s_out;
    wire data_s_out_valid;
    
    wire [15:0] data_p_out;
    wire data_p_out_valid;
    
    assign #1 data_s_in = data_s_out;
    assign #1 data_s_in_valid = data_s_out_valid;
    
    p2s p2s_inst(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_p_in),
        .data_in_valid  (data_p_in_valid),
        .data_in_ready  (data_p_in_ready),
        .data_out       (data_s_out),
        .data_out_valid (data_s_out_valid));
    
    s2p s2p_inst(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_s_in),
        .data_in_valid  (data_s_in_valid),
        .data_out       (data_p_out),
        .data_out_valid (data_p_out_valid));

    initial
    begin
        reset_n = 1'b1;
        clk_in = 1'b0;
        data_p_in = 1'b0;
        data_p_in_valid = 1'b0;
    end
    
    always
        #5 clk_in = ~clk_in;
    
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #8 data_p_in_valid = 1'b0;
        data_p_in = 16'hFFFF;
        #10 data_p_in_valid = 1'b0;
        data_p_in = 16'h0;
        
        #60 data_p_in_valid = 1'b1;
        data_p_in = 16'hABCD;
        #30 data_p_in_valid = 1'b0;
        data_p_in = 16'h0;
        
        #300 data_p_in_valid = 1'b1;
        data_p_in = 16'h1234;
        #10 data_p_in_valid = 1'b0;
        data_p_in = 16'h0;
        
        #170 data_p_in_valid = 1'b1;
        data_p_in = 16'h6789;
        #10 data_p_in_valid = 1'b0;
        data_p_in = 16'h0;
        
        #250 $stop;
    end
    

endmodule
