import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
/// [url] - 要获取数据的URL
/// [directory] - 保存文件的目录，默认为当前目录
/// 返回生成的文件路径
Future<String> fetchNetworkDataAndSave(String url, {String directory = '.'}) async {
  try {
    // 使用http包获取网络数据
    http.Response response = await http.get(Uri.parse(url));
    
    // 检查响应状态
    if (response.statusCode != 200) {
      throw Exception('获取数据失败，状态码: ${response.statusCode}');
    }
    
    String responseBody = response.body;
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    String filePath = '$directory/$randomFileName.dart';
    
    // 将数据写入.dart文件
    File file = File(filePath);
    await file.writeAsString(responseBody);
    
    print('数据已成功保存到: $filePath');
    return filePath;
  } catch (e) {
    print('获取或保存数据时出错: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  StringBuffer buffer = StringBuffer();
  
  // 生成10个随机字符作为文件名
  for (int i = 0; i < 10; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return buffer.toString();
}

// 示例用法
void main() async {
  try {
    // 示例：获取JSONPlaceholder的API数据
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    String savedFilePath = await fetchNetworkDataAndSave(url);
    print('文件已保存: $savedFilePath');
  } catch (e) {
    print('执行过程中出现错误: $e');
  }
}