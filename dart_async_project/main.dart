import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  // 获取网络数据
  final url = 'https://jsonplaceholder.typicode.com/todos/1';
  final httpClient = HttpClient();
  final request = await httpClient.getUrl(Uri.parse(url));
  final response = await request.close();
  final responseBody = await response.transform(utf8.decoder).join();
  httpClient.close();

  print('Fetched data: $responseBody');

  // 生成随机文件名
  final random = DateTime.now().millisecondsSinceEpoch;
  final fileName = '/workspace/dart_async_project/data_$random.dart';

  // 将数据写入文件
  final file = File(fileName);
  await file.writeAsString(responseBody);
  print('Data saved to: \$fileName');
}
