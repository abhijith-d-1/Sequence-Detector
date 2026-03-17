# Sequence-Detector
This repository contains a Mealy FSM designed to detect the 1011 bit sequence with 1-bit overlapping. The implementation focuses on efficient state-reduction and real-time output generation. Includes RTL Verilog code and state transition logic ideal for digital logic design and FPGA prototyping.



Technical Specifications
FSM Type: Mealy (Output depends on current state and current input).
Detection Target: 1011.
Overlap: Enabled (e.g., 1011011 results in two detections).
    
State Definitions
S0 (IDLE): Initial state; no bits of the sequence have been matched.
S1 (GOT 1): The first '1' has been detected.
S2 (GOT 10): The sequence '10' has been detected.
S3 (GOT 101): The sequence '101' has been detected. If the next bit is '1', the output triggers.

State    Input=0    Next State    Output    Input=1    Next State    Output
S0         0           S0           0          1            S1         0
S1         0           S2           0          1            S1         0
S2         0           S0           0          1            S3         0
S3         0           S2           0          1            S1         1
