extern	__errno_location

section	.text
global	ft_read

ft_read:
	mov 	rax, 0
	syscall
	test 	rax, rax
	js		_error
	ret

_error:
	neg		rax
	mov		rdx, rax
	call	__errno_location
	mov		[rax], rdx
	mov		rax, -1
	ret