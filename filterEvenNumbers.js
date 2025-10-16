const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} outputDir - 输出目录，默认为当前目录
 * @returns {string} - 生成的文件路径
 */
function filterAndSaveEvenNumbers(array, outputDir = './') {
    // 验证输入参数
    if (!Array.isArray(array)) {
        throw new Error('第一个参数必须是数组');
    }
    
    // 过滤偶数
    const evenNumbers = array.filter(num => {
        // 检查是否为数字
        if (typeof num !== 'number' || isNaN(num)) {
            console.warn(`警告: 非数字值 "${num}" 已被忽略`);
            return false;
        }
        return num % 2 === 0;
    });
    
    // 生成随机文件名
    const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
    const filePath = path.join(outputDir, randomFileName);
    
    try {
        // 将偶数数组保存到文件
        fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
        
        console.log(`偶数已过滤并保存到文件: ${filePath}`);
        console.log(`原数组: [${array.join(', ')}]`);
        console.log(`偶数数组: [${evenNumbers.join(', ')}]`);
        
        return filePath;
    } catch (error) {
        console.error('保存文件时出错:', error.message);
        throw error;
    }
}

// 示例用法
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 25, 30];
const savedFilePath = filterAndSaveEvenNumbers(testArray, '/workspace');

module.exports = { filterAndSaveEvenNumbers };