# TreeOS
This is an operating system written from Scratch. It's for educational purpose and will be fully documented.

## Windows

### Install the nasm and add to the system PATH
### Install Bochs
### Make a batch execution file
```
nasm bootloader.asm -f bin -o bootloader.flp

pause
```
<!--- We want to make a bootable floppy so our object file is bootloader.flp instead of bootloader.bin. --->

### Run!
1. run Bochs
2. go to **Disk & Boot**
    - Type of floppy **disk 5.25" 1.2M**
    - Select first floppy disk image
    - Type of floppy media **1.2M**
    - Status **inserted**
3. Save bochsrc.bxrc