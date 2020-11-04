`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 14:51:53
// Design Name: 
// Module Name: cic_filter
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

`define USE_XILINX_IP

module cic_filter
    #(parameter DATA_IN_WIDTH = 16,
    parameter DATA_OUT_WIDTH = 16)(
    input clk_in,
    input [DATA_IN_WIDTH-1:0] data_in_I,
    input [DATA_IN_WIDTH-1:0] data_in_Q,
    input data_in_valid,
    output data_in_ready,
    output [DATA_OUT_WIDTH-1:0] data_out_I,
    output [DATA_OUT_WIDTH-1:0] data_out_Q,
    output data_out_valid
    );

    `ifdef USE_XILINX_IP
        // USE XILINX IP
        
        
    `endif

endmodule
