import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> fetchAndSaveData() async {
  try {
    // 获取网络数据
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      // 解析JSON数据
      final Map<String, dynamic> data = jsonDecode(response.body);

      // 生成随机文件名
      final randomName = 'data_${DateTime.now().millisecondsSinceEpoch}.dart';

      // 创建文件内容
      final fileContent = '''
// Generated file: $randomName
// Fetched data from network
// Timestamp: ${DateTime.now().toIso8601String()}

const Map<String, dynamic> fetchedData = ${jsonEncode(data)};
''';

      // 保存到文件
      final file = File('/workspace/dart_async_project/$randomName');
      await file.writeAsString(fileContent);

      print('Data successfully fetched and saved to $randomName');
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchAndSaveData();
}