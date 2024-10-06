NAME = libasm.a

SRCS = 					\
	srcs/ft_strlen.s 	\
	srcs/ft_strcmp.s 	\
	srcs/ft_write.s 	\
	srcs/ft_read.s 		\
	srcs/ft_strcpy.s 	\
	srcs/ft_strdup.s	\
	srcs_aux/ft_isspace.s \
	srcs_bonus/atoi_base/ft_atoi_base.s \
	

OBJS = $(SRCS:.s=.o)

NASM = nasm
NASMFLAGS = -f elf64

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME) test

define compile_test
	@rm -f test
	@gcc -no-pie -fPIE -g3 -fsanitize=address,leak main.c $(NAME) -o test -D $1 && ./test
endef

test:: re
	$(call compile_test, TEST)

strlen:: re
	$(call compile_test, STRLEN)

strcmp:: re
	$(call compile_test, STRCMP)

read:: re
	$(call compile_test, READ)

strcpy:: re
	$(call compile_test, STRCPY)

strdup:: re
	$(call compile_test, STRDUP)

write:: re
	$(call compile_test, WRITE)

isspace:: re
	$(call compile_test, ISSPACE)

atoi:: re
	$(call compile_test, ATOI)

re:: fclean
re:: all

.PHONY: all clean fclean re
