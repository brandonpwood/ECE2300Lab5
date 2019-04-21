module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);

//inputs
input [15:0] INST;

//outputs
output reg [2:0] DR;
output reg [2:0] SA;
output reg [2:0] SB;
output reg [5:0] IMM;
output reg MB;
output reg [2:0] FS;
output reg MD;
output reg LD;
output reg MW;
output reg [2:0] BS;
output reg [5:0] OFF;
output reg HALT;


initial DR = 3'b000;
initial SA = 3'b000;
initial SB = 3'b000;
initial IMM = 6'b000000;
initial MB = 1'b0;
initial FS = 3'b000;
initial MD = 1'b0;
initial LD = 1'b0;
initial MW = 1'b0;
initial BS = 3'b000;
initial OFF = 6'b000000;
initial HALT = 1'b0;

always @(INST) begin
  if (INST[15:12] == 4'b0000) begin
    //NOP
	 	DR = 3'b000;
		 SA = 3'b000;
		 SB = 3'b000;
		 IMM = 6'b000000;
		 MB = 1'b0;
		 FS = 3'b000;
		 MD = 1'b0;
		 LD = 1'b0;
		 MW = 1'b0;
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;  
	//HALT 
    if(INST[2:0]!=000) begin
		 DR = 3'b000;
		 SA = 3'b000;
		 SB = 3'b000;
		 IMM = 6'b000000;
		 MB = 1'b0;
		 FS = 3'b000;
		 MD = 1'b0;
		 LD = 1'b0;
		 MW = 1'b0;
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b1;   
		end
  end

  else if (INST[15:12] == 4'b1111) begin
		// We care about SB
		if (INST[2:0] < 3'b010| INST[2:0] > 3'b100) begin
			DR = INST[5:3];
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'b000000;
			MB = 1'b0;
			FS = INST[2:0];
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			BS = 3'b000;
			OFF = 6'b000000;
			HALT = 1'b0;
		end
		// We don't care about SB
		else begin 
			DR = INST[5:3];
			SA = INST[11:9];
			SB = 3'b0;
			IMM = 6'b000000;
			MB = 1'b0;
			FS = INST[2:0];
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			BS = 3'b000;
			OFF = 6'b000000;
			HALT = 1'b0;
		end
		
			
  end

  else begin
		 DR = 3'b000;
		 SB = 3'b000;
		 MB = 1'b0;
		 FS = 3'b000;
		 MD = 1'b0;
		 LD = 1'b0;
		 MW = 1'b0;
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;   
     SA = INST[11:9];
     IMM = INST[5:0];
	  
    case(INST[15:12])
      //LB
      4'b0010: begin
		 SA = INST[11:9];
		 SB = 3'b000;
		 IMM = INST[5:0];
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;   
         DR = INST[8:6];
			MB = 1'b1;
         FS = 3'b000;
         MD = 1'b1;
         LD = 1'b1;
         MW = 1'b0;
		end
      //SB
      4'b0100: begin 
		DR = 3'b000;
		 SA = INST[11:9];
		 IMM = INST[5:0];
		 FS = 3'b000;
		 MD = 1'b0;
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;   
         SB = INST[8:6];
         MB = 1'b1;
         LD = 1'b0;
         MW = 1'b1;
		end
      //ADDI
      4'b0101: begin
		 SA = INST[11:9];
		 SB = 3'b000;
		 IMM = INST[5:0];
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;   
         DR = INST[8:6];
         MB = 1'b1;
         FS = 3'b000;
         MD = 1'b0;
         LD = 1'b1;
         MW = 1'b0;
		end 
      //ANDI
      4'b0110: begin
		 SA = INST[11:9];
		 SB = 3'b000;
		 IMM = INST[5:0];
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;   
         DR = INST[8:6];
         MB  = 1'b1;
         FS = 3'b101;
         MD = 1'b0;
         LD = 1'b1;
         MW = 1'b0;
		end 
      //ORI
      4'b0111: begin
		 SB = 3'b000;
		 IMM = INST[5:0];
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;   
         DR = INST[8:6];
         SA = INST[11:9];
         MB = 1'b1;
         FS = 3'b110;
         MD = 1'b0;
         LD = 1'b1;
         MW = 1'b0;
		end
      default: begin
        //NOP
		 DR = 3'b000;
		 SA = 3'b000;
		 SB = 3'b000;
		 IMM = 6'b000000;
		 MB = 1'b0;
		 FS = 3'b000;
		 MD = 1'b0;
		 LD = 1'b0;
		 MW = 1'b0;
		 BS = 3'b000;
		 OFF = 6'b000000;
		 HALT = 1'b0;   
		end
    endcase
  end
end

endmodule
