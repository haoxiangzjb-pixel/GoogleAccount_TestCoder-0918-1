# Define the compiler
CXX = g++

# Define the compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Define the target executable name
TARGET = my_program

# Define the source files
SOURCES = main.cpp src/utils.cpp

# Define the object files
OBJECTS = $(SOURCES:.cpp=.o)

# Define the test executable name
TEST_TARGET = test_$(TARGET)

# Define the test source files
TEST_SOURCES = tests/test_main.cpp tests/test_utils.cpp

# Define the test object files
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Test target
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): build $(TEST_OBJECTS)
	$(CXX) $(OBJECTS) $(TEST_OBJECTS) -o $(TEST_TARGET)

# Clean target
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) $(TEST_TARGET)

.PHONY: all build test clean