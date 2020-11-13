`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 19:21:46
// Design Name: 
// Module Name: cic_comp_filter
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

module cic_comp_filter
    #(parameter DATA_IN_WIDTH = 16,
    parameter DATA_OUT_WIDTH = 16,
    parameter PATH_DATA_WIDTH = 24)(
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
        
        // WARNING : START UP LATENCY = 9 CLKs
        
        // AXI4 Stream Port Structure
        // S_AXIS_DATA
        // Data Field            Type
        // Q    PATH_1(31:16)    fix16_0
        // I    PATH_0(15: 0)    fix16_0
        // M_AXIS_DATA
        // Data Field            Type
        // Q    PATH_1(41:24)    fix18_0
        // I    PATH_0(17: 0)    fix18_0
        
        // [17:0] -> [15:0]
        
        wire [DATA_IN_WIDTH*2-1:0] data_in;
        assign data_in = {data_in_Q,data_in_I};
        
        wire [PATH_DATA_WIDTH*2-1:0] data_out;
        assign data_out_I = data_out[DATA_OUT_WIDTH+PATH_DATA_WIDTH*0-1:PATH_DATA_WIDTH*0];
        assign data_out_Q = data_out[DATA_OUT_WIDTH+PATH_DATA_WIDTH*1-1:PATH_DATA_WIDTH*1];
        
        //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
        cic_comp_filter_0 cic_comp_filter_inst (
          .aclk                 (clk_in),           // input wire aclk
          .s_axis_data_tvalid   (data_in_valid),    // input wire s_axis_data_tvalid
          .s_axis_data_tready   (data_in_ready),    // output wire s_axis_data_tready
          .s_axis_data_tdata    (data_in),          // input wire [31 : 0] s_axis_data_tdata
          .m_axis_data_tvalid   (data_out_valid),   // output wire m_axis_data_tvalid
          .m_axis_data_tdata    (data_out)          // output wire [47 : 0] m_axis_data_tdata
        );
        // INST_TAG_END ------ End INSTANTIATION Template ---------
        
    `endif

endmodule
