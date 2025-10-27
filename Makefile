# 编译目标
build:
	@echo "编译项目..."
	# 在这里添加实际的编译命令，例如：
	# gcc -o myprogram main.c utils.c -Wall -Wextra

# 清理目标
clean:
	@echo "清理编译产物..."
	# 删除编译生成的文件，例如：
	# rm -f myprogram *.o

# 默认目标
all: build

# 帮助信息
help:
	@echo "可用目标:"
	@echo "  build - 编译项目"
	@echo "  clean - 清理编译产物"
	@echo "  all   - 编译项目(默认)"
	@echo "  help  - 显示此帮助信息"