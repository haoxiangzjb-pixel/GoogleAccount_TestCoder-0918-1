import random
import string

def factorial(n):
    """
    计算给定数字的阶乘
    
    参数:
    n (int): 非负整数
    
    返回:
    int: n的阶乘值
    
    异常:
    ValueError: 当n为负数时抛出异常
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def save_factorial_function_to_random_file():
    """
    将阶乘函数保存到一个随机命名的文件中
    """
    # 生成随机文件名
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # 阶乘函数的代码
    factorial_code = '''def factorial(n):
    """
    计算给定数字的阶乘
    
    参数:
    n (int): 非负整数
    
    返回:
    int: n的阶乘值
    
    异常:
    ValueError: 当n为负数时抛出异常
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
'''
    
    # 将代码写入随机命名的文件
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(factorial_code)
    
    print(f"阶乘函数已保存到文件: {random_filename}")
    return random_filename

# 示例使用
if __name__ == "__main__":
    # 计算一些示例值的阶乘
    print("计算阶乘示例:")
    for i in range(6):
        print(f"{i}! = {factorial(i)}")
    
    # 保存到随机命名的文件
    save_factorial_function_to_random_file()