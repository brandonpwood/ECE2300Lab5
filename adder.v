module adder(A,B,CI,Y,C,V); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;
  
  // outputs
  output [7:0] Y;
  output C;
  output V;
  
  
  // reg and internal variable definitions
  
  
  // implement module here
	
	wire C1;
	wire C2;
	wire C3;
	wire C4;
	wire C5;
	wire C6;
	wire C7;
	wire C8;
	wire Y0;
	wire Y1;
	wire Y2;
	wire Y3;
	wire Y4;
	wire Y5;
	wire Y6;
	wire Y7;
	onebit first(
		.A(A[0]),
		.B(B[0]),
		.CIN(CI),
		.O(Y0),
		.COUT(C1)
	);
	onebit second(
		.A(A[1]),
		.B(B[1]),
		.CIN(C1),
		.O(Y1),
		.COUT(C2)
	);
   onebit third(
		.A(A[2]),
		.B(B[2]),
		.CIN(C2),
		.O(Y2),
		.COUT(C3)
	);
	onebit fourth(
		.A(A[3]),
		.B(B[3]),
		.CIN(C3),
		.O(Y3),
		.COUT(C4)
	);
	onebit fifth(
		.A(A[4]),
		.B(B[4]),
		.CIN(C4),
		.O(Y4),
		.COUT(C5)
	);
	onebit sixth(
		.A(A[5]),
		.B(B[5]),
		.CIN(C5),
		.O(Y5),
		.COUT(C6)
	);
	onebit seventh(
		.A(A[6]),
		.B(B[6]),
		.CIN(C6),
		.O(Y6),
		.COUT(C7)
	);
	onebit eighth(
		.A(A[7]),
		.B(B[7]),
		.CIN(C7),
		.O(Y7),
		.COUT(C)
	);
	assign V = ((A[7] & B[7] & ~Y[7]) | (~A[7] & ~B[7] & Y[7])) ? 1'b1 : 1'b0;
	assign Y = {Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0};
endmodule
