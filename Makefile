# Makefile for C++ project
# Defines build, test, and clean targets

# Compiler settings
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Source and binary files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
BINARY = $(BINDIR)/main

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(BINARY)

$(BINARY): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@
	@echo "Linking complete!"

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@
	@echo "Compiled $<"

$(OBJDIR):
	@mkdir -p $(OBJDIR)

$(BINDIR):
	@mkdir -p $(BINDIR)

# Test target
.PHONY: test
test: build
	@echo "Running tests..."
	@if [ -f $(BINDIR)/test ]; then \
		$(BINDIR)/test; \
	else \
		echo "No test executable found. Build tests separately if needed."; \
	fi

# Clean target
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OBJDIR) $(BINDIR)
	@echo "Clean complete!"

# Additional helpful targets
.PHONY: run
run: build
	@echo "Running program..."
	./$(BINARY)

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all     - Build the project (default)"
	@echo "  build   - Build the project"
	@echo "  test    - Run tests"
	@echo "  clean   - Remove build artifacts"
	@echo "  run     - Build and run the program"
	@echo "  help    - Show this help message"