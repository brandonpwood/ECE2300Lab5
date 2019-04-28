module signextend(IMM,OUT);

input [5:0] IMM;

output [7:0] OUT;

assign OUT = { IMM[5], IMM[5], IMM };

endmodule
