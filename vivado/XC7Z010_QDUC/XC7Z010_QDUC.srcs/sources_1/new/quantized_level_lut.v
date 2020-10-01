`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/27 15:39:01
// Design Name: 
// Module Name: quantized_level_lut
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

// TODO:NEED TO BE NORMALIZED TO 1
module quantized_level_lut
    #(parameter IQ_WIDTH = 4,
    parameter ANALOG_WIDTH = 16)(
    input clk_in,
    input [IQ_WIDTH-1:0] I_addr,
    output [ANALOG_WIDTH-1:0] I_data,
    input [IQ_WIDTH-1:0] Q_addr,
    output [ANALOG_WIDTH-1:0] Q_data
    );
    
    // quantized level
    // ex. 256QAM level=65536
    // -15:  0   -32768
    // -13:  1   -28399
    // -11:  2   -24030
    // -9:   3   -19661
    // -7:   4   -15292
    // -5:   5   -10923
    // -3:   6   -6554
    // -1:   7   -2185
    // +1:   8   +2184
    // +3:   9   +6553
    // +5:   A   +10922
    // +7:   B   +15291
    // +9:   C   +19660
    // +11:  D   +24029
    // +13:  E   +28398
    // +15:  F   +32767
    
    `ifdef USE_XILINX_IP
        // USE XILINX IP
        //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
        blk_mem_gen_0 blk_mem_gen_0_inst (
          .clka (clk_in),   // input wire clka
          .addra(I_addr),   // input wire [3 : 0] addra
          .douta(I_data),   // output wire [15 : 0] douta
          .clkb (clk_in),   // input wire clkb
          .addrb(Q_addr),   // input wire [3 : 0] addrb
          .doutb(Q_data)    // output wire [15 : 0] doutb
        );
        // INST_TAG_END ------ End INSTANTIATION Template ---------
    `else
        // USE VERILOG CODE
        localparam IQ_INDEX_MAX = $pow(2,IQ_WIDTH)-1;
        localparam ANALOG_LEVEL_MIN = -$pow(2,ANALOG_WIDTH-1);
        localparam ANALOG_LEVEL = $pow(2,ANALOG_WIDTH);
        
        reg signed [15:0] I_data_r;
        reg signed [15:0] Q_data_r;
        assign I_data = I_data_r;
        assign Q_data = Q_data_r;
        
        always@(posedge clk_in)
        begin
            // FIX HERE WHEN CHANGE M-QAM LEVEL
            case(I_addr)
                4'h0:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h0;
                4'h1:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h1;
                4'h2:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h2;
                4'h3:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h3;
                4'h4:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h4;
                4'h5:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h5;
                4'h6:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h6;
                4'h7:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h7;
                4'h8:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h8;
                4'h9:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h9;
                4'hA:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hA;
                4'hB:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hB;
                4'hC:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hC;
                4'hD:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hD;
                4'hE:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hE;
                4'hF:   I_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hF;
            endcase
            case(Q_addr)
                4'h0:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h0;
                4'h1:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h1;
                4'h2:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h2;
                4'h3:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h3;
                4'h4:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h4;
                4'h5:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h5;
                4'h6:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h6;
                4'h7:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h7;
                4'h8:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h8;
                4'h9:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'h9;
                4'hA:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hA;
                4'hB:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hB;
                4'hC:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hC;
                4'hD:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hD;
                4'hE:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hE;
                4'hF:   Q_data_r <= ANALOG_LEVEL_MIN + (ANALOG_LEVEL-1) / IQ_INDEX_MAX * 4'hF;
            endcase
        end
    `endif
endmodule
