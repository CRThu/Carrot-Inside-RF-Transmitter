`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/13 17:18:42
// Design Name: 
// Module Name: duc_nco
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

module duc_nco
    #(parameter DATA_IN_WIDTH = 16,
    parameter DATA_OUT_WIDTH = 16,
    parameter PHASE_WIDTH = 32)(
    input clk_in,
    input [PHASE_WIDTH-1:0] phase_in,
    input phase_in_valid,
    input [DATA_IN_WIDTH-1:0] data_in_I,
    input [DATA_IN_WIDTH-1:0] data_in_Q,
    input data_in_valid,
    output [DATA_OUT_WIDTH-1:0] data_out,
    output data_out_valid
    );
    
    `ifdef USE_XILINX_IP
        // USE XILINX IP
        
        wire m_axis_data_tvalid;
        wire [DATA_IN_WIDTH*2-1:0] m_axis_data_tdata;
        wire [DATA_IN_WIDTH-1:0] SINE;
        wire [DATA_IN_WIDTH-1:0] COSINE;
        assign SINE = {m_axis_data_tdata[31:16]};
        assign COSINE = {m_axis_data_tdata[15:0]};

        
        // WARNING : START UP LATENCY = 17 + 15 CLKs
        
        // AXI4 Stream Port Structure
        // S_AXIS_PHASE
        // Data     Field           Type
        // PHASE    PINC  (31: 0)   ufix32_32
        // M_AXIS_DATA
        // Data     Field           Type
        // SIN      SINE  (31:16)   fix16_15
        // COS      COSINE(15: 0)   fix16_15
    
        //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
        dds_compiler_0 dds_compiler_0_inst (
          .aclk                 (clk_in),               // input wire aclk
          .s_axis_phase_tvalid  (phase_in_valid),       // input wire s_axis_phase_tvalid
          .s_axis_phase_tdata   (phase_in),             // input wire [31 : 0] s_axis_phase_tdata
          .m_axis_data_tvalid   (m_axis_data_tvalid),   // output wire m_axis_data_tvalid
          .m_axis_data_tdata    (m_axis_data_tdata)     // output wire [31 : 0] m_axis_data_tdata
        );
        // INST_TAG_END ------ End INSTANTIATION Template ---------
        
    `endif
    
endmodule
