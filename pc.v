module PC(CLK, RESET, OUT);

input CLK;
input RESET;

output [15:0] OUT;

reg [15:0] NEXTPC;

always @(posedge clk)
    if (RESET == 0) begin
        NEXTPC <= NEXTPC + 16'b0000000000000010;
    end
    else begin
        NEXTPC <= 16'b0000000000000000;
    end
end

assign OUT = NEXTPC;

endmodule
