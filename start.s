/* The segment to run before main */
.section ".text.startup"

.globl _start
.globl _get_stack_pointer

_start:
	/* initialize stack pointer right below the .text segment, grows toward lower addresses.
	 * it is at 64MB and should be enough...
	 */
	ldr sp, =0x8000

	/* call the c startup function, never return :( */
	b _cstart

	_end: b _end

_get_stack_pointer:
	/* return stack pointer value */
	str sp, [sp]
	ldr r0, [sp]
	mov pc, lr
