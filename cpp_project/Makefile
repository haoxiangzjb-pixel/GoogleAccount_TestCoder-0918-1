# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
INCLUDES = -I./include

# Directories
SRCDIR = src
TESTDIR = tests
BUILDDIR = build
TARGET = $(BUILDDIR)/main
TESTTARGET = $(BUILDDIR)/test_runner

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Test files
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)
TEST_OBJECTS = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)

# Default target
all: main

# Build the main executable
main: $(TARGET)

# Ensure build directory exists
$(OBJECTS): | $(BUILDDIR)
$(TEST_OBJECTS): | $(BUILDDIR)

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Link the main executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Build and run tests
test: $(TESTTARGET)
	./$(TESTTARGET)

# Link the test executable
$(TESTTARGET): $(filter-out $(BUILDDIR)/main.o, $(OBJECTS)) $(TEST_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile test files
$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)

# Phony targets
.PHONY: all main test clean