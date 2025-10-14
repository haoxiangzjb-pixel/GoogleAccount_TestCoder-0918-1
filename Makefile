# This is a simple Makefile for a C project.
# It includes targets for compiling and cleaning the project.

CC = gcc
CFLAGS = -Wall -g
TARGET = myprogram
SOURCES = main.c helper.c
OBJECTS = $(SOURCES:.c=.o)

# The 'all' target is the default target.
# It depends on the executable file.
all: $(TARGET)

# This rule tells how to build the executable from object files.
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# This pattern rule tells how to build an object file from a C source file.
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# The 'clean' target removes generated files.
clean:
	rm -f $(OBJECTS) $(TARGET)

# The 'help' target prints available targets.
help:
	@echo "Available targets:"
	@echo "  all   - Build the program (default)."
	@echo "  clean - Remove built files."
	@echo "  help  - Show this help message."