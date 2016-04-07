
#include "gpio.h"

volatile uint *gpio = (uint *) 0x20200000;
volatile uint tim;

int main(void) __attribute__((naked));
int main(void)
{
	gpio[1] |= (1 << 18);
	while (1) {
		gpio[10] = (1 << 16);
		for (tim = 0; tim < 500000; tim++);
		gpio[7] = (1 << 16);
		for (tim = 0; tim < 500000; tim++);
	}
}

void exit(int code)
{
	while (1);
}
