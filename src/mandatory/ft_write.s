extern  __errno_location

section .text
global  ft_write

; ssize_t write(int fd, const void *buf, size_t count);

ft_write:
	mov 	rax, 1		; Put the syscall number for write into rax
	syscall				; Make the syscall
	test 	rax, rax	; Check if there was an error (return value is negative)
	js 		_error		; Jump to _error if the Sign Flag is set
	ret

_error:
	neg 	rax					; Negate rax to get the error number
	mov 	rdx, rax			; Move the error number to rdx
	call	 __errno_location	; Call __errno_location to get the address of errno
	mov 	[rax], rdx			; Move the error number to the address of errno
	mov 	rax, -1				; Set return value to -1
	ret