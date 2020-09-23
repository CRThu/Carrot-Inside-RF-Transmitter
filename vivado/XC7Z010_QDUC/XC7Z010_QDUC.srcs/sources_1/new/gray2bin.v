`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/22 20:27:41
// Design Name: 
// Module Name: gray2bin
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


module gray2bin
    #(parameter DATA_WIDTH = 8)(
    input [DATA_WIDTH-1:0] gray,
    output [DATA_WIDTH-1:0] bin
    );
    
    genvar i;
    generate
        for(i=0;i<DATA_WIDTH;i=i+1)
        begin : bit_gen
            assign bin[i]= ^gray[DATA_WIDTH-1:i];
        end
    endgenerate
    
endmodule
