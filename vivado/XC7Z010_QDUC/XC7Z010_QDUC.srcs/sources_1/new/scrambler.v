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
    #(parameter SCRAMBLER_WIDTH = 7)(
    input reset_n,
    input clk_in,
    input data_vaild,
    input data_in,
    output data_out
    );
    
    reg data_out_r;
    
    reg [SCRAMBLER_WIDTH-1:0] d_r;  // scrambler registers
    
    assign calc_r = (d_r[7-1] ^ d_r[4-1]);  // polynomial
    assign data_out = data_out_r;
    
    // Scrambler
    always@(posedge clk_in or negedge reset_n)
    begin
        if(!reset_n)
        begin
            // initial : registers d are all 1
            d_r                 <= ~0;
            data_out_r          <= 1'b1;
        end
        else
        begin
            if(data_vaild)
            begin
                d_r             <= {d_r[SCRAMBLER_WIDTH-2:0], calc_r};
                data_out_r      <= data_in ^ calc_r;
            end
            else
            begin
                d_r             <= d_r;
                data_out_r      <= data_out_r;
            end
        end
    end
    
endmodule
