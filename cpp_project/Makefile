# Makefile for C++ Project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g
INCLUDES = -I./include

# Directories
SRCDIR = src
TESTDIR = tests
BUILDDIR = build
INCLUDEDIR = include

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_OBJECTS = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)

# Executables
TARGET = $(BUILDDIR)/main
TEST_TARGET = $(BUILDDIR)/test

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECTS) | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Build object files for main
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Build the test executable
test: $(TEST_TARGET)

$(TEST_TARGET): $(filter-out $(BUILDDIR)/main.o, $(OBJECTS)) $(BUILDDIR)/test_calculator.o | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Build object files for tests
$(BUILDDIR)/test_calculator.o: $(TESTDIR)/test_calculator.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)/*

# Run the main program
run: $(TARGET)
	./$(TARGET)

# Run tests
run_test: $(TEST_TARGET)
	./$(TEST_TARGET)

.PHONY: all test clean run run_test