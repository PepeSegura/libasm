NAME = libasm.a

SRCS = 					\
	srcs/ft_strlen.s 	\
	srcs/ft_strcmp.s 	\
	srcs/ft_write.s 	\
	srcs/ft_read.s 		\
	

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

compile = rm -f a.out; gcc -g3 -fsanitize=address,leak main.c $(NAME)

strlen:: re
strlen::
	@echo
	$(compile) && ./a.out strlen

strcmp:: re
strcmp::
	@echo
	$(compile) && ./a.out strcmp

read:: re
read::
	@echo
	$(compile) && ./a.out read

strcpy:: re
strcpy::
	@echo
	$(compile) && ./a.out strcpy

strdup:: re
strdup::
	@echo
	$(compile) && ./a.out strdup
	
write:: re
write::
	@echo
	$(compile) && ./a.out write
	

re:: fclean
re:: all

.PHONY: all clean fclean re

# srcs/ft_strcpy.s 	\
# srcs/ft_read.s 	\
# srcs/ft_strdup.s	\