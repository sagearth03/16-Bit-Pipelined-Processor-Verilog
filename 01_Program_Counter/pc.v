module pc (
    input  wire        clk,
    input  wire        reset,      // Master reset switch
    input  wire        jump,       // 1 = Jump to new address, 0 = go to next instruction
    input  wire [15:0] jump_addr,  // The address to jump to (for loops/if-statements)
    output reg  [15:0] pc_out      // The current instruction address
);

    // This block triggers on the rising edge of the clock OR the reset signal
    always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            pc_out <= 16'h0000;    // Power on: start at instruction 0
        end else if (jump == 1'b1) begin
            pc_out <= jump_addr;   // Jump to a specific instruction
        end else begin
            pc_out <= pc_out + 1;  // Normal operation: move to the next instruction
        end
    end

endmodule