#Общий файл компиляции C/C++/Assembly
OBJS_NO_DIR_C = $(SOURCES:.c=.o)
OBJS_NO_DIR_CS = $(OBJS_NO_DIR_C:.s=.o)
OBJS_NO_DIR_CSS = $(OBJS_NO_DIR_CS:.S=.o)
OBJS_NO_DIR = $(OBJS_NO_DIR_CSS:.cpp=.o)
OBJS = $(addprefix .obj/,$(OBJS_NO_DIR))
DEPS = $(addprefix .d/,$(OBJS_NO_DIR:.o=.d))
BFLAGS += -Wall -g3 -Wextra -Werror
#directory, where this (compile.mk) file is located (for dependancy)
ROOT_DIR := $(notdir $(CURDIR))
PROJ_DIR := $(dir $(firstword $(MAKEFILE_LIST)))

DEPFLAGS = -MT $@ -MMD -MP -MF .d/$*.Td
DIRFLAGS = $(addprefix -I, $(DIRS))
DEFFLAGS = $(addprefix -D,$(DEFS)) $(addprefix -D,$(DEFS_EXT))

#Переименовываем (.Td) в финальные *.d файлы
POSTCOMPILE = @mv -f .d/$*.Td .d/$*.d && touch $@

#Создаем вспомогательные скрытые папки.
SERVICE_DIRS := .d .obj .obj/$(PROJ_DIR)
COMMON_OBJ_DEPS += $(PROJ_DIR)/makefile 

.obj/%.o: %.c $(COMMON_OBJ_DEPS)
	@echo [CC] $<
	@mkdir -p $(dir .d/$<)
	@mkdir -p $(dir .obj/$<)
	@$(CC) $(CFLAGS) $(DEPFLAGS) $(DIRFLAGS) $(DEFFLAGS) -c $< -o $@
	@$(POSTCOMPILE)

.obj/%.o: %.cpp  $(COMMON_OBJ_DEPS) 
	@echo [CPP] $<
	@mkdir -p $(dir .d/$<)
	@mkdir -p $(dir .obj/$<)
	@$(CPP) $(CPPFLAGS) $(DEPFLAGS) $(DIRFLAGS) $(DEFFLAGS) -c $< -o $@
	@$(POSTCOMPILE)
	
.obj/%.o: %.s $(COMMON_OBJ_DEPS)
	@echo [AS] $<
	@mkdir -p $(dir .obj/$<)
	@$(AS) $(DIRFLAGS) $(DEFFLAGS) -c $< -o $@
	
.obj/%.o: %.S $(COMMON_OBJ_DEPS)
	@echo [AS] $<
	@mkdir -p $(dir .obj/$<)
	@$(AS) $(DIRFLAGS) $(DEFFLAGS) -c $< -o $@
	
clean: compile_clean

compile_clean:
	rm -rf .d
	rm -rf .obj

.d/%.d: ;
.PRECIOUS: .d/%.d

-include $(DEPS)
