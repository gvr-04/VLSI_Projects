`timescale 1ns / 1ps
`include "motor.v"

module motor_tb;

reg clk;
reg [2:0] switch;

wire [2:0] motor;

motor uut (
    .clk(clk),
    .switch(switch),
    .motor(motor)
);

initial clk = 0;
always #10 clk = ~clk;

initial begin
	$dumpfile("final.vcd");
	$dumpvars(0, motor_tb);

    switch = 3'b000;
    #400;

    switch = 3'b001;
    #400;

    switch = 3'b101;
    #400;

    switch = 3'b011;
    #400;

    switch = 3'b111;
    #400;

    $finish;
end

endmodule

