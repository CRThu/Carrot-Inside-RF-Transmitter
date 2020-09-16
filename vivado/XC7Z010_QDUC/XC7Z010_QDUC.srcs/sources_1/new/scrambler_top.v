`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/16 23:15:19
// Design Name: 
// Module Name: scrambler_top
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


module scrambler_top
    #(parameter PARALLEL_WIDTH = 16,
    parameter SCRAMBLER_WIDTH = 7)(
    input reset_n,
    input clk_in,
    input [PARALLEL_WIDTH-1:0] data_in,
    input data_in_valid,
    output [PARALLEL_WIDTH-1:0] data_out,
    output data_out_valid
    );
    
    wire data_scrambler_in;
    wire data_scrambler_in_valid;
    wire data_scrambler_out;
    wire data_scrambler_out_valid;
    
    p2s scrambler_p2s(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_in),
        .data_in_valid  (data_in_valid),
        .data_out       (data_scrambler_in),
        .data_out_valid (data_scrambler_in_valid));
    
    scrambler scrambler_inst(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_scrambler_in),
        .data_in_valid  (data_scrambler_in_valid),
        .data_out       (data_scrambler_out),
        .data_out_valid (data_scrambler_out_valid));
    
    s2p scrambler_s2p(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_scrambler_out),
        .data_in_valid  (data_scrambler_out_valid),
        .data_out       (data_out),
        .data_out_valid (data_out_valid));
    
endmodule
