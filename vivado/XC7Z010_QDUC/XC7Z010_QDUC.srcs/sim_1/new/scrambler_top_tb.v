`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/17 18:49:56
// Design Name: 
// Module Name: scrambler_top_tb
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


module scrambler_top_tb;

    reg reset_n;
    reg clk_in;
    reg [15:0] data_in;
    reg data_in_valid;
    
    wire [15:0] data_out;
    wire data_out_valid;
    
    scrambler_top #(
        .PARALLEL_WIDTH         (16),
        .SCRAMBLER_WIDTH        (7),
        .SCRAMBLER_POLYNOMIAL   (145))
        //.SCRAMBLER_WIDTH        (16),
        //.SCRAMBLER_POLYNOMIAL   (17'd65593))
    scrambler_top_inst(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_in),
        .data_in_valid  (data_in_valid),
        .data_out       (data_out),
        .data_out_valid (data_out_valid));

    initial
    begin
        reset_n = 1'b1;
        clk_in = 1'b0;
        data_in = 16'b0;
        data_in_valid = 1'b0;
    end
    
    always
        #5 clk_in = ~clk_in;
        
    integer i;
    reg [256-1:0] data_in_vec = 256'h416C7068610D0A427261766F0D0A436861726C69650D0A44656C74610D0A4563;
    reg [256-1:0] data_out_vec = 256'h0;
    
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #6 data_in_valid = 1'b0;
        
        for(i=0;i<256;i=i+16)
        begin
            #7 data_in_valid = 1'b1;
            data_in = data_in_vec[256-1-i -: 16];
            
            #13 data_in_valid = 1'b0;
            data_in = 16'hFFFF;
            
            #190 data_in_valid = 1'b0;
            data_out_vec[256-1-i -: 16] = data_out;
        end
        
        // raw:416C7068610D0A427261766F0D0A436861726C69650D0A44656C74610D0A4563
        // 145:4f9eb96a4723bc4ea686c245f75bfb967c97fe6d2950665dcca31c34f9a9349f
        // 65593:55ef2156fec97fc20c3dbb2447e5665b9b71c4bb309806eb09fc8fe514e28f36
        
        $display("%h",data_out_vec);
        $write("\n");
        
        #200 $stop;
    end
endmodule
