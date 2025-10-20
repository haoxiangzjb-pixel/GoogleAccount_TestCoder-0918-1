# 编译目标
build:
	@echo "开始编译..."
	# 在这里添加您的编译命令
	# 例如: gcc -o myprogram source.c

# 清理目标
clean:
	@echo "清理编译产物..."
	# 在这里添加清理命令
	# 例如: rm -f myprogram *.o

# 重新编译（先清理再编译）
rebuild: clean build

# 默认目标
all: build