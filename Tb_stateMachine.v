`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 09:38:15 AM
// Design Name: 
// Module Name: Tb_stateMachine
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


module Tb_stateMachine(

    );
    
reg clk , rst, seq_in;
wire det_out;    
    
state_Machine uut(clk , rst, seq_in, det_out);
initial
begin
    clk =0;
    rst=1;
    seq_in=0;
    #50
    rst=0;
    #50
    seq_in =0;
    #50
    seq_in=1;
    #50
    seq_in=1;
    #50
    seq_in=0;
end  
always 
begin
    #10 clk = ! clk;
end  
endmodule
