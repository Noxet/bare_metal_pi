
int main(void)
{
	unsigned int *gpio = (unsigned int *) 0x20200000;
	gpio[1] |= (1 << 18);
	gpio[10] = (1 << 16);
	while (1);
}

void exit(int code)
{
	while (1);
}
