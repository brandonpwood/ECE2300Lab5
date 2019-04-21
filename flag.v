module flag(Ytemp0, Ytemp1, Ytemp2, OP, Ca, Cs, Va, Y, N, V, C, Z);

  input [7:0] Ytemp0;
  input [7:0] Ytemp1;
  input [7:0] Ytemp2;
  input [2:0] OP;
  input Ca;
  input Cs;
  input Va;

  output reg [7:0] Y;
  output reg N;
  output reg V;
  output reg C;
  output reg Z;
  
  always @(*) begin
  if ((OP[2] == 1'b0 ) & (OP[1] == 1'b0))begin
    // Adder
     C <= Ca;
     V <= Va;
     N <= Y[7];
     Z <= (Y == 0) ? 1'b1 : 1'b0;
     Y <= Ytemp2;
  end
  
 else if (OP == 3'b101 | OP == 3'b110)
	begin 
    // Logic
     C <= 0;
     V <= 0;
     N <= Y[7];
     Z <= (Y == 0) ? 1'b1 : 1'b0;
     Y <= Ytemp0;
	end
	
  else 
  begin
    // Shifter
     C <= Cs;
     V <= 0;
     N <= Y[7];
     Z <= (Y == 0) ? 1'b1 : 1'b0;
     Y <= Ytemp1;
  end
  end
endmodule
