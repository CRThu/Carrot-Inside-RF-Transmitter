`timescale 1ns / 1ns
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

//`define USE_XILINX_IP

module cic_filter
    #(parameter DATA_IN_WIDTH = 16,
    parameter DATA_OUT_WIDTH = 16,
    parameter FILTER_R = 8,
    parameter FILTER_N = 5,
    parameter FILTER_M = 1)(
    input reset_n,
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
        // TODO
        
    `else
        cic_interp_filter_top #(
            .DATA_IN_WIDTH  (DATA_IN_WIDTH),
            .DATA_OUT_WIDTH (DATA_OUT_WIDTH),
            .FILTER_R       (FILTER_R),
            .FILTER_N       (FILTER_N),
            .FILTER_M       (FILTER_M)
        )
        cic_interp_filter_I(
            .reset_n        (reset_n),
            .clk_in         (clk_in),
            .data_in        (data_in_I),
            .data_in_valid  (data_in_valid),
            .data_in_ready  (data_in_ready),
            .data_out       (data_out_I),
            .data_out_valid (data_out_valid)
            );
            
        cic_interp_filter_top #(
            .DATA_IN_WIDTH  (DATA_IN_WIDTH),
            .DATA_OUT_WIDTH (DATA_OUT_WIDTH),
            .FILTER_R       (FILTER_R),
            .FILTER_N       (FILTER_N),
            .FILTER_M       (FILTER_M)
        )
        cic_interp_filter_Q(
            .reset_n        (reset_n),
            .clk_in         (clk_in),
            .data_in        (data_in_Q),
            .data_in_valid  (data_in_valid),
            .data_in_ready  (data_in_ready),
            .data_out       (data_out_Q),
            .data_out_valid (data_out_valid)
            );
    `endif

endmodule
