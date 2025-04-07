# CST307PipelineAnalyzer

ARMv7 JTAG-UART and HEX Display Program
Description
This ARMv7 assembly program demonstrates concurrent output to the JTAG-UART and HEX display using the CPULATOR emulator. The program:

Displays the string "HELLO ALL. I AM HERE," in the JTAG-UART output.

Cycles the HEX display through values 0 to B (hex digits 0–11).

Stops execution after completing 20 iterations of the HEX display.

Features
Direct JTAG-UART output without hardware status checks (optimized for CPULATOR).

HEX display cycling using a pre-defined 7-segment lookup table.

Automatic termination after 20 iterations.

Requirements
CPULATOR Emulator: Supports ARMv7 assembly simulation.

Basic understanding of ARM assembly (for modification/debugging).

Usage Instructions
Assemble and Run:

Copy the provided code into a .s file (e.g., main.s).

Load the file into CPULATOR and run it.

Observe Outputs:

JTAG-UART: The text "HELLO ALL. I AM HERE," will appear immediately.

HEX Display: The rightmost HEX (HEX0) will cycle through 0 to B and stop after 20 counts.

Code Overview
Key Sections
Data Section:

string: Contains the message for JTAG-UART.

hex_table: Stores 7-segment codes for HEX digits 0–B.

Text Section:

JTAG-UART Output: Writes characters directly to 0xFF201000 (no status checks, as CPULATOR simplifies UART behavior).

HEX Display Logic: Uses a counter to cycle through the lookup table and stops after 20 iterations.

Important Addresses
0xFF201000: JTAG-UART data register.

0xFF200020: HEX0 display address.

Troubleshooting
HEX Display Not Updating: Ensure the HEX display address (0xFF200020) matches your emulator’s memory-mapped I/O.

UART Hangs: If using real hardware, re-enable the UART status check (bit 16 of the status register).
