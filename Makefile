# 编译和清理目标的Makefile示例

# 变量定义
CC = gcc
CFLAGS = -Wall -g
SRCDIR = src
OBJDIR = obj
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
TARGET = myprogram

# 默认目标
all: $(TARGET)

# 编译目标
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)
	@echo "编译完成: $(TARGET)"

# 编译源文件为目标文件
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# 清理目标
clean:
	@echo "清理编译产物..."
	@rm -rf $(OBJDIR)
	@rm -f $(TARGET)
	@echo "清理完成"

# 重新编译
rebuild: clean all

# 显示帮助信息
help:
	@echo "可用目标:"
	@echo "  all     - 编译程序 (默认)"
	@echo "  clean   - 清理编译产物"
	@echo "  rebuild - 重新编译"
	@echo "  help    - 显示此帮助信息"