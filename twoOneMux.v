module twoOneMux (X, Y, SEL, OUT);

  input [7:0] X;
  input [7:0] Y;
  input SEL;

  output [7:0] OUT;

  assign OUT = (SEL == 1'b0) ? X : Y;


endmodule
  