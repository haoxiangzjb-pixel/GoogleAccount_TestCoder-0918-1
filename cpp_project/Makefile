# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -g
INCLUDES = -I./include

# Directories
SRCDIR = src
INCDIR = include
BUILDDIR = build
TESTDIR = tests

# Source files
SOURCES = $(SRCDIR)/main.cpp $(SRCDIR)/hello.cpp
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Test files
TEST_SOURCES = $(TESTDIR)/test_hello.cpp
TEST_OBJECTS = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_TARGET = $(BUILDDIR)/test_hello

# Target executable
TARGET = $(BUILDDIR)/main

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files to object files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Build and run tests
test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Build test executable
$(TEST_TARGET): $(TEST_OBJECTS) $(filter-out $(BUILDDIR)/main.o, $(OBJECTS))
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile test source files
$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)/*

# Phony targets
.PHONY: all clean test