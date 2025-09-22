def factorial(n):
    """
    计算n的阶乘
    
    参数:
        n (int): 非负整数
    
    返回:
        int: n的阶乘值
    
    异常:
        ValueError: 当n为负数时抛出异常
    """
    if n < 0:
        raise ValueError("阶乘不能为负数")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result


# 测试函数
if __name__ == "__main__":
    # 测试用例
    test_cases = [0, 1, 5, 10]
    for case in test_cases:
        print(f"{case}! = {factorial(case)}")