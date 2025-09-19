# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDFLAGS = 

# Directories
SRCDIR = src
BUILDDIR = build
TESTDIR = tests

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build:
	@echo "Building project..."
	@mkdir -p $(BUILDDIR)
	@$(CXX) $(CXXFLAGS) -o $(BUILDDIR)/main src/main.cpp
	@echo "Build completed."

# Test target
.PHONY: test
test:
	@echo "Running tests..."
	@mkdir -p $(BUILDDIR)
	@$(CXX) $(CXXFLAGS) -o $(BUILDDIR)/test_runner $(TESTDIR)/test_main.cpp
	@./$(BUILDDIR)/test_runner
	@echo "Tests completed."

# Clean target
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILDDIR)
	@echo "Clean completed."

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all     - Build the project (default)"
	@echo "  build   - Build the project"
	@echo "  test    - Run tests"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Show this help message"