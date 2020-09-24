`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/24 14:53:56
// Design Name: 
// Module Name: qam_mapping_tb
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


module qam_mapping_tb;
    
    reg reset_n;
    reg clk_in;
    reg [7:0] data_in;
    reg data_in_valid;
    
    wire [15:0] I_out;
    wire [15:0] Q_out;
    wire data_out_valid;
    
    qam_mapping #(
        .DATA_WIDTH     (8),
        .ANALOG_WIDTH   (16))
    qam_mapping_inst(
        .reset_n        (reset_n),
        .clk_in         (clk_in),
        .data_in        (data_in),
        .data_in_valid  (data_in_valid),
        .I_out          (I_out),
        .Q_out          (Q_out),
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
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #6 data_in_valid = 1'b0;
        
        for(i=0;i<16;i=i+1)
        begin
            #7 data_in_valid = 1'b1;
            // FOR TESTING GRAY2BIN
            data_in = i*17+1;
            //data_in = $random;
            
            #3 data_in_valid = 1'b0;
            data_in = 16'hFFFF;
            
            #10 data_in_valid = 1'b0;
        end
        
        #50 $stop;
    end
endmodule
