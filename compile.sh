#!/bin/bash

nasm bootloader.asm -f bin -o bootloader.bin

nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o
x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c Kernel.cpp -o Kernel.o
x86_64-elf-ld -o Kernel.tmp -Ttext 0x7e00 ExtendedProgram.o Kernel.o
x86_64-elf-objcopy -O binary Kernel.tmp Kernel.bin

cat bootloader.bin Kernel.bin > bootloader.flp
