section .text
global  ft_strcmp

; int strcmp(const char *s1, const char *s2)

ft_strcmp:
    mov rax, 0
    mov rdx, 0
    mov rcx, -1

_loop:
    inc rcx
    mov al, byte[rdi + rcx]
    mov dl, byte[rsi + rcx]
    cmp al, 0
    je  _return
    cmp dl, 0
    je  _return
    cmp al, dl
    je  _return

_return:
    sub rax, rdx
    ret