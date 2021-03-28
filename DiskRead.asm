
PROGRAM_SPACE equ 0x8000

ReadDisk:
    mov ah, 0x02                ; function request number, Read disk sectors.
    mov bx, PROGRAM_SPACE       ; ES:BX = address of user buffer. Read disk to this memory address.
    mov al, 32                  ; number of sectors  (1-128 dec.)
    mov dl, [BOOT_DISK]         ; drive number, (0=A:, 1=2nd floppy, 80h=drive 0, 81h=drive 1)
    mov ch, 0x00                ; cylinder number  (0-1023 dec.)
    mov dh, 0x00                ; head number  (0-15 dec.)
    mov cl, 0x02                ; sector number	(1-17 dec.)
    int 0x13

    jc DiskReadFailed

    ret

BOOT_DISK:
    db 0

DiskReadErrorString:
    db 'Disk Read Failed',0

DiskReadFailed:
    mov bx, DiskReadErrorString
    call PrintString
    jmp $