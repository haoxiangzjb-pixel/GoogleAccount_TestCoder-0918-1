# 过滤偶数并保存文件

这个JavaScript函数可以过滤数组中的偶数，并将结果保存到一个随机命名的JSON文件中。

## 功能特点

- 过滤数组中的偶数
- 生成随机命名的文件（包含时间戳和随机数）
- 支持错误处理
- 自动忽略非数字值
- 返回生成的文件路径

## 使用方法

```javascript
const { filterAndSaveEvenNumbers } = require('./filterEvenNumbers');

// 示例用法
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const filePath = filterAndSaveEvenNumbers(numbers, '/workspace');
// 输出偶数 [2, 4, 6, 8, 10] 到一个随机命名的JSON文件
```

## 函数参数

- `array`: 要过滤的数字数组
- `outputDir` (可选): 输出目录，默认为当前目录

## 输出

- 在控制台显示过滤结果
- 返回生成的文件路径
- 将偶数数组保存为JSON格式的文件

## 文件命名规则

生成的文件名格式为：`even_numbers_[时间戳]_[随机数].json`