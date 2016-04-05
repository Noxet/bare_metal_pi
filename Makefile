
GNUARM = /usr/local/gcc-arm-none-eabi-4_7-2013q3/bin/arm-none-eabi

CC = $(GNUARM)-gcc
CFLAGS = -O0 -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -nostartfiles

all: kernel.img

kernel.img: kernel.elf
	$(GNUARM)-objcopy $< -O binary $@

kernel.elf: main.o
	$(GNUARM)-ld $< -o $@

clean:
	rm -f *.elf *.o kernel.img
