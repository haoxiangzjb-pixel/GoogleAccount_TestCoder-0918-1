# This is a simple Makefile to compile and clean a C program.
# It assumes the main source file is named 'main.c' and the executable is named 'app'.

CC = gcc
CFLAGS = -Wall -g
TARGET = app
SOURCES = main.c

# Default target
all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $@ $<

# Clean build artifacts
clean:
	rm -f $(TARGET)

# Run the program (requires compilation first if not up-to-date)
run: all
	./$(TARGET)

.PHONY: all clean run