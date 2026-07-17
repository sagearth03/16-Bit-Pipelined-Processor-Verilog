`timescale 1ns / 1ps

module alu_tb;

    reg [15:0] a;
    reg [15:0] b;
    reg [3:0]  opcode; 

    wire [15:0] result;
    wire        zero;

    alu uut (
        .a(a), .b(b), .opcode(opcode),
        .result(result), .zero(zero)
    );

    initial begin
        $dumpfile("alu_simulation.vcd");
        $dumpvars(0, alu_tb);

        // Test 1: ADD (Full 16-bit)
        a = 16'd10; b = 16'd5; opcode = 4'b0000; #10;
        
        // Test 2: 8-bit MUL (Max limit: 255 * 255 = 65,025)
        // 255 in hex is 0x00FF. The result should perfectly fit inside 16 bits.
        a = 16'h00FF; b = 16'h00FF; opcode = 4'b1000; #10;

        // Test 3: 8-bit DIV (200 / 5 = 40)
        a = 16'd200; b = 16'd5; opcode = 4'b1001; #10;

        // Test 4: Divide by Zero Safety (on lower 8 bits)
        // Upper 8 bits have data (0xFF), but lower 8 bits are 0x00
        a = 16'h0010; b = 16'hFF00; opcode = 4'b1001; #10;

        $display("Simulation complete.");
        $finish;
    end
endmodule