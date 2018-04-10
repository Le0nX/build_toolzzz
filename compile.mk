AS := gcc
CC :=  gcc
CPP :=  g++

BFLAGS += -Wall -g3 -Wextra -Werror
CPPFLAGS += $(BFLAGS) -std=c++14 -pthread

COMPILE_COMMON := build_toolzzz/global_compile.mk

COMPILE_MK := sw_infrastructure/build_tools/compile_mcu.mk
COMMON_OBJ_DEPS := makefile $(COMPILE_GLOBAL) #здесь можно подключить зависимости.

include $(COMPILE_GLOBAL) 

.SECONDEXPANSION:
all: $$(OBJS)
