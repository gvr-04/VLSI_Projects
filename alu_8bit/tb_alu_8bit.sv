`timescale 1ns/1ps

module tb_alu_8bit;

    logic [7:0] A, B;
    logic [3:0] ALU_Sel;
    logic [7:0] Result;
    logic Carry, Zero, Overflow;

    // Instantiate DUT
    alu_8bit dut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .Result(Result),
        .Carry(Carry),
        .Zero(Zero),
        .Overflow(Overflow)
    );

    initial begin
		$dumpfile("wave.vcd");
        $dumpvars(0, tb_alu_8bit);

		$monitor("A=%b B=%b Sel=%b | R=%b C=%b V=%b Z=%b",
        A, B, ALU_Sel, Result, Carry, Overflow, Zero);

        // ADD (no overflow)
        A = 8'd10; B = 8'd20; ALU_Sel = 4'b0000; #10;

        // ADD (signed overflow)
        A = 8'd127; B = 8'd1; ALU_Sel = 4'b0000; #10;

        // SUB
        A = 8'd10; B = 8'd20; ALU_Sel = 4'b0001; #10;

        // AND
        A = 8'hAA; B = 8'h55; ALU_Sel = 4'b0010; #10;

        // OR
        ALU_Sel = 4'b0011; #10;

        // XOR
        ALU_Sel = 4'b0100; #10;

        // NOT
        ALU_Sel = 4'b0101; #10;

        // SHIFT LEFT
        A = 8'b00001111; ALU_Sel = 4'b0110; #10;

        // SHIFT RIGHT
        ALU_Sel = 4'b0111; #10;

        $finish;
    end

endmodule

