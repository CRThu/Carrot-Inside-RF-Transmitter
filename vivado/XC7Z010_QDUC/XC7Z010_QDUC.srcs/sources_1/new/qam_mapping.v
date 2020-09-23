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
    localparam IQ_INDEX_MAX = $pow(DATA_WIDTH/2,2)-1;
    localparam ANALOG_LEVEL_MIN = -$pow(ANALOG_WIDTH,2);
    localparam ANALOG_LEVEL_MAX = $pow(ANALOG_WIDTH,2)-1;
    
    wire data_g2b_I_index_w;
    wire data_g2b_Q_index_w;
    wire [IQ_WIDTH-1:0] I_index;
    wire [IQ_WIDTH-1:0] Q_index;
    
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
            data_out_valid_r <= 1'b0;
        end
        else
        begin
            if(data_in_valid)
            begin
                data_r <= data_in;
                data_out_valid_r <= 1'b1;
            end
            else if(data_out_valid_r)
            begin
                data_r <= data_r;
                data_out_valid_r <= 1'b0;
            end
            else
            begin
                data_r <= data_r;
                data_out_valid_r <= 1'b0;
            end
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
    // ex. level=256
    // 0 -> -128
    // 1 -> -43
    // 2 -> +42
    // 3 -> +127
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            I_out_r <= 0;
            Q_out_r <= 0;
        end
        else
        begin
            // FIX HERE WHEN CHANGE M-QAM LEVEL
            case(I_index)
                4'h0:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h0;
                4'h1:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h1;
                4'h2:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h2;
                4'h3:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h3;
                4'h4:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h4;
                4'h5:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h5;
                4'h6:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h6;
                4'h7:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h7;
                4'h8:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h8;
                4'h9:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h9;
                4'hA:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hA;
                4'hB:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hB;
                4'hC:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hC;
                4'hD:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hD;
                4'hE:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hE;
                4'hF:   I_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hF;
            endcase
            
            case(Q_index)
                4'h0:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h0;
                4'h1:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h1;
                4'h2:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h2;
                4'h3:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h3;
                4'h4:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h4;
                4'h5:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h5;
                4'h6:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h6;
                4'h7:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h7;
                4'h8:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h8;
                4'h9:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'h9;
                4'hA:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hA;
                4'hB:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hB;
                4'hC:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hC;
                4'hD:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hD;
                4'hE:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hE;
                4'hF:   Q_out_r <= ANALOG_LEVEL_MIN + $pow(2,ANALOG_WIDTH-IQ_WIDTH) * 4'hF;
            endcase
        end
    end
    
endmodule
