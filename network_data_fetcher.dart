import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchNetworkDataAndSave(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求，添加用户代理头
    final response = await http.get(
      Uri.parse(url),
      headers: {'User-Agent': 'Dart Network Data Fetcher'},
    );
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = generateRandomFileName();
      String filePath = './$randomFileName';
      
      // 将数据写入文件
      File file = File(filePath);
      await file.writeAsString(response.body);
      
      print('数据已成功保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机的.dart文件名
String generateRandomFileName() {
  String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // 生成8位随机字符的文件名
  String randomString = List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '${randomString}_data.dart';
}

/// 示例使用
void main() async {
  // 示例：获取一个公开API的数据
  try {
    // 使用JSONPlaceholder API作为示例
    String filePath = await fetchNetworkDataAndSave('https://httpbin.org/get');
    print('文件保存成功: $filePath');
  } catch (e) {
    print('执行失败: $e');
  }
}