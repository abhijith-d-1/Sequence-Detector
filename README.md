# Sequence-Detector
This repository contains a Mealy FSM designed to detect the 1011 bit sequence with 1-bit overlapping. The implementation focuses on efficient state-reduction and real-time output generation. Includes RTL Verilog code and state transition logic ideal for digital logic design and FPGA prototyping.

<img src="https://github.com/abhijith-d-1/Sequence-Detector/blob/576b99db4917953fa2a6b4db3dbe23335b05997c/State_diagram.jpg?raw=true" width="400">

## Technical Specifications

* **FSM Type:** Mealy (Output depends on current state and current input)
* **Detection Target:** `1011`
* **Overlap:** Enabled (e.g., `1011011` results in two detections)

## State Definitions

| State | Definition |
| :--- | :--- |
| **S0 (IDLE)** | Initial state; no bits of the sequence matched. |
| **S1 (GOT 1)** | The first '1' has been detected. |
| **S2 (GOT 10)** | The sequence '10' has been detected. |
| **S3 (GOT 101)** | The sequence '101' detected. If the next bit is '1', the output triggers. |

## State Transition Table

| Current State | Input (x=0) | Next State | Output (z) | Input (x=1) | Next State | Output (z) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **S0** (Idle) | 0 | S0 | 0 | 1 | S1 | 0 |
| **S1** (Got 1) | 0 | S2 | 0 | 1 | S1 | 0 |
| **S2** (Got 10) | 0 | S0 | 0 | 1 | S3 | 0 |
| **S3** (Got 101) | 0 | S2 | 0 | 1 | **S1** | **1** |

> **Note:** The transition from **S3** to **S1** on input `1` allows for **1-bit overlapping**, treating the final bit of a completed sequence as the first bit of the next potential match.
