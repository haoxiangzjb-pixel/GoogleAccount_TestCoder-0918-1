# Makefile for a simple C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = myapp

# Source files
SOURCES = main.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test executable name
TEST_TARGET = test_$(TARGET)

# Test source files
TEST_SOURCES = test_main.cpp

# Test object files
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Build the main target
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the test target
test_build: $(TEST_OBJECTS) $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) $^

# Compile test source files into object files
test_%.o: test_%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests (requires test target to be built)
test: test_build
	./$(TEST_TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) $(TEST_TARGET)

.PHONY: all test_build test clean