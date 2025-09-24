import 'dart:io';
import 'dart:convert';

/// 异步函数，用于获取网络数据并保存到文件
Future<void> fetchAndSaveData(String url, String fileName) async {
  try {
    print('正在从 $url 获取数据...');
    final response = await HttpClient().getUrl(Uri.parse(url));
    final data = await response.close();

    if (data.statusCode == 200) {
      final responseBody = await data.transform(utf8.decoder).join();
      print('数据获取成功，正在写入文件 $fileName ...');

      await File(fileName).writeAsString(responseBody);
      print('数据已成功保存到 $fileName');
    } else {
      print('HTTP 请求失败，状态码: ${data.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  // 示例：获取一个公开的 JSON API 数据
  await fetchAndSaveData('https://httpbin.org/json', 'fetched_data.json');
}
