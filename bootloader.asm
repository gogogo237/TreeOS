
mov ah, 0x0e    ; cursor advances after write
mov al, 'H'     ; ASCII character to write
int 0x10

jmp $


times 510-($-$$) db 0

dw 0xaa55