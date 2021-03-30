.PHONY: all clean fclean re bonus

NAME = libasm.a

NASM = nasm
NASM_FLAGS = -f macho64

SRCS =	ft_strlen.s	\
		ft_strcmp.s \
		ft_strcpy.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

OBJ = $(SRCS:.s=.o)
BONUS_OBJ = $(BONUS_SRCS:.s=.o)

all: $(NAME)

%.o: %.s
	$(NASM) $(NASM_FLAGS) $<

$(NAME): $(OBJ) 
	ar rcs $(NAME) $?

clean:
	rm -f $(OBJ) 

fclean: clean
	rm -f $(NAME)

bonus: $(OBJ) $(BONUS_OBJECTS)
	ar rcs $(NAME) $?

re: fclean all

