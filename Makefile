# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akambou <akambou@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/14 09:56:46 by akambou           #+#    #+#              #
#    Updated: 2023/11/23 00:32:07 by akambou          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_printf.a

CC = gcc
RM = rm -rf

CFLAGS = -Wall -Wextra -Werror -o$(INCL)

INCL = includes/ft_printf.h
OBJ_DIR = obj/
OBJS = $(SRCS:%.c=$(OBJ_DIR)%.o)
SRCS = $(wildcard src/*.c )

$(OBJ_DIR)%.o: %.c
	@mkdir -p $(@D)
	@printf "\033[0;33m\rCompiling -> $< ✅                        \033[0m"
	@$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo -e "\033[0;32mPrintf created 📚\033[0m"

clean:
	@$(RM) $(OBJ) $(OBJ_DIR)
	@echo -e "\033[0;31mCleaned objects 🧹\033[0m"

fclean: clean
	@$(RM) $(NAME) $(OBJ_DIR) $(OBJ)
	@echo -e "\033[0;31mCleaned printf 🧹\033[0m"

re: fclean all

.PHONY: all clean fclean re
