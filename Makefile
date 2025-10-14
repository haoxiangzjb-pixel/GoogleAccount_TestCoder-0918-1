# This is a simple Makefile to compile and clean a C program.
# It assumes the main source file is named 'main.c'.

CC = gcc
CFLAGS = -Wall -g
TARGET = main
SOURCES = main.c
OBJECTS = $(SOURCES:.c=.o)

# The 'all' target is the default goal.
all: $(TARGET)

# Rule to link the executable from object files.
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# Rule to compile source files into object files.
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# The 'clean' target removes generated files.
clean:
	rm -f $(OBJECTS) $(TARGET)

# The 'help' target prints available targets.
help:
	@echo "Available targets:"
	@echo "  all   - Builds the $(TARGET) executable (default)."
	@echo "  clean - Removes generated object files and the executable."
	@echo "  help  - Shows this message."

.PHONY: all clean help