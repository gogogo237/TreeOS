nasm bootloader.asm -f bin -o bootloader.bin

nasm ExtendedProgram.asm -f bin -o ExtendedProgram.bin 

at bootloader.bin ExtendedProgram.bin > bootloader.flp
