#Кастомный файл для линковщика.

#Для компиляции определяем TARGET:
#TARGET - имя бинарника для билда
#OBJ_FILES - объектные файлы необходимые для сборки.

LD := g++
OBJDUMP := objdump
READELF := readelf
SIZE := size

OBJS := $(shell find .obj -name "*.o" )

CFLAGS = -Wall -g3 -Wextra -Werror -pthread
LDFLAGS := --gc-sections 

include build_toolzzz/global_linker.mk
