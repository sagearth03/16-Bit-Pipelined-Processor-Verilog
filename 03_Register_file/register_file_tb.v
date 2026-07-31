`timescale 1ns / 1ps

module register_file_tb;

    // Inputs
    reg        clk;
    reg        we;
    reg [3:0]  read_addr_1;
    reg [3:0]  read_addr_2;
    reg [3:0]  write_addr;
    reg [15:0] write_data;

    // Outputs
    wire [15:0] read_data_1;
    wire [15:0] read_data_2;

    // Instantiate the Register File
    register_file uut (
        .clk(clk), .we(we), 
        .read_addr_1(read_addr_1), .read_addr_2(read_addr_2), 
        .write_addr(write_addr), .write_data(write_data),
        .read_data_1(read_data_1), .read_data_2(read_data_2)
    );

    // Generate a simulated clock (Flips on/off every 5 nanoseconds)
    always #5 clk = ~clk;

    initial begin
        // Setup waveform dumping
        $dumpfile("regfile_simulation.vcd");
        $dumpvars(0, register_file_tb);
        
        // Dump the internal register array so we can see the memory change in GTKWave
        $dumpvars(1, register_file_tb.uut.registers[0]);
        $dumpvars(1, register_file_tb.uut.registers[1]);
        $dumpvars(1, register_file_tb.uut.registers[2]);

        // Start with a clean state
        clk = 0; we = 0;
        read_addr_1 = 0; read_addr_2 = 0;
        write_addr = 0; write_data = 0;
        #10;

        // Test 1: Write the hex value AAAA to R1
        write_addr = 4'd1; write_data = 16'hAAAA; we = 1; #10;
        
        // Test 2: Write the hex value BBBB to R2
        write_addr = 4'd2; write_data = 16'hBBBB; we = 1; #10;
        we = 0; // Turn off write mode

        // Test 3: Read R1 and R2 simultaneously
        read_addr_1 = 4'd1; read_addr_2 = 4'd2; #10;

        // Test 4: Try to overwrite R0 with FFFF (Should be blocked by hardware)
        write_addr = 4'd0; write_data = 16'hFFFF; we = 1; #10;
        we = 0; 

        // Read R0 to prove it is still 0000
        read_addr_1 = 4'd0; #10;

        $display("Register File Simulation complete.");
        $finish;
    end
endmodule
