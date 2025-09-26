# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -std=c++17 -Wall -Wextra

# Target executable name
TARGET = main

# Source files
SOURCES = main.cpp utils.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example)
test:
	@echo "Running tests..."
	# Add your test commands here, e.g., ./run_tests

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all test clean