`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/12 13:03:08
// Design Name: 
// Module Name: qduc_top
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

module qduc_top
    #(parameter PARALLEL_WIDTH = 16,
    parameter SCRAMBLER_WIDTH = 7,
    parameter SCRAMBLER_POLYNOMIAL = 8'd145)(
    input reset_n,
    input clk_in,
    input [PARALLEL_WIDTH-1:0] data_in,
    input data_in_valid,
    output data_in_ready,
    output [PARALLEL_WIDTH-1:0] data_out,
    output data_out_valid
    );
    
    scrambler_top #(
        .PARALLEL_WIDTH         (PARALLEL_WIDTH),
        .SCRAMBLER_WIDTH        (SCRAMBLER_WIDTH),
        .SCRAMBLER_POLYNOMIAL   (SCRAMBLER_POLYNOMIAL))
    scrambler_top_inst(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_in),
        .data_in_valid  (data_in_valid),
        .data_in_ready  (data_in_ready),
        .data_out       (data_out),
        .data_out_valid (data_out_valid));
        
endmodule
