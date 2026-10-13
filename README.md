# 16-Bit Custom RISC-V based Pipelined Processor in Verilog 🚀

A custom 16-bit pipelined processor designed from scratch in Verilog. This project focuses on building a complete CPU architecture modularly, with each component isolated for clear understanding, simulation, and testing.

## 📌 Objective
To deeply understand Computer Organization and Architecture (COA) and hardware design by practically implementing a processor at the Register Transfer Level (RTL).

## 🏗️ Hardware Architecture Modules

### 📁 [01_Program_Counter](./01_Program_Counter)
* **Description:** The core instruction pointer that tracks the execution sequence.
* **Features:** Synchronous operation (`posedge clk`), master reset, and dynamic branching (jump control).
* **Contents:** RTL code (`pc.v`), automated testbench (`pc_tb.v`), and simulation waveform proving correct execution.

📁 [02_ALU](./02_ALU)
* **Description:** An upgraded, highly optimized Execution Engine (V2.0) re-engineered specifically for Edge AI workloads.
* **Features:** 4-bit opcode control, integrated **Custom Multiply-Accumulate (MAC) datapath** for parallel matrix operations, dynamic multiplexing for zero-stall routing, instantaneous zero-flag generation, and hardware-level fail-safes.
* **Contents:** Upgraded RTL code (`alu.v`), automated testbench (`alu_tb.v`), detailed RTL Schematic showcasing the MAC integration, and behavioral simulation waveform validating heavy arithmetic operations.

### 📁 [03_Register_File](./03_Register_File)
* **Description:** The local high-speed storage core of the CPU, bridging main memory and the Execution Engine.
* **Features:** 16x16-bit register array, dual independent read ports, single synchronous write port, internal forwarding (asynchronous write-before-read) for hazard resolution, and a hardware-level R0 immutability trap.
* **Contents:** RTL code (`register_file.v`), automated testbench (`register_file_tb.v`), and simulation waveform demonstrating simultaneous read and R0 protection.

## 🛠️ Tools & Technologies
* **Language:** Verilog HDL
* **Simulation/Testing:** Xilinx Vivado, Icarus Verilog, GTKWave
