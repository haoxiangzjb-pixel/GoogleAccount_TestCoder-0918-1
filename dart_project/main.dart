import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

/// 异步函数：获取网络数据并保存到文件
Future<void> fetchAndSaveData() async {
  try {
    // 1. 生成一个随机的文件名
    final random = Random();
    final randomSuffix = random.nextInt(1000000);
    final fileName = 'network_data_$randomSuffix.dart';
    final filePath = '/workspace/dart_project/$fileName';

    // 2. 发起网络请求 (这里以 httpbin.org 为例)
    final url = Uri.parse('https://httpbin.org/get');
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(url);
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      // 3. 读取响应内容
      final responseBody = await response.transform(utf8.decoder).join();

      // 4. 将数据写入文件
      await File(filePath).writeAsString(responseBody);

      print('数据已成功获取并保存到: $filePath');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }

    // 5. 关闭HttpClient
    httpClient.close();
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  await fetchAndSaveData();
}