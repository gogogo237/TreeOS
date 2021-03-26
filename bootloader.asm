; this file will be compile to a 512 bytes bin file.

[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00      ; move to base pointer
mov sp, bp          ; move to stack pointer

call ReadDisk

jmp PROGRAM_SPACE

%include "print.asm"
%include "DiskRead.asm"

times 510-($-$$) db 0

dw 0xaa55           ; This is a magic word for a bootloader