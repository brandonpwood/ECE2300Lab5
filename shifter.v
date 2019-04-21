module shifter(A, LA, LR, Y, C); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input LA;
  input LR;

  // outputs
  output [7:0] Y;
  output C;


  // reg and internal variable definitions
  reg [7:0] Y;
  reg C;


  // implement module here
  always @(*) begin
	if (LA == 1'b1) begin
		if (LR == 1'b1) begin
			Y[6:0] <= A[7:1];
			Y[7] <= A[0];
			C <= A[0];
		end
	end
	else begin
		if (LR == 1'b1) begin
			Y[6:0] <= A[7:1];
			Y[7] <= 1'b0;
			C <= A[0];
		end
		else begin
			Y[7:1] <= A[6:0];
			Y[0] <= 1'b0;
			C <= A[7];
		end
	end

  end


endmodule
