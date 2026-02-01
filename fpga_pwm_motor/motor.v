module motor(
	input clk,
	input [2:0] switch,
	output reg [2:0] motor
);

parameter cycle_len = 10;
parameter duty0 = 4;
parameter duty1 = 8;

integer counter = 0;
always @(posedge clk) begin
	if (counter < cycle_len) counter <= counter + 1;
	else counter <= 0;
end

always @(*) begin
	motor = 3'd0;
	if (switch[0]) begin
		motor[0] = switch[1] ? 0:1;
		motor[1] = switch[1] ? 1:0;
		motor[2] = (counter < (switch[2] ? duty1:duty0)) ? 1'b1:1'b0;
	end
end
endmodule

