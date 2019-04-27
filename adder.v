module adder(A, B, CI, Y, C, V); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;

  // outputs
  output [7:0] Y;
  output C;
  output V;

  // reg and internal variable definitions
  wire carry[7:0];
  
  // implement module here
  fullAdder A0(.A(A[0]), .B(B[0]), .Cin(CI), .Cout(carry[0]), .S(Y[0]) );
  fullAdder A1(.A(A[1]), .B(B[1]), .Cin(carry[0]), .Cout(carry[1]), .S(Y[1]) );
  fullAdder A2(.A(A[2]), .B(B[2]), .Cin(carry[1]), .Cout(carry[2]), .S(Y[2]) );
  fullAdder A3(.A(A[3]), .B(B[3]), .Cin(carry[2]), .Cout(carry[3]), .S(Y[3]) );
  fullAdder A4(.A(A[4]), .B(B[4]), .Cin(carry[3]), .Cout(carry[4]), .S(Y[4]) );
  fullAdder A5(.A(A[5]), .B(B[5]), .Cin(carry[4]), .Cout(carry[5]), .S(Y[5]) );
  fullAdder A6(.A(A[6]), .B(B[6]), .Cin(carry[5]), .Cout(carry[6]), .S(Y[6]) );
  fullAdder A7(.A(A[7]), .B(B[7]), .Cin(carry[6]), .Cout(carry[7]), .S(Y[7]) );
  
  assign C = carry[7];
  assign V = A[7]&B[7]&(~C) | (~A[7]&~B[7]&C);
  
  
endmodule
