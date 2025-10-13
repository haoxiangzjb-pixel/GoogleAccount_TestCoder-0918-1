import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// 异步函数，用于从网络获取数据并保存到随机命名的.dart文件中。
Future<void> fetchAndSaveData() async {
  const String url = 'https://httpbin.org/json'; // 一个公开的测试API

  try {
    print('正在从 $url 获取数据...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('数据获取成功！');

      // 生成一个随机文件名
      final randomFileName = 'output_${DateTime.now().millisecondsSinceEpoch}.dart';
      final file = File(randomFileName);

      // 将获取到的数据（格式化为Dart代码）写入文件
      await file.writeAsString('''
// Auto-generated file: $randomFileName
// Data fetched at: ${DateTime.now().toIso8601String()}

const dynamic fetchedData = ${jsonEncode(data)};
''');

      print('数据已保存到文件: $randomFileName');
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