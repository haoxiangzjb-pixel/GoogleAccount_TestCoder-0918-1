import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数，获取网络数据并保存到随机命名的.dart文件
Future<void> fetchAndSaveData() async {
  const String url = 'https://httpbin.org/json'; // 一个提供JSON测试数据的公共API

  try {
    print('正在从 $url 获取数据...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('数据获取成功！');

      // 生成随机文件名
      final random = Random();
      final randomNum = random.nextInt(10000);
      final fileName = 'NetworkData_${randomNum.toString().padLeft(4, '0')}.dart';

      // 准备要写入的内容，包含获取到的数据
      final fileContent = '''
// 此文件由 fetchAndSaveData() 函数自动生成
// 数据来源: $url
// 获取时间: ${DateTime.now()}

const String networkData = r"""${response.body}""";
''';

      // 写入文件
      final file = File(fileName);
      await file.writeAsString(fileContent);

      print('数据已保存到文件: $fileName');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

void main(List<String> arguments) async {
  await fetchAndSaveData();
}
