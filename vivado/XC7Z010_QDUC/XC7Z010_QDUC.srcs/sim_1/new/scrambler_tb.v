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
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
       
        #20 data_vaild = 1'b1;
        
        for(i=0;i<127;i=i+1)
        begin
            #10 $write("%b ",data_out);
            if(i%16 == 15)
                $write("\n");
        end
        $write("\n");
        $stop;
    end
    
endmodule
