section	.text
global	ft_strcpy

; char *strcpy(char *dest, const char *src)

ft_strcpy:
	mov	rax, 0
	mov rcx, 0

_loop:
	mov	al, byte[rsi + rcx]	; Move value on rsi[rcx] to first byte of rax (al)
	mov	[rdi + rcx], al		; Move value on al to rdi[rcx]
	inc	rcx
	cmp	al, 0
	jne	_loop

_return:
	mov	rax, rdi	; Move string on rdi to the return register
	ret