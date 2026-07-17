# 16-Bit Pipelined Processor in Verilog 🚀

A custom 16-bit pipelined processor designed from scratch in Verilog. This project focuses on building a complete CPU architecture modularly, with each component isolated for clear understanding, simulation, and testing.

## 📌 Objective
To deeply understand Computer Organization and Architecture (COA) and hardware design by practically implementing a processor at the Register Transfer Level (RTL). 

## 🏗️ Hardware Architecture Modules

### 📁 [01_Program_Counter](./01_Program_Counter)
* **Description:** The core instruction pointer that tracks the execution sequence.
* **Features:** Synchronous operation (`posedge clk`), master reset, and dynamic branching (jump control).
* **Contents:** RTL code (`pc.v`), automated testbench (`pc_tb.v`), and simulation waveform proving correct execution.

### 📁 [02_ALU](./02_ALU)
* **Description:** A highly optimized Execution Engine capable of 16-bit parallel processing.
* **Features:** 4-bit opcode control, hardware-sliced 8-bit multiplication/division, hardware-level divide-by-zero fail-safe, and zero-flag generation.
* **Contents:** RTL code (`alu.v`), automated testbench (`alu_tb.v`), and simulation waveform validating multiple arithmetic and logical operations.

## 🛠️ Tools & Technologies
* **Language:** Verilog HDL
* **Simulation/Testing:** Xilinx Vivado, Icarus Verilog, GTKWave