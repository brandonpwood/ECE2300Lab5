module logical(A, B, OP, Y); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input OP;

  // outputs
  output [7:0] Y;

  // reg and internal variable definitions
  
  // implement module here
  assign Y = (OP==1'b1 ? (A&B) : (A|B));

endmodule
