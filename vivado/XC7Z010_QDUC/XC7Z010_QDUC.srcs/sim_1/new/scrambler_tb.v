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
    reg data_vaild;
    reg data_in;
    
    wire data_out;
    
    scrambler scrambler_inst(
        .reset_n    (reset_n),
        .clk_in     (clk_in),
        .data_vaild (data_vaild),
        .data_in    (data_in),
        .data_out   (data_out));
    
    initial
    begin
        reset_n = 1'b1;
        clk_in = 1'b0;
        data_vaild = 1'b0;
        data_in = 1'b0;
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
        
        #6 data_vaild = 1'b0;
        
        for(i=0;i<256;i=i+1)
        begin
            #7 data_vaild = 1'b1;
            data_in = data_in_vec[256-1-i];
            
            #3 data_vaild = 1'b0;
            data_out_vec[256-1-i] = data_out;
        end
        
        $display("%h",data_out_vec);
        $write("\n");
        
        $stop;
    end
    
endmodule
