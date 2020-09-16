`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/12 13:03:08
// Design Name: 
// Module Name: scrambler
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


module scrambler
    #(parameter SCRAMBLER_WIDTH = 7,
    parameter SCRAMBLER_POLYNOMIAL = 8'd145)(
    //#(parameter SCRAMBLER_WIDTH = 16,
    //parameter SCRAMBLER_POLYNOMIAL = 17'd65593)(
    input reset_n,
    input clk_in,
    input data_in,
    input data_in_valid,
    output data_out,
    output data_out_valid
    );
    
    reg data_out_r;
    reg data_out_valid_r;
    
    reg [SCRAMBLER_WIDTH-1:0] d_r;  // scrambler registers
    wire calc_r;
    //assign calc_r = (d_r[7-1] ^ d_r[4-1]);  // polynomial
    // generate polynomial
    // ex. POLY_PARAM = 145, S(x)=D^7+D^4+1
    // calc_gen_w[0] = 1'b0; calc_r = calc_gen_w[7];
    // calc_gen_w[7] = (POLY_PARAM[7] & d_r[7-1]) ^ calc_gen_w[7-1];
    // calc_gen_w[6] = (POLY_PARAM[6] & d_r[6-1]) ^ calc_gen_w[6-1];
    // ....
    // ...
    // calc_gen_w[1] = (POLY_PARAM[1] & d_r[1-1]) ^ calc_gen_w[1-1];
    genvar gv_i;
    wire [SCRAMBLER_WIDTH:0] calc_gen_w;
    assign calc_gen_w[0] = 1'b0;
    assign calc_r = calc_gen_w[SCRAMBLER_WIDTH];
    generate
        for(gv_i = 1; gv_i < SCRAMBLER_WIDTH + 1; gv_i = gv_i + 1)
        begin : S_POLY
            assign calc_gen_w[gv_i] = (SCRAMBLER_POLYNOMIAL[gv_i] & d_r[gv_i-1]) ^ calc_gen_w[gv_i-1];
        end
    endgenerate
    
    assign data_out = data_out_r;
    assign data_out_valid = data_out_valid_r;
    
    // Scrambler
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            // initial : registers d are all 1
            d_r                     <= ~0;
            data_out_r              <= 1'b1;
            data_out_valid_r        <= 1'b0;
        end
        else
        begin
            if(data_in_valid)
            begin
                d_r                 <= {d_r[SCRAMBLER_WIDTH-2:0], calc_r};
                data_out_r          <= data_in ^ calc_r;
                data_out_valid_r    <= 1'b1;
            end
            else
            begin
                d_r                 <= d_r;
                data_out_r          <= data_out_r;
                data_out_valid_r    <= 1'b0;
            end
        end
    end
    
endmodule
