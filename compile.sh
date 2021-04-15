#!/bin/bash

nasm src/bootloader.asm -f bin -i src -o bootloader.bin

nasm src/ExtendedProgram.asm -f elf64 -i src -o ExtendedProgram.o

cmake CMakeLists.txt -G "Unix Makefiles" -D CMAKE_CXX_COMPILER=x86_64-elf-gcc -D CMAKE_C_COMPILER=x86_64-elf-gcc

make -f "Makefile"

cat bootloader.bin Kernel.bin > bootloader.flp

rm Kernel.bin
rm libkernel.a
rm Makefile
rm cmake_install.cmake
rm bootloader.bin
rm ExtendedProgram.o

rm -rf CMakeFiles