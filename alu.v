module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;


  // ADD YOUR CODE BELOW THIS LINE
  wire Ytemp, Ca, Cs, Va, CISEL, BSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP, Bfix;


  control freak(
    .OP(OP),
    .CISEL(CISEL),
    .BSEL(BSEL),
    .OSEL(OSEL),
    .SHIFT_LA(SHIFT_LA),
    .SHIFT_LR(SHIFT_LR),
    .LOGICAL_OP(LOGICAL_OP)
  );

  logical paradox(
    .A(A),
    .B(B),
    .OP(LOGICAL_OP),
    .Y(Ytemp0)
  );

  shifter iDontGiveAShift(
    .A(A),
    .LA(SHIFT_LA),
    .LR(SHIFT_LR),
    .Y(Ytemp1),
    .C(Cs)
  );

  twoOneMux Bneg(
    .X(B),
    .Y(~B),
    .SEL(BSEL),
    .OUT(Bfix)
  );

  adder Addi(
    .A(A),
    .B(Bfix),
    .CI(CISEL),
    .Y(Ytemp2),
    .C(Ca),
    .V(Va)
  );

  flag football(
    .OP(OP),
    .Y(Y),
    .Ytemp0(Ytemp0),
    .Ytemp1(Ytemp1),
    .Ytemp2(Ytemp2),
    .Va(Va),
    .Ca(Ca),
    .Cs(Cs),
    .N(N),
    .C(C),
    .V(V),
    .Z(Z)
  );

  // ADD YOUR CODE ABOVE THIS LINE


endmodule
