# 用Python模拟Haskell风格的递归函数来计算列表长度
# 函数名: my_length
# 参数: lst - 一个列表
# 返回: 该列表的元素个数 (整数)

def my_length(lst):
    """
    递归计算列表长度的函数。
    模拟了Haskell中典型的模式匹配和递归定义。
    """
    # 基本情况：如果列表为空，则长度为0
    if not lst:
        return 0
    # 递归情况：列表长度 = 1 + 余下部分列表的长度
    else:
        return 1 + my_length(lst[1:])


# --- 示例用法 ---
example_list = [1, 2, 3, 4, 5]
calculated_length = my_length(example_list)
print(f"列表 {example_list} 的长度是: {calculated_length}")

example_list2 = []
calculated_length2 = my_length(example_list2)
print(f"列表 {example_list2} 的长度是: {calculated_length2}")
