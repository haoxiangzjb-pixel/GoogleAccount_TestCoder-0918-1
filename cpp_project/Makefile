# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = main

# Source files
SOURCES = main.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test target name
TEST_TARGET = test_runner

# Test source files
TEST_SOURCES = test_main.cpp

# All source files for dependency tracking
ALL_SOURCES = $(SOURCES) $(TEST_SOURCES)

.PHONY: all build test clean

# Default target
all: build

# Build the main executable
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build and run tests (dummy test target)
test: CXXFLAGS += -DTESTING
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_SOURCES)
	$(CXX) $(CXXFLAGS) -o $@ $<

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET) $(TEST_TARGET)

# Run tests (phony target to always execute)
run_tests: test

# Show help message
help:
	@echo "Available targets:"
	@echo "  all     - Builds the main target (default)"
	@echo "  build   - Builds the main executable"
	@echo "  test    - Builds and runs tests"
	@echo "  clean   - Removes build artifacts"
	@echo "  help    - Shows this help message"