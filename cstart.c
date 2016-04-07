
/* the addresses space of the .bss segment 
 * defined in the linker script
 */
extern int __bss_start__;
extern int __bss_end__;

extern void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags);

/* the bootloader expects a different entry point, like this */
void _cstart(unsigned int r0, unsigned int r1, unsigned int r2)
{
	int *bss_start = &__bss_start__;
	int *bss_end = &__bss_end__;

	/* clears the memory segment, like it should */
	while (bss_start < bss_end) {
		*bss_start++ = 0;
	}

	/* call the "main" method, never return */
	kernel_main(r0, r1, r2);

	/* in case main should return... */
	while (1);
}
