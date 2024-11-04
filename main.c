// https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf

/*
    x86-64 Calling Convention - Parameter order:
    1. rdi
    2. rsi
    3. rdx
    4. rcx
    5. r8
    6. r9

    Flags:
    - Zero Flag ~ Set to 1 if result of a cmp was 0
    - Sign Flag ~ Set to 1 if result of add or sub was negative(-)
    - Carry Flag ~ Set if there was a carry out in subtraction
    - Overflow Flag ~ Set if there was an overflow in signed arithmetic
*/