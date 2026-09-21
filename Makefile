# ---- project ----
TARGET_NAME := program
SRCDIR      := src
INCDIR      := include
BUILDDIR    := build
BINDIR      := $(BUILDDIR)/bin
OBJDIR      := $(BUILDDIR)/obj
TARGET      := $(BINDIR)/$(TARGET_NAME).bin

# ---- toolchain ----
AS          := dasm
ASFLAGS     := -f3 -I$(INCDIR)/
SYM         := -s$(OBJDIR)/$(TARGET_NAME).sym
LST         := -l$(OBJDIR)/$(TARGET_NAME).lst
EMU         := stella

.PHONY: all debug run clean print-target

all: $(TARGET)

# DASM generates debug symbols and list files via flags rather than a separate build mode
debug: ASFLAGS += $(SYM) $(LST)
debug: clean $(TARGET)

# DASM directly outputs the final ROM (no linking step)
$(TARGET): $(SRCDIR)/main.s
	@mkdir -p $(BINDIR) $(OBJDIR)
	$(AS) $< $(ASFLAGS) -o$@

run: $(TARGET)
	$(EMU) $(TARGET)

print-target:
	@echo $(TARGET)

clean:
	$(RM) -r $(BUILDDIR)
