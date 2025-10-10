import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件的函数
Future<void> fetchAndSaveData() async {
  try {
    print('正在获取数据...');
    final response = await http.get(Uri.parse('https://httpbin.org/json'));

    if (response.statusCode == 200) {
      print('数据获取成功，正在写入文件...');
      final data = response.body;

      // 生成一个随机文件名
      var random = Random();
      String randomFileName = 'output_${random.nextInt(10000)}.dart';

      // 将数据写入文件
      File file = File('/workspace/dart_async_app/bin/$randomFileName');
      await file.writeAsString(data);

      print('数据已保存到 $randomFileName');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  await fetchAndSaveData();
}