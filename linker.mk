#Кастомный файл для линковщика.

#Для компиляции определяем TARGET:
#TARGET - имя бинарника для билда
#OBJ_FILES - объектные файлы необходимые для сборки.

LD := g++
OBJDUMP := objdump
READELF := readelf
SIZE := size

OBJS := $(shell find .obj -name "*.o" )

CFLAGS = -Wall -g3 -Wextra -Werror 
LDFLAGS := --gc-sections -lboost_system -lboost_thread -lpthread -lboost_regex

include build_toolzzz/global_linker.mk
