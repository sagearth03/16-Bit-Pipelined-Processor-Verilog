module alu (
    input  wire [15:0] a,       // 16-bit Input A
    input  wire [15:0] b,       // 16-bit Input B
    input  wire [3:0]  opcode,  // 4-bit Operation Selector
    output reg  [15:0] result,  // 16-bit Output Result
    output reg         zero     // Zero Flag
);

    always @(*) begin
        case (opcode)
            4'b0000: result = a + b;  // ADD (Full 16-bit)
            4'b0001: result = a - b;  // SUB (Full 16-bit)
            4'b0010: result = a & b;  // AND (Full 16-bit)
            4'b0011: result = a | b;  // OR  (Full 16-bit)
            
            // OPTIMIZED 8-BIT INSTRUCTIONS
            // We slice the inputs to only use the lower 8 bits: a[7:0] and b[7:0]
            4'b1000: result = a[7:0] * b[7:0];  // 8-bit MUL -> 16-bit result
            4'b1001: begin                      // 8-bit DIV -> 16-bit result
                if (b[7:0] != 8'h00)
                    result = a[7:0] / b[7:0];
                else
                    result = 16'h0000; // Fail-safe for Divide-by-Zero
            end
            
            default: result = 16'h0000;
        endcase
        
        // Compute the Zero Flag
        if (result == 16'h0000)
            zero = 1'b1;
        else
            zero = 1'b0;
    end

endmodule