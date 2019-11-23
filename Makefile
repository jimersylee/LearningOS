subdir=./kernel
all:img
boot:
	nasm -o bootloader hello.asm
img:boot
	dd if=bootloader of=LibraOS.img count=1 bs=512
	dd if=/dev/zero of=LibraOS.img bs=512 seek=1 skip=1 count=2879
run:
	qemu-system-i386 -drive file=LibraOS.img,if=floppy
clean:
	rm bootloader LibraOS.img
