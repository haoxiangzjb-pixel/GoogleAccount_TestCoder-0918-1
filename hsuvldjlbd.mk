# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDLIBS = 

# Directories
SRCDIR = src
TESTDIR = test
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
.PHONY: all
all: build

# Build target - compiles the main application
.PHONY: build
build: $(TARGET)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS) | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDLIBS)

# Test target - compiles and runs tests
.PHONY: test
test: $(TESTTARGET)
	./$(TESTTARGET)

$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TESTTARGET): $(TEST_OBJECTS) $(filter-out $(BUILDDIR)/main.o, $(OBJECTS)) | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDLIBS)

# Clean target - removes build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

# Create build directory if it doesn't exist
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all   - Build the main application (default)"
	@echo "  build - Build the main application"
	@echo "  test  - Build and run tests"
	@echo "  clean - Remove build artifacts"
	@echo "  help  - Display this help message"