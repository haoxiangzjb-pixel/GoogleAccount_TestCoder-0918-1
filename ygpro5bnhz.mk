# 编译目标
build:
	@echo "Compiling..."
	# 在这里添加实际的编译命令，例如:
	# gcc -o myprogram source.c

# 清理目标
clean:
	@echo "Cleaning..."
	# 在这里添加实际的清理命令，例如:
	# rm -f myprogram *.o

# 伪目标声明
.PHONY: build clean