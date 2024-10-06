/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: psegura- <psegura-@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/07 23:17:49 by psegura-          #+#    #+#             */
/*   Updated: 2024/10/06 22:38:34 by psegura-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <fcntl.h>
# include <unistd.h>
# include <string.h>
# include <stdlib.h>
# include <errno.h>
# include <signal.h>
# include <setjmp.h>

/* Mandatory part */
size_t  ft_strlen(const char *s);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char    *ft_strcpy(char *dst, const char *src);
char    *ft_strdup(const char *s);

/* Bonus */
int     ft_atoi_base(char *str, char *base);

/* Auxiliary functions */
int     ft_isspace(int c);

#endif
