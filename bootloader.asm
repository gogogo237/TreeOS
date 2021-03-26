[org 0x7c00]

mov bp, 0x7c00      ; move to base pointer
mov sp, bp          ; move to stack pointer

mov bx, TestString
call PrintString

jmp $

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

times 510-($-$$) db 0

dw 0xaa55           ; This is a magic word for a bootloader