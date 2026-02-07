# 8-bit ALU (Arithmetic and Logical Unit) using systemverilog

A simple **8-bit Arithmetic Logic Unit (ALU)** written in **SystemVerilog**.  
This module performs basic arithmetic and logical operations based on a 3-bit opcode and provides common status flags such as **Carry**, **Zero**, and **Overflow**.

---

## Features
- 8-bit inputs `A` and `B`
- 3-bit `Opcode` to select operations
- Supports arithmetic, logical, and shift operations
- Outputs standard ALU flags:
  - **Carry**
  - **Zero**
  - **Overflow**

---

## Supported Operations

| Opcode | Operation | Description                  |
|--------|-----------|------------------------------|
| 000    | ADD       | `A + B`                      |
| 001    | SUB       | `A - B`                      |
| 010    | AND       | Bitwise AND                  |
| 011    | OR        | Bitwise OR                   |
| 100    | XOR       | Bitwise XOR                  |
| 101    | NOT       | Bitwise NOT of `A`           |
| 110    | SHL       | Logical left shift `A << 1`  |
| 111    | SHR       | Logical right shift `A >> 1` |


---

## Status Flags
- **Carry**
  - Set when addition or subtraction produces a carry/borrow.
- **Zero**
  - Set when `Result == 0`.
- **Overflow**
  - Indicates signed overflow for addition and subtraction.

---

## Waveforms and Output
<p align="left">
  <img src="pics/output.png" alt="OUTPUT" width="400">
</p>

<p align="left">
  <img src="images/waveform.png" alt="WAVEFORM" width="400">
</p>

---

