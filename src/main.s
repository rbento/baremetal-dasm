; main.s - minimal 6502 / Atari program

    processor 6502
    include "main.inc"

    seg code
    org $F000

Start:
    sei             ; Disable interrupts
    cld             ; Clear decimal mode
    ldx #$FF
    txs             ; Set stack pointer

    lda #COLOR_BLUE ; Load blue into the accumulator
    sta COLUBK      ; Store it in the TIA background color register

.Loop:
    jmp .Loop       ; Infinite loop

    ; 6502 Interrupt Vectors
    org $FFFA
    .word Start     ; NMI
    .word Start     ; RESET
    .word Start     ; IRQ
