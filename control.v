module control(OP, CISEL, BSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP); 
// add other inputs and outputs here

  // inputs (add others here)
  input  [2:0]  OP;
  
  // outputs (add others here)
  output  CISEL;
  output	 BSEL;
  output  [1:0]  OSEL;
  output	 SHIFT_LA;
  output	 SHIFT_LR;
  output	 LOGICAL_OP;

  // reg and internal variable definitions
  reg [1:0]  OSEL;
  
  // implement module here (add other control signals below)
  assign CISEL = (OP == 3'b001) ? 1'b1 : 1'b0;
  assign BSEL = (OP == 3'b001) ? 1'b1 : 1'b0;
  
 always @(*) begin
	  case (OP) 
		 3'b010: OSEL <= 2'b01;
		 3'b011: OSEL <= 2'b01;
		 3'b100: OSEL <= 2'b01;
		 3'b101: OSEL <= 2'b10;
		 3'b110: OSEL <= 2'b10;
		 default: OSEL <= 2'b00;
	  endcase
  end
  
  assign SHIFT_LA = (OP == 3'b010) ? 1'b1 : 1'b0;
  assign SHIFT_LR = (OP != 3'b100) ? 1'b1 : 1'b0;
  assign LOGICAL_OP = (OP == 3'b101) ? 1'b1 : 1'b0;

endmodule
