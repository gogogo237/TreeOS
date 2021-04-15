; this file will be compile to a 2048 bytes bin file.

jmp EnterProtectedMode

%include "gdt.asm"
%include "print.asm"
%include "DetectMemory.asm"

EnterProtectedMode:

	call DetectMemory
	call EnableA20				; 0x803e
	cli
	lgdt [gdt_descriptor]
	mov eax, cr0				; Enable Protected Mode
	or eax, 1
	mov cr0, eax
	jmp codeseg:StartProtectedMode	;a long jmp, to close the CPU pipline.

EnableA20:
	in al, 0x92
	or al, 2
	out 0x92, al
	ret

[bits 32]

%include "CPUID.asm"
%include "SimplePaging.asm"

StartProtectedMode:
	
	mov ax, dataseg
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov [0xb8000], byte 'H'
	mov [0xb8002], byte 'E'
	mov [0xb8004], byte 'L'
	mov [0xb8006], byte 'L'
	mov [0xb8008], byte 'O'
	mov [0xb800a], byte 'W'
	mov [0xb800c], byte 'O'
	mov [0xb800e], byte 'R'
	mov [0xb8010], byte 'L'
	mov [0xb8012], byte 'D'
	mov [0xb8014], byte '!'

	call DetectCPUID
	call DetectLongMode
	call SetUpIdentityPaging
	call EditGDT
	jmp codeseg:Start64Bit

[bits 64]
[extern _start]

%include "IDT.asm"

Start64Bit:
	mov edi, 0xb8000
	mov rax, 0x1f201f201f201f20
	mov ecx, 500
	rep stosq

	call ActivateSSE
	call _start
	jmp $

ActivateSSE:
	mov rax,cr0
	and ax, 0b11111101
	or ax, 0b00000001
	mov cr0, rax

	mov rax, cr4
	or ax, 0b1100000000
	mov cr4, rax
	ret

times 2048-($-$$) db 0