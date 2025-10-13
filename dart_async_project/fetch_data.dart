import 'dart:io';
import 'dart:convert';
import 'dart:math';

/// 异步获取网络数据的函数
/// [url] 是要请求的网络地址
Future<String> fetchData(String url) async {
  try {
    // 注意：在没有安装 http 包的情况下，使用 dart:io 库的 HttpClient
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      client.close();
      return responseBody;
    } else {
      client.close();
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    rethrow;
  }
}

/// 生成一个随机文件名
String generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  final buffer = StringBuffer();
  for (int i = 0; i < 10; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  return '${buffer.toString()}.dart';
}

void main() async {
  final url = 'https://httpbin.org/json'; // 一个用于测试的公共API
  print('正在从 $url 获取数据...');

  try {
    final data = await fetchData(url);
    print('数据获取成功！');

    final randomFileName = generateRandomFileName();
    print('将数据保存到随机命名的文件: $randomFileName');

    final file = File(randomFileName);
    await file.writeAsString(data);
    print('数据已保存到 $randomFileName');
  } catch (e) {
    print('获取数据时出错: $e');
  }
}