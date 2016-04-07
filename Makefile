
GNUARM = /usr/local/gcc-arm-none-eabi-4_7-2013q3/bin/arm-none-eabi

CC = $(GNUARM)-gcc
VERB=n

# add verbose compiler output if desired
ifeq ($(VERB),y)
CFLAGS = -O0 -g -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -nostartfiles -Wl,-verbose,-T,pi.ld
else
CFLAGS = -O0 -g -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -nostartfiles -Wl,-T,pi.ld
endif

.PHONY: all clean install

all: kernel.img

kernel.img: kernel.elf
	$(GNUARM)-objcopy $< -O binary $@

kernel.elf: main.c
#	$(GNUARM)-ld $< -o $@
	$(GNUARM)-gcc $(CFLAGS) main.c -o kernel.elf

# copy the kernel to sd card
install: kernel.img
	cp kernel.img /media/noxet/BOOT/
	umount /dev/sdb1
	umount /dev/sdb2

clean:
	rm -f *.elf *.o kernel.img
