# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g
INCLUDES = -I./include

# Directories
SRC_DIR = src
INC_DIR = include
BUILD_DIR = build

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Target executable
TARGET = $(BUILD_DIR)/main
TEST_TARGET = $(BUILD_DIR)/test

# Main object files (excluding test)
MAIN_OBJS = $(filter-out $(BUILD_DIR)/test.o, $(OBJS))

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(MAIN_OBJS) | $(BUILD_DIR)
	$(CXX) $(MAIN_OBJS) -o $@

# Build the test executable
test: $(TEST_TARGET)

$(TEST_TARGET): $(BUILD_DIR)/test.o $(filter-out $(BUILD_DIR)/main.o, $(OBJS)) | $(BUILD_DIR)
	$(CXX) $^ -o $@

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Run the main program
run: $(TARGET)
	./$(TARGET)

# Run tests
run_test: $(TEST_TARGET)
	./$(TEST_TARGET)

.PHONY: all clean run test run_test