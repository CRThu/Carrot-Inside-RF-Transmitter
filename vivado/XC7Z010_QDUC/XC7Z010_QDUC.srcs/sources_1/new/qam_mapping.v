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
    localparam IQ_INDEX_MAX = $pow(2,IQ_WIDTH)-1;
    localparam ANALOG_LEVEL = $pow(2,ANALOG_WIDTH);
    localparam ANALOG_LEVEL_MIN = -$pow(2,ANALOG_WIDTH-1);
    localparam ANALOG_LEVEL_MAX = $pow(2,ANALOG_WIDTH-1)-1;
    
    wire [IQ_WIDTH-1:0] data_g2b_I_index_w;
    wire [IQ_WIDTH-1:0] data_g2b_Q_index_w;
    wire [IQ_WIDTH-1:0] I_index;
    wire [IQ_WIDTH-1:0] Q_index;
    
    reg data_in_valid_delay_r;
    reg [DATA_WIDTH-1:0] data_r;
    reg data_out_valid_r;
    
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
    
    // data out valid signal
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            data_out_valid_r <= 1'b0;
        end
        else if(data_in_valid_delay_r)
        begin
            data_out_valid_r <= 1'b1;
        end
        else
        begin
            data_out_valid_r <= 1'b0;
        end
    end
    
    // I&Q out
    quantized_level_lut #(
        .IQ_WIDTH       (IQ_WIDTH),
        .ANALOG_WIDTH   (ANALOG_WIDTH))
    quantized_level_lut_inst(
        .clk_in         (clk_in),
        .I_addr         (I_index),
        .I_data         (I_out),
        .Q_addr         (Q_index),
        .Q_data         (Q_out)
    );
    
endmodule
