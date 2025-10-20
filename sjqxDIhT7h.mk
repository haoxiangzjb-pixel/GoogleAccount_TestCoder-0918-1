# Makefile for compiling a C program
CC = gcc
CFLAGS = -Wall -g

# Default target
all: program

# Rule to compile the C program
program: program.c
	$(CC) $(CFLAGS) -o program program.c

# Clean build artifacts
clean:
	rm -f program

# Phony targets
.PHONY: all clean