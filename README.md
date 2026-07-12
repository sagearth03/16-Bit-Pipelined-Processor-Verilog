# 16-Bit Pipelined Processor in Verilog 🚀

A custom 16-bit pipelined processor designed from scratch in Verilog. This project focuses on building a complete CPU architecture step-by-step, including instruction fetch, decode, execution, memory access, and writeback stages, along with hazard resolution using data forwarding.

## 📌 Objective
To deeply understand Computer Organization and Architecture (COA) and hardware design by practically implementing a processor at the Register Transfer Level (RTL).

---

## 🗓️ Development Timeline & Project Log

This section tracks the day-by-day modular development of the processor architecture.

### Day 1: The Instruction Fetch Foundation
**Files Added:** `pc.v`
* **Program Counter (PC):** Implemented the core program counter that acts as the execution bookmark for the processor.
* **Key Features:** * Synchronous operation triggering on the positive edge of the clock (`posedge clk`).
  * Master synchronous reset (`reset`) to initialize the PC back to `16'h0000`.
  * Support for dynamic control flow via a `jump` flag, allowing the PC to branch to a specific `jump_addr` (crucial for loops and if-else conditions).

---

## 🛠️ Tools & Technologies
* **Language:** Verilog HDL
* **Simulation/Testing:**  Xilinx Vivado, Icarus Verilog , GTKwave