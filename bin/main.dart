import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 获取网络数据并将其内容保存到一个随机命名的 .dart 文件中。
Future<void> fetchAndSaveData(String url, String outputDirectory) async {
  try {
    print('正在从 $url 获取数据...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('数据获取成功！');

      // 生成一个随机的文件名
      const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
      final random = Random();
      final fileName = 'data_${Iterable.generate(8, (_) => chars[random.nextInt(chars.length)]).join()}.dart';
      final filePath = '$outputDirectory/$fileName';

      print('正在将数据保存到 $filePath ...');
      final file = File(filePath);
      await file.writeAsString(response.body);

      print('数据已成功保存到 $filePath');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  // 确保输出目录存在
  final outputDir = Directory('/workspace/output');
  if (!await outputDir.exists()) {
    await outputDir.create(recursive: true);
  }

  // 调用异步函数获取数据并保存
  await fetchAndSaveData('https://httpbin.org/json', outputDir.path);
}