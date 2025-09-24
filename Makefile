# Define the compiler
CXX = g++

# Define the compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Define the executable name
TARGET = my_program

# Define source files
SOURCES = main.cpp

# Define object files
OBJECTS = $(SOURCES:.cpp=.o)

# Define the test executable name
TEST_TARGET = test_$(TARGET)

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJECTS)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the test executable (example rule, customize as needed)
test_build: $(OBJECTS)
	# This is a placeholder. Add logic here to compile and link your test files.
	# For example: $(CXX) $(CXXFLAGS) -o $(TEST_TARGET) test_main.cpp $(SOURCES)
	@echo "Compiling tests..."
	@echo "Test build completed."

# Run tests (example rule, customize as needed)
test: test_build
	# This is a placeholder. Add logic here to execute your test runner.
	# For example: ./$(TEST_TARGET)
	@echo "Running tests..."
	@echo "All tests passed!"

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TARGET) $(TEST_TARGET)

# Declare phony targets
.PHONY: all test test_build clean