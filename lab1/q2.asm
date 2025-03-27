        .ORIG   x3000
        LD      R0, INPUT
        LDR     R0, R0, #0 ; R0 = INPUT

        LD      R1, BITS
        LDR     R1, R1, #0 ; R1 = nbits
        LD      R3, SIXTEEN
        NOT     R1, R1
        ADD     R1, R1, #1
        ADD     R1, R1, R3 ; R1 = 16 - nbits

        AND     R2, R2, #0 ; clear R2 to save the result

LOOP    ADD     R1, R1, #-1
        BRN     END_LOOP
        ADD     R0, R0, #0 ; set cc
        BRN     SET_1
        ADD     R2, R2, R2 ; if 0, shift directly
        ADD     R0, R0, R0
        BRNZP   LOOP

SET_1   ADD     R2, R2, R2 ; if 1, shift then add 1
        ADD     R2, R2, #1
        ADD     R0, R0, R0
        BRNZP   LOOP

END_LOOP:
        STI     R2, OUTPUT
        HALT

INPUT   .FILL   x3100
BITS    .FILL   x3101
OUTPUT  .FILL   x3102
SIXTEEN .FILL   #16     
        .END

