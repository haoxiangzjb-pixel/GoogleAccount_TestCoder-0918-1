# This is a simple Makefile to compile and clean a C project.
# It assumes the source file is named 'main.c' and the executable is named 'app'.

CC = gcc
CFLAGS = -Wall -g # Include warnings and debug info by default
SRCS = main.c
TARGET = app

# The 'all' target is the default target that gets executed when 'make' is run without arguments.
all: $(TARGET)

# Rule to build the target executable from the source files.
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRCS)

# The 'clean' target removes the generated executable.
clean:
	rm -f $(TARGET)

# The 'help' target prints available targets.
help:
	@echo "Available targets:"
	@echo "  all    : Compiles the project (default)."
	@echo "  clean  : Removes the compiled executable."
	@echo "  help   : Shows this help message."

.PHONY: all clean help