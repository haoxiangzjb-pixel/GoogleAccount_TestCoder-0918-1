# This is a simple Makefile for a C project
CC=gcc
CFLAGS=-Wall -g
TARGET=my_program
SOURCES=main.c helper.c

# The all target builds the program
all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES)

# The clean target removes the executable and any object files
clean:
	rm -f $(TARGET) *.o

# The run target executes the program
run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run