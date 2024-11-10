section .text		; Declare this is a text (code) section
global  ft_strlen	; Declare file entry point so other files can link to it

; size_t strlen(const char *s)

ft_strlen:
	mov rax, -1				; Set value on rax to -1

_loop:
	inc rax					; Increment value on rax
	cmp byte[rdi + rax], 0	; Compare the byte at (rdi + rax) against 0. If it is NULL, set the Zero Flag to 1. rdi holds the address of the first parameter in a function call, assume it is the string passed to ft_strlen. byte[rdi + rax] is basically str[i].
	jne _loop				; Loop until Zero Flag is 1

_return:
	ret						; Return value on rax