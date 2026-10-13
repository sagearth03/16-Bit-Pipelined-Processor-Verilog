`timescale 1ns / 1ps

module alu_tb;
    reg [15:0] a;
    reg [15:0] b;
    reg [3:0]  opcode; 

    wire [15:0] result;
    wire        zero;

    // Fixed module instantiation name from 'acdlu' to 'alu'
    alu uut (
        .a(a), .b(b), .opcode(opcode),
        .result(result), .zero(zero)
    );

    initial begin
        $dumpfile("alu_simulation.vcd");
        $dumpvars(0, alu_tb);

        // Test 1: ADD
        a = 16'd10; b = 16'd5; opcode = 4'b0000; #10;
        
        // Test 2: 8-bit MUL
        a = 16'h00FF; b = 16'h00FF; opcode = 4'b1000; #10;

        // Test 3: 8-bit DIV
        a = 16'd200; b = 16'd5; opcode = 4'b1001; #10;

        // Test 4: NEW AI INSTRUCTION - ReLU (Positive number)
        a = 16'd25; b = 16'd0; opcode = 4'b1010; #10;
        
        // Test 5: NEW AI INSTRUCTION - ReLU (Negative number, MSB is 1)
        a = 16'hFFFF; // -1 in 2's complement
        b = 16'd0; opcode = 4'b1010; #10;
        
        // Test 6: NEW AI INSTRUCTION - Fast Average
        a = 16'd10; b = 16'd20; opcode = 4'b1011; #10;

        $display("Simulation complete.");
        $finish;
    end
endmodule
