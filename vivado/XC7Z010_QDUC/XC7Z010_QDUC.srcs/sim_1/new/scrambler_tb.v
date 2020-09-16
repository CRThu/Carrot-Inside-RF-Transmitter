`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/13 21:43:46
// Design Name: 
// Module Name: scrambler_tb
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


module scrambler_tb;
    
    reg reset_n;
    reg clk_in;
    reg data_in;
    reg data_in_valid;
    
    wire data_out;
    wire data_out_valid;
    
    scrambler scrambler_inst(
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
        data_in = 1'b0;
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
        
        for(i=0;i<256;i=i+1)
        begin
            #7 data_in_valid = 1'b1;
            data_in = data_in_vec[256-1-i];
            
            #3 data_in_valid = 1'b0;
            data_out_vec[256-1-i] = data_out;
            
            #10 data_in_valid = 1'b0;
            data_in = 1'b1;
        end
        
        // 4f9eb96a4723bc4ea686c245f75bfb967c97fe6d2950665dcca31c34f9a9349f
        $display("%h",data_out_vec);
        $write("\n");
        
        $stop;
    end
    
endmodule
