import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 获取网络数据并保存到随机命名的.dart文件中
/// [url] 是要获取数据的网络地址
/// [directory] 是保存文件的目录，默认为当前目录
Future<String> fetchNetworkDataAndSave(String url, {String directory = '.'}) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '$directory/$randomFileName.dart';
      
      // 将数据写入文件
      await File(filePath).writeAsString(response.body);
      
      print('数据已成功保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < 10; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return 'data_${buffer.toString()}';
}

// 示例使用
void main() async {
  // 示例：获取JSONPlaceholder的用户数据
  String url = 'https://jsonplaceholder.typicode.com/users';
  
  try {
    String savedFilePath = await fetchNetworkDataAndSave(url);
    print('完成！文件保存在: $savedFilePath');
  } catch (e) {
    print('操作失败: $e');
  }
}