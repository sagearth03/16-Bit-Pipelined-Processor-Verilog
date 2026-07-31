module register_file (
    input  wire        clk,          
    input  wire        we,           
    input  wire [3:0]  read_addr_1,  
    input  wire [3:0]  read_addr_2,  
    input  wire [3:0]  write_addr,   
    input  wire [15:0] write_data,   
    output wire [15:0] read_data_1,  
    output wire [15:0] read_data_2   
);

    reg [15:0] registers [0:15];

    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            registers[i] = 16'h0000;
        end
    end

    // SYNCHRONOUS WRITE (Saves at the end of the clock tick)
    always @(posedge clk) begin
        if (we == 1'b1 && write_addr != 4'b0000) begin
            registers[write_addr] <= write_data;
        end
    end

    // ASYNCHRONOUS READ WITH INTERNAL FORWARDING (Write-Before-Read)
    // If the processor tries to read and write to the same register simultaneously, 
    // bypass the old memory and instantly output the new incoming data!
    assign read_data_1 = (we == 1'b1 && write_addr != 4'b0000 && write_addr == read_addr_1) ? write_data : registers[read_addr_1];
    assign read_data_2 = (we == 1'b1 && write_addr != 4'b0000 && write_addr == read_addr_2) ? write_data : registers[read_addr_2];

endmodule