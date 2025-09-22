# Makefile for compiling a C program

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c99

# Target executable
TARGET = hello

# Source file
SOURCE = hello.c

# Default target
all: $(TARGET)

# Rule to compile the program
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# Clean rule
clean:
	rm -f $(TARGET)

.PHONY: all clean