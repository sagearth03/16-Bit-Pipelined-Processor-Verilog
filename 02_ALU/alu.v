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
            4'b1000: result = a[7:0] * b[7:0];  // 8-bit MUL -> 16-bit result
            4'b1001: begin                      // 8-bit DIV -> 16-bit result
                if (b[7:0] != 8'h00)
                    result = a[7:0] / b[7:0];
                else
                    result = 16'h0000; // Fail-safe for Divide-by-Zero
            end
            
            // ==========================================
            // NEW AI / EDGE COMPUTING INSTRUCTIONS
            // ==========================================
            // ReLU (Rectified Linear Unit) for Neural Networks
            // If negative (MSB=1), output 0. Else, output A.
            4'b1010: result = (a[15] == 1'b1) ? 16'h0000 : a; 
            
            // Fast Average / Midpoint (Used in Image Processing/Pooling)
            // Adds A and B, then arithmetic right shift by 1 (divide by 2)
            4'b1011: result = (a + b) >> 1;
            
            default: result = 16'h0000;
        endcase
        
        // Compute the Zero Flag
        if (result == 16'h0000)
            zero = 1'b1;
        else
            zero = 1'b0;
    end

endmodule
