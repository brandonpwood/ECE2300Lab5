module registerfile(SA, SB, LD, DR, D_IN, RESET, CLK, DATA_A, DATA_B);

input [2:0] SA;
input [2:0] SB;
input LD;
input [2:0] DR;
input [7:0] D_IN;
input RESET;
input CLK;

reg [7:0] register [7:0];

output [7:0] DATA_A = register[SA];
output [7:0] DATA_B = register[SB];

always @(posedge CLK) begin
    if (RESET == 1) begin
        register[3'b000] <= 8'b00000000;
        register[3'b001] <= 8'b00000000;
        register[3'b010] <= 8'b00000000;
        register[3'b011] <= 8'b00000000;
        register[3'b100] <= 8'b00000000;
        register[3'b101] <= 8'b00000000;
        register[3'b110] <= 8'b00000000;
        register[3'b111] <= 8'b00000000;
    end 
    else if (LD == 1) begin
        register[DR] <= D_IN    
    end
end

endmodule
