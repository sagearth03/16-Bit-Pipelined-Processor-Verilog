`timescale 1ns / 1ps

module pc_tb;
    reg clk;
    reg reset;
    reg jump;
    reg [15:0] jump_addr;
    
    wire [15:0] pc_out;

    // Instantiating the Program Counter module I designed
    pc uut (
        .clk(clk), 
        .reset(reset), 
        .jump(jump), 
        .jump_addr(jump_addr), 
        .pc_out(pc_out)
    );

    // Generating a clock signal (flips every 5ns to create a 10ns time period)
    always #5 clk = ~clk;

    initial begin
        // Setting up the initial state for the simulation
        clk = 0; 
        reset = 1; 
        jump = 0; 
        jump_addr = 16'h0000;
        
        // Releasing the reset after 10ns so the PC can start counting naturally (0, 1, 2...)
        #10 reset = 0;
        
        // Letting it run for a bit to see the normal execution flow
        #30;
        
        // Testing the jump logic! Forcing the PC to branch to address 0x00AA
        jump = 1; 
        jump_addr = 16'h00AA;
        
        // Turning off the jump signal after 1 clock cycle so it continues counting from 0x00AA
        #10 jump = 0;
        
        // Waiting to check if it properly counts 0x00AA, 0x00AB, 0x00AC...
        #30;
        
        // Hitting the reset button again to make sure it falls back to 0 successfully
        reset = 1;
        #10;
        
        $display("Simulation Complete! Check the waveform.");
        $finish;
    end
endmodule