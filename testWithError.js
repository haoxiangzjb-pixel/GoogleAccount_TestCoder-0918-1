const { filterAndSaveEvenNumbers } = require('./filterEvenNumbers');

// 测试包含非数字值的数组
const testArrayWithNonNumbers = [1, 2, 'hello', 4, null, 6, 'world', 8, undefined, 10, 15, 20, 25, 30, true, false];
console.log('测试包含非数字值的数组:');
const savedFilePath = filterAndSaveEvenNumbers(testArrayWithNonNumbers, '/workspace');

// 测试非数组输入
console.log('\n测试非数组输入:');
try {
    filterAndSaveEvenNumbers('not an array');
} catch (error) {
    console.error('捕获到错误:', error.message);
}