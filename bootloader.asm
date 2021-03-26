[org 0x7c00]

mov bp, 0x7c00      ; move to base pointer
mov sp, bp          ; move to stack pointer

mov bx, TestString
call PrintString

jmp $

%include "print.asm"

times 510-($-$$) db 0

dw 0xaa55           ; This is a magic word for a bootloader