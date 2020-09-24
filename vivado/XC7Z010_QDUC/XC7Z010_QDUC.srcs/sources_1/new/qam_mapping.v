`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/21 10:54:23
// Design Name: 
// Module Name: qam_mapping
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


module qam_mapping
    #(parameter DATA_WIDTH = 8,
    parameter ANALOG_WIDTH = 16)(
    input reset_n,
    input clk_in,
    input [DATA_WIDTH-1:0] data_in,
    input data_in_valid,
    output [ANALOG_WIDTH-1:0] I_out,
    output [ANALOG_WIDTH-1:0] Q_out,
    output data_out_valid
    );
    
    localparam IQ_WIDTH = DATA_WIDTH/2;
    localparam IQ_INDEX_MAX = $pow(2,DATA_WIDTH/2)-1;
    localparam ANALOG_LEVEL_MIN = -$pow(2,ANALOG_WIDTH-1);
    localparam ANALOG_LEVEL_MAX = $pow(2,ANALOG_WIDTH-1)-1;
    
    wire [IQ_WIDTH-1:0] data_g2b_I_index_w;
    wire [IQ_WIDTH-1:0] data_g2b_Q_index_w;
    wire [IQ_WIDTH-1:0] I_index;
    wire [IQ_WIDTH-1:0] Q_index;
    
    reg data_in_valid_delay_r;
    reg [DATA_WIDTH-1:0] data_r;
    reg signed [ANALOG_WIDTH-1:0] I_out_r;
    reg signed [ANALOG_WIDTH-1:0] Q_out_r;
    reg data_out_valid_r;
    
    assign I_out = I_out_r;
    assign Q_out = Q_out_r;
    assign data_out_valid = data_out_valid_r;
    
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            data_r <= 0;
            data_in_valid_delay_r <= 1'b0;
        end
        else if(data_in_valid)
        begin
            data_r <= data_in;
            data_in_valid_delay_r <= 1'b1;
        end
        else
        begin
            data_r <= data_r;
            data_in_valid_delay_r <= 1'b0;
        end
    end
    
    // I-Channel
    gray2bin
    #(  .DATA_WIDTH(IQ_WIDTH))
    g2b_I_index(
        .gray   (data_r[DATA_WIDTH/2-1:0]),
        .bin    (data_g2b_I_index_w));
    
    // Q-Channel
    gray2bin
    #(  .DATA_WIDTH(IQ_WIDTH))
    g2b_Q_index(
        .gray   (data_r[DATA_WIDTH-1:DATA_WIDTH/2]),
        .bin    (data_g2b_Q_index_w));
    
    // relative position of I & Q
    // ex.
    // (0,3) (1,3) | (2,3) (3,3)
    // (0,2) (1,2) | (2,2) (3,2)
    // ------------+------------
    // (0,1) (1,1) | (2,1) (3,1)
    // (0,0) (1,0) | (2,0) (3,0)
    assign I_index = IQ_INDEX_MAX - data_g2b_I_index_w;
    assign Q_index = IQ_INDEX_MAX - data_g2b_Q_index_w;
    
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
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            I_out_r <= 0;
            Q_out_r <= 0;
            data_out_valid_r <= 1'b0;
        end
        else if(data_in_valid_delay_r)
        begin
            // TODO: USE ROM IP
            // FIX HERE WHEN CHANGE M-QAM LEVEL
            case(I_index)
                4'h0:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h0;
                4'h1:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h1;
                4'h2:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h2;
                4'h3:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h3;
                4'h4:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h4;
                4'h5:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h5;
                4'h6:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h6;
                4'h7:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h7;
                4'h8:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h8;
                4'h9:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h9;
                4'hA:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hA;
                4'hB:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hB;
                4'hC:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hC;
                4'hD:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hD;
                4'hE:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hE;
                4'hF:   I_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hF;
            endcase
            case(Q_index)
                4'h0:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h0;
                4'h1:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h1;
                4'h2:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h2;
                4'h3:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h3;
                4'h4:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h4;
                4'h5:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h5;
                4'h6:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h6;
                4'h7:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h7;
                4'h8:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h8;
                4'h9:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'h9;
                4'hA:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hA;
                4'hB:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hB;
                4'hC:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hC;
                4'hD:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hD;
                4'hE:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hE;
                4'hF:   Q_out_r <= ANALOG_LEVEL_MIN + ($pow(2,ANALOG_WIDTH)-1) / 15 * 4'hF;
            endcase
            data_out_valid_r <= 1'b1;
        end
        else
        begin
            I_out_r <= I_out_r;
            Q_out_r <= Q_out_r;
            data_out_valid_r <= 1'b0;
        end
    end
    
endmodule
