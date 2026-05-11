const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} arr - 输入的数字数组
 * @param {string} [directory='./'] - 保存文件的目录路径
 * @returns {string} - 保存的文件路径
 */
function filterEvenNumbersToFile(arr, directory = './') {
    // 验证输入是否为数组
    if (!Array.isArray(arr)) {
        throw new Error('第一个参数必须是数组');
    }

    // 过滤偶数
    const evenNumbers = arr.filter(num => typeof num === 'number' && num % 2 === 0);

    // 生成随机文件名
    const randomString = Math.random().toString(36).substring(2, 15) + 
                         Math.random().toString(36).substring(2, 15);
    const fileName = `even_numbers_${randomString}.json`;
    const filePath = path.join(directory, fileName);

    // 确保目录存在
    if (directory !== './' && !fs.existsSync(directory)) {
        fs.mkdirSync(directory, { recursive: true });
    }

    // 将结果写入文件
    const fileContent = JSON.stringify({
        original: arr,
        evenNumbers: evenNumbers,
        count: evenNumbers.length,
        timestamp: new Date().toISOString()
    }, null, 2);

    fs.writeFileSync(filePath, fileContent, 'utf8');

    console.log(`已过滤 ${evenNumbers.length} 个偶数`);
    console.log(`文件已保存到: ${filePath}`);

    return filePath;
}

// 导出函数
module.exports = filterEvenNumbersToFile;

// 示例使用（当直接运行此文件时）
if (require.main === module) {
    // 测试数据
    const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    
    try {
        const savedFile = filterEvenNumbersToFile(testArray);
        console.log('\n操作成功完成！');
    } catch (error) {
        console.error('发生错误:', error.message);
        process.exit(1);
    }
}
