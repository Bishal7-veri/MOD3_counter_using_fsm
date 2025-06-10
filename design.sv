

module mod3_counter_fsm (input wire clk, rst,
                         output reg [1:0] count);
  
  typedef enum bit [1:0] {S0 = 2'b00,
               S1 = 2'b01,
                S2 = 2'b10
               } states ;
  states current_state , next_state;
  always @ (posedge clk)
    begin
       if(rst)
         begin
           current_state <= S0;
         end 
  	else
      begin
        current_state <= next_state;
      end	
    end
  always @ (posedge clk)
    begin
      case (current_state)
        S0 : next_state <= S1;
        S1 : next_state <= S2;
        S2 : next_state <= S0;
        default : next_state <= S0;
      endcase
    end
  always @(posedge clk)
    begin
      case (current_state)
        S0 : count <= 2'd0;
      	S1 : count <= 2'd1;
      	S2 : count <= 2'd2;
      	default : count <= 2'd0;
      endcase
     
    end
   
endmodule
