# Define the compiler
CXX = g++

# Define any compiler flags (e.g., warnings, debug info)
CXXFLAGS = -Wall -Wextra -g

# Define the name of the executable
TARGET = my_program

# Define source files (replace with your actual .cpp files)
SOURCES = main.cpp

# Define object files (derived from source files)
OBJECTS = $(SOURCES:.cpp=.o)

# Default target: build the program
all: $(TARGET)

# Rule to link the executable from object files
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Rule to compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example: assumes you have a test runner or framework)
.PHONY: test
test:
	@echo "Running tests..."
	# Add your test command here, e.g., ./run_tests
	# For now, just print a message
	@echo "No tests configured yet."

# Clean target: remove generated files
.PHONY: clean
clean:
	rm -f $(OBJECTS) $(TARGET)

# Help target to show available commands
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all    - Build the program (default)"
	@echo "  test   - Run tests"
	@echo "  clean  - Remove build artifacts"
	@echo "  help   - Show this help message"