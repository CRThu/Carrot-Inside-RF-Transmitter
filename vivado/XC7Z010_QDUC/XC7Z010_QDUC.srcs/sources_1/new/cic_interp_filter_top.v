`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 15:08:02
// Design Name: 
// Module Name: cic_interp_filter_top
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


module cic_interp_filter_top
    #(parameter DATA_IN_WIDTH = 16,
    parameter DATA_OUT_WIDTH = 16,
    parameter FILTER_R = 8,
    parameter FILTER_N = 5,
    parameter FILTER_M = 1  /* TODO:fixed M=1 */)(
    input reset_n,
    input clk_in,
    input signed [DATA_IN_WIDTH-1:0] data_in,
    input data_in_valid,
    output data_in_ready,
    output signed [DATA_OUT_WIDTH-1:0] data_out,
    output data_out_valid
    );
    
    /* Bout = Bin + N*log2(R*M) */
    localparam FILTER_DATA_WIDTH = DATA_IN_WIDTH+FILTER_N*$clog2(FILTER_R*FILTER_M);
    
    reg data_in_ready_r;
    reg data_out_valid_r;
    
    assign data_in_ready = data_in_ready_r;
    assign data_out_valid = data_out_valid_r;
    
    // CIC Filter
    // --> Comb -> ... -> Comb --> ¡ÁR --> Int -> ... -> Int -->
    
    /* N Stages Comb */
    wire signed [FILTER_DATA_WIDTH-1:0] cic_comb_net [FILTER_N:0];
    reg  signed [FILTER_DATA_WIDTH-1:0] cic_comb_reg [FILTER_N-1:0];
    assign cic_comb_net[0] = data_in;
    genvar i;
    generate
        for(i=0;i<FILTER_N;i=i+1)
        begin : comb_gen
            assign cic_comb_net[i+1] = cic_comb_net[i] - cic_comb_reg[i];
            always@(posedge clk_in or negedge reset_n)
            begin
                if(!reset_n)
                    cic_comb_reg[i] <= 0;
                else if(data_in_valid & data_in_ready_r)
                    cic_comb_reg[i] <= cic_comb_net[i];
                else
                    cic_comb_reg[i] <= cic_comb_reg[i];
            end
        end
    endgenerate
    
    /* Interpolation (¡ÁR) */
    reg [$clog2(FILTER_R)-1:0] cic_interp_cnt;
    reg signed [FILTER_DATA_WIDTH-1:0] cic_interp_r;
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            cic_interp_cnt <= 0;
            data_in_ready_r <= 1'b0;
            data_out_valid_r <= 1'b0;
            cic_interp_r <= 0;
        end
        else if(cic_interp_cnt != 0)
        begin
            cic_interp_cnt <= cic_interp_cnt - 1'b1;
            data_in_ready_r <= 1'b0;
            data_out_valid_r <= 1'b1;
            cic_interp_r <= 0;    // insert 0 data
        end
        else if(data_in_valid & data_in_ready_r)
        begin
            cic_interp_cnt <= FILTER_R - 1;
            data_in_ready_r <= 1'b0;
            data_out_valid_r <= 1'b1;
            cic_interp_r <= cic_comb_net[FILTER_N];   // comb data out
        end
        else
        begin
            cic_interp_cnt <= cic_interp_cnt;
            data_in_ready_r <= 1'b1;
            data_out_valid_r <= 1'b0;
            cic_interp_r <= cic_interp_r;
        end
    end
    
    /* N Stages Integrator */
    wire signed [FILTER_DATA_WIDTH-1:0] cic_int_net [FILTER_N:0];
    reg  signed [FILTER_DATA_WIDTH-1:0] cic_int_reg [FILTER_N-1:0];
    assign cic_int_net[0] = cic_interp_r;
    generate
        for(i=0;i<FILTER_N;i=i+1)
        begin : int_gen
            assign cic_int_net[i+1] = cic_int_net[i] + cic_int_reg[i];
            always@(posedge clk_in or negedge reset_n)
            begin
                if(!reset_n)
                    cic_int_reg[i] <= 0;
                else if(data_out_valid_r)
                    cic_int_reg[i] <= cic_int_net[i+1];
                else
                    cic_int_reg[i] <= cic_int_reg[i];
            end
        end
    endgenerate
    
    assign data_out = cic_int_net[FILTER_N][FILTER_DATA_WIDTH-1:FILTER_DATA_WIDTH-DATA_OUT_WIDTH];
    
endmodule
