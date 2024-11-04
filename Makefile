NAME = libasm.a
NASM = nasm
NASM_FLAGS = -f elf64
CC = gcc
C_FLAGS = -Wall -Wextra -Werror

MANDATORY = src/mandatory/*.s
MANDATORY_OBJS = $(MANDATORY:.s=.o)
BONUS = src/bonus/*.s
BONUS_OBJS = $(BONUS:.s=.o)

all: $(NAME)

$(NAME): $(MANDATORY_OBJS)
	@ar rcs $(NAME) $(MANDATORY_OBJS)

%.o: %.s
	@$(NASM) $(NASMFLAGS) $< -o $@

bonus: $(MANDATORY_OBJS) $(BONUS_OBJS)
	@ar rcs $(NAME) $(MANDATORY_OBJS) $(BONUS_OBJS)

clean:
	@rm -f $(MANDATORY_OBJS) $(BONUS_OBJS)

fclean: clean
	@rm -f $(NAME)

re: fclean all

test: all
	@$(CC) $(CFLAGS) main.c -L. -lasm -o test_program

test_bonus: all
	@$(CC) $(CFLAGS) main_bonus.c -L. -lasm -o test_program

.PHONY: all bonus clean fclean re test