`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/08 23:55:26
// Design Name: 
// Module Name: halfband_filter
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

module halfband_filter
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
        
        // WARNING : START UP LATENCY = 17 + 15 CLKs
        
        // AXI4 Stream Port Structure
        // S_AXIS_DATA
        // Data Field            Type
        // Q    PATH_1(31:16)    fix16_0
        // I    PATH_0(15: 0)    fix16_0
        // M_AXIS_DATA
        // Data Field            Type
        // Q    PATH_1(41:24)    fix18_1
        // I    PATH_0(17: 0)    fix18_1
        
        // [17:0] -> [17:2] -> ¡Á2(¡ÁI) -> [15:0]
        
        wire [DATA_IN_WIDTH*2-1:0] data_in;
        assign data_in = {data_in_Q,data_in_I};
        
        wire data_filter_valid_w;
        wire filter_in_ready_w;
        wire [PATH_DATA_WIDTH*2-1:0] hb1_data_out;
        wire [DATA_OUT_WIDTH-1:0] data_filter_I;
        wire [DATA_OUT_WIDTH-1:0] data_filter_Q;
        assign data_filter_I = hb1_data_out[DATA_OUT_WIDTH+PATH_DATA_WIDTH*0-1:PATH_DATA_WIDTH*0];
        assign data_filter_Q = hb1_data_out[DATA_OUT_WIDTH+PATH_DATA_WIDTH*1-1:PATH_DATA_WIDTH*1];
        wire [DATA_OUT_WIDTH*2-1:0] hb0_data_in =  {data_filter_Q,data_filter_I};
        
        wire [PATH_DATA_WIDTH*2-1:0] data_out;
        assign data_out_I = data_out[DATA_OUT_WIDTH+PATH_DATA_WIDTH*0-1:PATH_DATA_WIDTH*0];
        assign data_out_Q = data_out[DATA_OUT_WIDTH+PATH_DATA_WIDTH*1-1:PATH_DATA_WIDTH*1];
        
        
        //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
        halfband_filter_1 halfband_filter_1_inst (
          .aclk                 (clk_in),               // input wire aclk
          .s_axis_data_tvalid   (data_in_valid),        // input wire s_axis_data_tvalid
          .s_axis_data_tready   (data_in_ready),        // output wire s_axis_data_tready
          .s_axis_data_tdata    (data_in),              // input wire [31 : 0] s_axis_data_tdata
          .m_axis_data_tvalid   (data_filter_valid_w),  // output wire m_axis_data_tvalid
          .m_axis_data_tdata    (hb1_data_out)          // output wire [47 : 0] m_axis_data_tdata
        );
        // INST_TAG_END ------ End INSTANTIATION Template ---------
        
        //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
        halfband_filter_0 halfband_filter_0_inst (
          .aclk                 (clk_in),               // input wire aclk
          .s_axis_data_tvalid   (data_filter_valid_w),  // input wire s_axis_data_tvalid
          .s_axis_data_tready   (filter_in_ready_w),    // output wire s_axis_data_tready
          .s_axis_data_tdata    (hb0_data_in),          // input wire [31 : 0] s_axis_data_tdata
          .m_axis_data_tvalid   (data_out_valid),       // output wire m_axis_data_tvalid
          .m_axis_data_tdata    (data_out)              // output wire [47 : 0] m_axis_data_tdata
        );
        // INST_TAG_END ------ End INSTANTIATION Template ---------
        
    `endif
endmodule
