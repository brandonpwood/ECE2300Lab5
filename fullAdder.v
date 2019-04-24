module fullAdder (A, B, Cin, S, Cout);
	input A, B, Cin;
	output S, Cout;
	
	assign Cout = Cin ? A|B : A&B;
	assign S = A^B^Cout;
	
	
	
endmodule
