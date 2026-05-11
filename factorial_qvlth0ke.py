def factorial(n):
    """
    计算非负整数 n 的阶乘。
    
    参数:
        n (int): 非负整数
    
    返回:
        int: n 的阶乘
    
    异常:
        ValueError: 如果 n 是负数
        TypeError: 如果 n 不是整数
    """
    if not isinstance(n, int):
        raise TypeError("输入必须是整数")
    if n < 0:
        raise ValueError("输入必须是非负整数")
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result


# 测试示例
if __name__ == "__main__":
    test_values = [0, 1, 5, 10]
    for val in test_values:
        print(f"{val}! = {factorial(val)}")
