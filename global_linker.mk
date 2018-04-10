#Общий файл линковщика. Выводит сипльзование памяти и сегментов.

LDFLAGS += -o bin/$(TARGET).elf -Map bin/$(TARGET).map
LDOPTS:= $(addprefix -Xlinker ,$(LDFLAGS)) -lm

#include build_toolzzz/version.mk

all: bin/$(TARGET).elf

bin/$(TARGET).elf: $(OBJS)
	@mkdir -p bin
	@echo Le000000000000000nX
	@echo [LD] bin/$(TARGET).elf
	@echo
	@echo 'Memory region summary:'
	@$(LD) $(CFLAGS) $(OBJS) $(LDOPTS)
	@$(OBJDUMP) --source -D bin/$(TARGET).elf > bin/$(TARGET).asm
	@echo
	@echo 'Size summary:'
	@$(SIZE)  --format=berkeley bin/$(TARGET).elf

clean: clean_link

clean_link:
	rm -rf bin

