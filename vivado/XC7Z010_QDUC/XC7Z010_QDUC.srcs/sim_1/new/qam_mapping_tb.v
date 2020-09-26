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
    
    wire signed [15:0] I_out;
    wire signed [15:0] Q_out;
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
    
    reg [128-1:0] data_in_vec = 128'hA337666075EF9992BF7DE1DD110BDC92;
    //reg [128-1:0] data_in_vec = 128'h776F2E1A538E3BE8D10B7ED023199554;
    
    integer i;
    initial
    begin
        #30 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        
        #14 data_in_valid = 1'b0;
        
        for(i=0;i<16;i=i+1)
        begin
            data_in_valid = 1'b1;
            // FOR TESTING GRAY2BIN
            //data_in = i*17+1;
            // FOR MATLAB TEST VECTOR
            data_in = data_in_vec[128-1-i*8 -: 8];
            
            #3 data_in_valid = 1'b0;
            
            if(i!=0)
                $display("I:%d\tQ:%d",I_out,Q_out);
            $write("data:0x%02h\t\t",data_in);
            
            #7 data_in_valid = data_in_valid;
            data_in = data_in;
        end
        #3 $display("I:%d\tQ:%d",I_out,Q_out);
        
        #50 $stop;
    end
endmodule
