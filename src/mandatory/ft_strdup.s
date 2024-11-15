extern	__errno_location
extern	malloc
extern	ft_strlen
extern	ft_strcpy

section	.text
global	ft_strdup

ft_strdup:
	push	rdi

_calculate_len:
	call	ft_strlen	; Get length of source string and save to rax
	mov		rcx, rax	; Save length to rcx, rax will be used to save return values of other function calls
	inc		rcx			; Add 1 to length to account for null terminator

_malloc_dest:
	mov		rdi, rcx	; Move length to rdi to use as argument for malloc
	call	malloc		; Allocate memory for destination string
	cmp		rax, 0		; Check if malloc failed (return is negative)
	js		_error		; Jump to _error if Sign Flag is set

_copy_string:
	mov		rdi, rax	; Save address of allocated space to rdi
	pop		rsi			; Pop source string pointer from stack to rsi
	call	ft_strcpy	; Copy source string to destination string (rsi to rdi)
	ret

_error:
	pop		rdi					; Pop source string pointer from stack to clean up
	call	__errno_location	; Get location of errno and save to rax
	mov		rdx, 12				; ENOMEM code 12
	mov		[rax], rdx			; Set errno to ENOMEM
	mov		rax, 0				; NULL to indicate failure
	ret