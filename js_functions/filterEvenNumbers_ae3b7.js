/**
 * 过滤数组中的偶数
 * @param {number[]} numbers - 输入的数字数组
 * @returns {number[]} 只包含偶数的新数组
 */
function filterEvenNumbers(numbers) {
    return numbers.filter(num => num % 2 === 0);
}

// 示例用法
const inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(inputArray);
console.log(evenNumbers); // 输出: [2, 4, 6, 8, 10]

module.exports = filterEvenNumbers;