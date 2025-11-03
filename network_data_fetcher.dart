import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchNetworkDataAndSave(String url) async {
  try {
    // 使用 http 包进行网络请求
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // 获取响应数据
      String responseBody = response.body;
      
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '/workspace/$randomFileName.dart';
      
      // 将数据写入文件
      File file = File(filePath);
      await file.writeAsString(responseBody);
      
      print('数据已保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  return 'data_$randomString';
}

/// 使用示例
Future<void> main() async {
  // 示例：获取一个公共API的数据
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String savedFilePath = await fetchNetworkDataAndSave(url);
    print('文件保存成功: $savedFilePath');
  } catch (e) {
    print('操作失败: $e');
  }
}