# 编译目标
compile:
	@echo "Compiling project..."
	gcc -o myprogram main.c

# 清理目标
clean:
	@echo "Cleaning up..."
	rm -f myprogram *.o

# 默认目标
all: compile

# 帮助信息
help:
	@echo "Available targets:"
	@echo "  compile - 编译项目"
	@echo "  clean   - 清理编译生成的文件"
	@echo "  all     - 编译项目(默认)"
	@echo "  help    - 显示此帮助信息"