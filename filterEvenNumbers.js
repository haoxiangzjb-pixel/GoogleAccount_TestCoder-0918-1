/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} [directory="./"] - 保存文件的目录路径
 * @returns {string} - 生成的文件路径
 */
function filterEvenNumbersAndSave(array, directory = "./") {
    // 过滤偶数
    const evenNumbers = array.filter(num => num % 2 === 0);
    
    // 生成随机文件名
    const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
    const filePath = `${directory}/${randomFileName}`;
    
    // 将偶数数组转换为JSON字符串
    const jsonData = JSON.stringify(evenNumbers, null, 2);
    
    // 使用Node.js的fs模块写入文件
    const fs = require('fs');
    
    try {
        fs.writeFileSync(filePath, jsonData, 'utf8');
        console.log(`偶数已过滤并保存到文件: ${filePath}`);
        console.log(`共找到 ${evenNumbers.length} 个偶数: [${evenNumbers.join(', ')}]`);
        return filePath;
    } catch (error) {
        console.error('保存文件时出错:', error);
        throw error;
    }
}

// 示例用法
const sampleArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFilePath = filterEvenNumbersAndSave(sampleArray);

module.exports = { filterEvenNumbersAndSave };