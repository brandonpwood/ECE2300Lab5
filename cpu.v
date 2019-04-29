module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  reg [7:0] NextPC;
  
  wire MW;
  
  
  
  // ADD YOUR CODE BELOW THIS LINE
  
  wire [2:0] DR;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMM;
  wire MB;
  wire [2:0] FS;
  wire MD;
  wire LD;
  wire [2:0] BS;
  wire [5:0] OFF;
  wire HALT;
  
  wire [7:0] IMM2; // Sign-extended IMM
  wire [7:0] ALU_B; // Data_B out of mux and into ALU
  
  wire C;
  wire V;
  wire N;
  wire Z;

  wire H; // For halt

  always @(posedge CLK) begin
    if (RESET) begin
        PC <= 8'b00000000;
    end
    else begin 
        PC <= NextPC
    end
  end

  
  decoder yeet(
    .INST(Iin),
    .DR(DR),
    .SA(SA),
    .SB(SB), 
    .IMM(IMM),
    .MB(MB), 
    .FS(FS),
    .MD(MD),
    .LD(LD),
    .MW(MW),
    .BS(BS),
    .OFF(OFF),
    .HALT(HALT),
  );

  assign H = (HALT & EN_L);

  registerfile yeEt(
    .SA(SA),
    .SB(SB),
    .LD(LD),
    .DR(DR), 
    .D_IN(DataC),
    .RESET(RESET), 
    .CLK(CLK), 
    .DATA_A(DataA),
    .DATA_B(DataB),
  );

  signextend extend(
    .IMM(IMM),
    .OUT(IMM2),
  );

  // With MB Select 
  twoOneMux mux1(
    .X(DataB),
    .Y(IMM2),
    .SEL(MB),
    .OUT(DataD)
  );

  alu YEet(
    .A(DataA), 
    .B(ALU_B), 
    .OP(FS), 
    .Y(DataD),
    .C(C), 
    .V(V), 
    .N(N),
    .Z(Z),
  );

  // With MD Select
  twoOneMux mux2(
    .X(Din),
    .Y(ALU_OUT),
    .SEL(MD),
    .OUT(DataC),
      
  );

  // For PC
  twoOneMux mux3(
    .X(PC);
    .Y(PC + 8'b00000010);
    .SEL(H);
    .OUT(NextPC);
  
  );

  // ADD YOUR CODE ABOVE THIS LINE

endmodule
