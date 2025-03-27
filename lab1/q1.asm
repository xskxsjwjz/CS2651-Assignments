                .ORIG   x3000
                LD      R1, INPUT
                LD      R2, OUTPUT
                LD      R3, ONE
                LD      R4, ZERO
                LD      R5, ZERO

                ADD     R1, R1, #0
                BRNZ    F0
                ADD     R1, R1, #-1
                BRZ     F1

LOOP            ADD     R1, R1, #-1
                BRN     END_LOOP
                ADD     R5, R3, R4
                ADD     R4, R3, #0
                ADD     R3, R5, #0
                BRNZP   LOOP

F0              AND     R5, R5, #0
                ST      R5, OUTPUT
                HALT
F1              AND     R5, R5, #0
                ADD     R5, R5, #1
                ST      R5, OUTPUT
                HALT
END_LOOP        ST      R5, OUTPUT
                HALT

INPUT           .FILL   #1
OUTPUT          .FILL   #0
ONE             .FILL   #1
ZERO            .FILL   #0
                .END