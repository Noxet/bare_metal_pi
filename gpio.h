#ifndef GPIO_H
#define GPIO_h

#define uint unsigned int

typedef struct {
	uint GPFSEL0;
	uint GPFSEL1;
	uint GPFSEL2;
	uint GPFSEL3;
	uint GPFSEL4;
	uint GPFSEL5;
	uint reserved1;
	uint GPSET0;
	uint GPSET1;
	uint reserved2;
	uint GPCLR0;
	uint GPCLR1;
	uint reserved3;
} gpio_t;

#endif
