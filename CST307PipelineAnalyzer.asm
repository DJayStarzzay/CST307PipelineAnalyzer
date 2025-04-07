.section .data
string: .asciz "HELLO ALL. I AM HERE,"
hex_table:
    .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C

.section .text
.global _start

_start:
    // Send string to JTAG-UART (without waiting for ready bit)
    ldr r1, =0xFF201000     // JTAG-UART data register
    ldr r2, =string         // Load string address

loop_send:
    ldrb r3, [r2], #1       // Load character and increment
    cmp r3, #0              // Check for null terminator
    beq end_send            // Exit loop if done
    strb r3, [r1]           // Directly send character (no status check)
    b loop_send

end_send:
    // Setup HEX display
    mov r5, #0              // Initialize counter
    mov r6, #0              // Initialize HEX value
    ldr r7, =hex_table      // Load HEX code table
    ldr r8, =0xFF200020     // HEX0 address

loop_hex:
    // Display current HEX value
    ldrb r9, [r7, r6]       // Get segment code
    strb r9, [r8]           // Write to HEX0

    // Increment and check counter
    add r5, r5, #1
    cmp r5, #20
    beq exit                // Exit if count=20

    // Update HEX value (0-B)
    add r6, r6, #1
    cmp r6, #12
    subeq r6, r6, #12       // Wrap around after 11 (0xB)
    b loop_hex

exit:
    b exit                  // Infinite loop to stop