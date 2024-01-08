# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/07 23:03:39 by psegura-          #+#    #+#              #
#    Updated: 2024/01/08 00:37:16 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRCS = 					\
	srcs/ft_strlen.s 	\
	srcs/ft_strcpy.s 	\
	srcs/ft_strcmp.s 	\
	srcs/ft_write.s 	\
	srcs/ft_read.s 		\
	srcs/ft_strdup.s	\

OBJS = $(SRCS:.s=.o)

NASM = nasm
NASMFLAGS = -f elf64

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re:: fclean
re:: all

.PHONY: all clean fclean re
