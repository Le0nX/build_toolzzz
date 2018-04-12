AS := gcc
CC :=  gcc
CPP :=  g++

BFLAGS += -Wall -g3 -Wextra -Werror
CPPFLAGS += $(BFLAGS) -std=c++14 -flto

GLOBAL_COMPILE := build_toolzzz/global_compile.mk

COMMON_OBJ_DEPS := makefile $(GLOBAL_COMPILE) #здесь можно подключить зависимости.

include $(GLOBAL_COMPILE) 

.SECONDEXPANSION:
all: $$(OBJS)
