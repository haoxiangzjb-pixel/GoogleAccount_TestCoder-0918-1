# Makefile with compile and clean targets

# Compiler settings
CC = gcc
CFLAGS = -Wall -Wextra -std=c99
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Find all C source files in the src directory
SOURCES = $(wildcard $(SRCDIR)/*.c)
# Generate object file names from source files
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
# Generate executable names from source files (without path)
EXECUTABLES = $(SOURCES:$(SRCDIR)/%.c=$(BINDIR)/%)

# Default target
all: $(EXECUTABLES)

# Rule to create executable from object file
$(BINDIR)/%: $(OBJDIR)/%.o
	@mkdir -p $(BINDIR)
	$(CC) $< -o $@ $(CFLAGS)

# Rule to create object file from source file
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target to remove generated files
clean:
	@echo "Cleaning build files..."
	@rm -rf $(OBJDIR) $(BINDIR)
	@echo "Clean complete."

# Rebuild target
rebuild: clean all

# Install target (example)
install: all
	@echo "Installing executables..."
	@cp -r $(BINDIR)/* /usr/local/bin/
	@echo "Install complete."

.PHONY: all clean rebuild install