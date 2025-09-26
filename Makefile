# This is a sample Makefile
# It has targets for compiling and cleaning a simple C project

CC = gcc
CFLAGS = -Wall -g
TARGET = my_program
SOURCES = main.c utils.c
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all    : Build the program (default)"
	@echo "  clean  : Remove object files and the executable"
	@echo "  help   : Show this help message"