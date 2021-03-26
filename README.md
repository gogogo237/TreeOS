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

### GCC Cross Compiler
```
sudo apt update
sudo apt install build-essential
sudo apt install bison
sudo apt install flex
sudo apt install libgmp3-dev
sudo apt install libmpc-dev
sudo apt install libmpfr-dev
sudo apt install texinfo
export PREFIX="/usr/local/x86_64elfgcc"
export TARGET=x86_64-elf
export PATH="$PREFIX/bin:$PATH"
mkdir /tmp/src
cd /tmp/src
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.35.1.tar.gz
tar xf binutils-2.35.1.tar.gz
mkdir binutils-build
cd binutils-build
../binutils-2.35.1/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
sudo make all install 2>&1 | tee make.log
cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
tar xf gcc-10.2.0.tar.gz
mkdir gcc-build
cd gcc-build
../gcc-10.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c++ --without-headers
sudo make all-gcc
sudo make all-target-libgcc
sudo make install-gcc
sudo make install-target-libgcc

ls /usr/local/x86_64elfgcc/bin

sudo nano ~/.bashrc
export PATH="$PATH:/usr/local/x86_64elfgcc/bin"
```