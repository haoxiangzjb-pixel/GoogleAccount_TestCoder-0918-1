# Define the compiler
CXX = g++

# Define any compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Define the name of the executable
TARGET = my_program

# Define the source files
SOURCES = main.cpp

# Define the object files
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the project
build: all
	@echo "Build complete."

# Test the project (placeholder)
test:
	@echo "Running tests..."
	# Add your test commands here

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TARGET)
	@echo "Clean complete."

.PHONY: all build test clean