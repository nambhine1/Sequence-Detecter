`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 09:18:15 AM
// Design Name: 
// Module Name: state_Machine
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

//This state machine detect the sequence of 110

module state_Machine(clk , rst, seq_in, det_out);

input clk,rst,seq_in;
output reg det_out;

parameter SIZE =4;
parameter IDLE =4'b0001;
parameter SO = 4'b0010;
parameter S1 = 4'b0100;
parameter S2 = 4'b1000;

reg [SIZE-1:0]current_state ,next_state;


always @ (posedge clk  or posedge rst)
begin

    if (rst)
    begin
        current_state <= IDLE;
    end
    else 
    begin
        current_state <= next_state;
    end

end


// combinational logic 

always @ (current_state,seq_in)
begin
    next_state = IDLE ;
    case (current_state)
    
    IDLE:
    begin
        if (seq_in)
        begin
            next_state = SO;
        end
        else
        begin
            next_state =IDLE;
        
        end
    end
    
    SO:
    begin
        if (seq_in)
        begin
            next_state = S1;
        end
        else
        begin
            next_state =IDLE;
        end
    end
    
    S1:
    begin
        if (seq_in)
        begin
            next_state =S1;
        end
        else
        begin
            next_state = S2;
        end
    
    end
    
    S2:
    begin
        if(seq_in)
        begin
            next_state = SO;
        end
        else
        begin
            next_state = IDLE;
        end
    end
    endcase

end

//OUTPUT result 

always @ (negedge clk)
begin
    if (rst)
    begin
        det_out =1'b0;
    
    end
    else
    begin
    case (current_state)
    
        IDLE:
        begin
            det_out =1'b0;
        end
        
        SO:
        begin
             det_out =1'b0;
        end
       
        S1:
        begin
             det_out =1'b0;
        end
       
       S2:
        begin
             det_out =1'b1;
        end
    
    endcase
    
    end
end
endmodule
