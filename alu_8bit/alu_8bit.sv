module alu_8bit (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic [2:0] Opcode,
    output logic [7:0] Result,
    output logic Carry,
    output logic Zero,
    output logic Overflow
);

    logic [8:0] temp;

    always @(*) begin
        Result   = 8'b0;
        Carry    = 1'b0;
        Overflow = 1'b0;

        case (Opcode)
            4'b0000: begin
                temp     = A + B;
                Result   = temp[7:0];
                Carry    = temp[8];
                Overflow = (~(A[7] ^ B[7])) & (A[7] ^ Result[7]);
            end

            4'b0001: begin
                temp     = A - B;
                Result   = temp[7:0];
                Carry    = temp[8];
                Overflow = ((A[7] ^ B[7])) & (A[7] ^ Result[7]);
            end

            3'b010: Result = A & B;
            3'b011: Result = A | B;
            3'b100: Result = A ^ B;
            3'b101: Result = ~A;
            3'b110: Result = A << 1;
            3'b111: Result = A >> 1;

            default: Result = 8'b0;
        endcase
    end

    assign Zero = (Result == 8'b0);

endmodule

