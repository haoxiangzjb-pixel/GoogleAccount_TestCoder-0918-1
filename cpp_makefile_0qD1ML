# Makefile for C++ project
# Define compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -g
LDFLAGS = 

# Define directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Define source and object files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/main

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

# Test target
.PHONY: test
test: build
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./$(TARGET) --test
	# Or run a separate test executable if you have one
	@echo "Tests completed."

# Clean target
.PHONY: clean
clean:
	rm -rf $(OBJDIR) $(BINDIR)
	@echo "Clean completed."

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build - Compile the project"
	@echo "  test  - Run tests (requires build first)"
	@echo "  clean - Remove generated files"
	@echo "  all   - Build the project (default)"
	@echo "  help  - Show this help message"