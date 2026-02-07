`timescale 1ns/1ps

module tb_alu_8bit;

    logic [7:0] A, B;
    logic [2:0] Opcode;
    logic [7:0] Result;
    logic Carry, Zero, Overflow;

    alu_8bit dut (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .Result(Result),
        .Carry(Carry),
        .Zero(Zero),
        .Overflow(Overflow)
    );

    initial begin
		$dumpfile("wave.vcd");
        $dumpvars(0, tb_alu_8bit);

		$monitor("A=%b B=%b Sel=%b | R=%b C=%b V=%b Z=%b",
        A, B, Opcode, Result, Carry, Overflow, Zero);

        // ADD (no overflow)
        A = 8'd10; B = 8'd20; Opcode = 3'b000; #10;

        // ADD (signed overflow)
        A = 8'd127; B = 8'd1; Opcode = 3'b000; #10;

        // SUB
        A = 8'd10; B = 8'd20; Opcode = 3'b001; #10;

        // AND
        A = 8'hAA; B = 8'h55; Opcode = 3'b010; #10;

        // OR
        Opcode = 3'b011; #10;

        // XOR
        Opcode = 3'b100; #10;

        // NOT
        Opcode = 3'b101; #10;

        // SHIFT LEFT
        A = 8'b00001111; Opcode = 3'b110; #10;

        // SHIFT RIGHT
        Opcode = 3'b111; #10;

        $finish;
    end

endmodule

