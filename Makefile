NAME = libasm.a
NASM = nasm
NASM_FLAGS = -f elf64
CC = gcc
C_FLAGS = -Wall -Wextra -Werror

OBJ_DIR = obj
MANDATORY = $(filter-out %_bonus.s, $(wildcard src/*.s))
MANDATORY_OBJS = $(patsubst src/%.s, $(OBJ_DIR)/%.o, $(MANDATORY))
BONUS = $(wildcard src/*_bonus.s)
BONUS_OBJS = $(patsubst src/%.s, $(OBJ_DIR)/%.o, $(BONUS))

all: $(NAME)

$(NAME): $(MANDATORY_OBJS)
	@echo "Creating archive $(NAME) with mandatory objects"
	ar rcs $(NAME) $(MANDATORY_OBJS)

$(OBJ_DIR)/%.o: src/%.s
	@mkdir -p $(OBJ_DIR)
	@echo "Assembling $<"
	$(NASM) $(NASM_FLAGS) $< -o $@

bonus: $(MANDATORY_OBJS) $(BONUS_OBJS)
	@echo "Creating archive $(NAME) with mandatory and bonus objects"
	ar rcs $(NAME) $(MANDATORY_OBJS) $(BONUS_OBJS)

clean:
	@echo "Cleaning object files"
	rm -rf $(OBJ_DIR)

fclean: clean
	@echo "Cleaning archive $(NAME)"
	rm -f $(NAME) main

re: fclean all

test: all
	@echo "Compiling test program"
	$(CC) $(C_FLAGS) main.c -L. -lasm -o main -no-pie

test_bonus: all
	@echo "Compiling test program with bonus"
	$(CC) $(C_FLAGS) main_bonus.c -L. -lasm -o main -no-pie

.PHONY: all bonus clean fclean re test test_bonus