module alu_8bit (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic [3:0] ALU_Sel,
    output logic [7:0] Result,
    output logic Carry,
    output logic Zero,
    output logic Overflow
);

    logic [8:0] temp;

    always @(*) begin
        // defaults
        Result   = 8'b0;
        Carry    = 1'b0;
        Overflow = 1'b0;

        case (ALU_Sel)
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

            4'b0010: Result = A & B;
            4'b0011: Result = A | B;
            4'b0100: Result = A ^ B;
            4'b0101: Result = ~A;
            4'b0110: Result = A << 1;
            4'b0111: Result = A >> 1;

            default: Result = 8'b0;
        endcase
    end

    assign Zero = (Result == 8'b0);

endmodule

