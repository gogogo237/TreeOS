PrintString:
    mov ah, 0x0e    ; cursor advances after write
    .Loop:
    cmp [bx], byte 0
    je .Exit
        mov al, [bx]     ; ASCII character to write
        int 0x10        ; Display a charater on the screen
        inc bx
        jmp .Loop
    .Exit:
    ret

TestString:
    db 'Hello World! This is a test string.',0