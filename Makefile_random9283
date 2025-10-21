# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = main

# Source files
SOURCES = $(wildcard *.cpp)

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test executable name
TEST_TARGET = test

# Build target
build: $(TARGET)

# Link object files to create executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files to object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example test target)
test: build
	@echo "Running tests..."
	# Add your test commands here
	# For example: ./$(TARGET) --test
	@echo "Tests completed."

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Additional clean for test files if needed
clean-all: clean
	rm -f $(TEST_TARGET)

# Phony targets
.PHONY: build test clean clean-all