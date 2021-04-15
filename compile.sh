#!/bin/bash

nasm bootloader.asm -f bin -o bootloader.bin

nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o

nasm Binaries.asm -f elf64 -o Binaries.o

x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c Kernel.cpp -o Kernel.o
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c IDT.cpp -o IDT.o
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c IO.cpp -o IO.o
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c Keyboard.cpp -o Keyboard.o
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c MemoryMap.cpp -o MemoryMap.o
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c TextPrint.cpp -o TextPrint.o

x86_64-elf-ld -T"link.ld"

cat bootloader.bin Kernel.bin > bootloader.flp
