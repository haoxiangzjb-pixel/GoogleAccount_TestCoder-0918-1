# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin
TESTDIR = test

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/main
TEST_TARGET = $(BINDIR)/test

# Default target
all: build

# Build target
build: $(TARGET)

# Create directories
$(OBJDIR) $(BINDIR):
	mkdir -p $@

# Link executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@

# Compile source files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Build test executable (example)
$(TEST_TARGET): $(OBJECTS) $(TESTDIR)/* | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(TESTDIR)/*.cpp $(OBJECTS) -o $@ 

# Clean target
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Phony targets
.PHONY: all build test clean