import 'dart:io';
import 'dart:convert';
import 'dart:math';

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    // 使用HttpClient获取网络数据
    HttpClient client = HttpClient();
    Uri uri = Uri.parse(url);
    
    // 设置请求头，模拟浏览器请求
    HttpClientRequest request = await client.getUrl(uri);
    request.headers.set('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36');
    request.headers.set('Accept', 'application/json');
    
    HttpClientResponse response = await request.close();
    
    // 读取响应数据
    String responseBody = await response.transform(utf8.decoder).join();
    client.close();
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    
    // 将数据保存到.dart文件中
    File file = File(randomFileName);
    await file.writeAsString(responseBody);
    
    print('数据已保存到文件: $randomFileName');
    return randomFileName;
  } catch (e) {
    print('获取网络数据时发生错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // 生成8位随机字符作为文件名
  String randomString = List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '/workspace/${randomString}.dart';
}

/// 主函数示例
void main() async {
  // 示例：获取一个公共API的数据并保存
  try {
    // 使用一个更可靠的API端点
    String fileName = await fetchAndSaveNetworkData('https://api.github.com/users/octocat');
    print('成功保存数据到: $fileName');
  } catch (e) {
    print('执行过程中发生错误: $e');
  }
}