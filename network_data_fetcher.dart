import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:async';

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  HttpClient client = HttpClient();
  try {
    print('正在获取网络数据: $url');
    
    // 解析URL
    Uri uri = Uri.parse(url);
    
    // 创建HTTP请求
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    
    if (response.statusCode == 200) {
      // 读取响应内容
      String responseBody = await response.transform(utf8.decoder).join();
      
      // 生成随机文件名
      String randomFileName = generateRandomFileName();
      
      // 将数据写入文件
      File file = File(randomFileName);
      await file.writeAsString(responseBody);
      
      print('数据已保存到: $randomFileName');
      return randomFileName;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('错误: $e');
    rethrow;
  } finally {
    client.close();
  }
}

/// 生成随机.dart文件名
String generateRandomFileName() {
  String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  String randomString = '';
  for (int i = 0; i < 10; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return '/workspace/${randomString}.dart';
}

/// 主函数示例
void main() async {
  // 示例：获取一个公开API的数据
  try {
    // 使用JSONPlaceholder API作为示例
    String fileName = await fetchAndSaveNetworkData('https://jsonplaceholder.typicode.com/posts/1');
    print('成功保存文件: $fileName');
  } catch (e) {
    print('执行失败: $e');
  }
  
  // 您也可以使用其他URL
  // String fileName = await fetchAndSaveNetworkData('https://api.github.com/users/octocat');
}