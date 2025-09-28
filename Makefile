# This is a simple Makefile to compile and clean a C project.
# It assumes the source file is named 'main.c' and the executable is named 'app'.

CC = gcc
CFLAGS = -Wall -g
TARGET = app
SOURCES = main.c

# The first target is the default target when 'make' is run without arguments.
$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES)

# The 'clean' target removes the compiled executable.
clean:
	rm -f $(TARGET)

# The 'help' target prints available commands.
help:
	@echo "Available targets:"
	@echo "  make or make $(TARGET) - Compile the project."
	@echo "  make clean                 - Remove the executable."
	@echo "  make help                  - Show this help message."