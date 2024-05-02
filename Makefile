NAME = libasm.a

SRCS = 					\
	srcs/ft_strlen.s 	\

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
	@rm -f $(NAME)

test:: re
test::
	@echo
	rm -f a.out; gcc main.c $(NAME) && ./a.out
	

re:: fclean
re:: all

.PHONY: all clean fclean re

# srcs/ft_strcpy.s 	\
# srcs/ft_strcmp.s 	\
# srcs/ft_write.s 	\
# srcs/ft_read.s 	\
# srcs/ft_strdup.s	\