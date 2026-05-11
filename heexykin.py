def factorial(n):
    """计算非负整数 n 的阶乘"""
    if n < 0:
        raise ValueError("n 必须是非负整数")
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result


if __name__ == "__main__":
    # 示例测试
    for i in range(6):
        print(f"{i}! = {factorial(i)}")
