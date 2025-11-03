const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} outputDir - 输出目录，默认为当前目录
 * @returns {string} - 生成的文件路径
 */
function filterEvenNumbersAndSave(array, outputDir = './') {
  // 验证输入
  if (!Array.isArray(array)) {
    throw new Error('第一个参数必须是数组');
  }
  
  // 过滤出偶数
  const evenNumbers = array.filter(num => typeof num === 'number' && num % 2 === 0);
  
  // 生成随机文件名
  const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(outputDir, randomFileName);
  
  // 将偶数数组保存为JSON格式
  const dataToSave = {
    originalArray: array,
    evenNumbers: evenNumbers,
    count: evenNumbers.length,
    timestamp: new Date().toISOString()
  };
  
  fs.writeFileSync(filePath, JSON.stringify(dataToSave, null, 2));
  
  console.log(`偶数已过滤并保存到文件: ${filePath}`);
  console.log(`原数组: [${array.join(', ')}]`);
  console.log(`偶数: [${evenNumbers.join(', ')}]`);
  console.log(`偶数个数: ${evenNumbers.length}`);
  
  return filePath;
}

// 示例使用
console.log('=== 示例 1 ===');
const testArray1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
const savedFilePath1 = filterEvenNumbersAndSave(testArray1);

console.log('\n=== 示例 2 ===');
const testArray2 = [15, 22, 33, 44, 55, 66, 77, 88];
const savedFilePath2 = filterEvenNumbersAndSave(testArray2);

console.log('\n=== 示例 3 (包含负数) ===');
const testArray3 = [-4, -3, -2, -1, 0, 1, 2, 3, 4];
const savedFilePath3 = filterEvenNumbersAndSave(testArray3);

console.log('\n=== 示例 4 (错误处理) ===');
try {
  filterEvenNumbersAndSave("not an array");
} catch (error) {
  console.log(`捕获错误: ${error.message}`);
}

module.exports = { filterEvenNumbersAndSave };