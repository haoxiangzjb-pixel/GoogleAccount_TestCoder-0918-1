import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的 .dart 文件中
/// 
/// [url] - 要获取数据的网络地址
/// [outputDir] - 输出目录路径，默认为当前目录
/// 
/// 返回保存的文件路径
Future<String> fetchAndSaveToRandomFile(
  String url, {
  String outputDir = '.',
}) async {
  // 创建 HTTP 客户端
  final client = http.Client();
  
  try {
    // 异步获取网络数据
    final response = await client.get(Uri.parse(url));
    
    if (response.statusCode != 200) {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
    
    final data = response.body;
    
    // 生成随机文件名
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomSuffix = random.nextInt(1000000);
    final fileName = 'data_${timestamp}_$randomSuffix.dart';
    final filePath = '$outputDir/$fileName';
    
    // 构建 Dart 文件内容（将数据包装成字符串常量）
    final fileContent = '''
// 自动生成的数据文件
// 生成时间: ${DateTime.now().toIso8601String()}
// 数据来源: $url

const String fetchedData = """
$data
""";
''';
    
    // 异步写入文件
    final file = File(filePath);
    await file.writeAsString(fileContent);
    
    print('数据已成功保存到: $filePath');
    return filePath;
    
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  } finally {
    // 关闭客户端
    client.close();
  }
}

void main() async {
  // 示例：从 JSONPlaceholder API 获取数据
  const testUrl = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    final savedPath = await fetchAndSaveToRandomFile(testUrl);
    print('文件保存成功: $savedPath');
    
    // 读取并显示保存的内容
    final savedFile = File(savedPath);
    final content = await savedFile.readAsString();
    print('\n保存的文件内容:\n$content');
    
  } catch (e) {
    print('主程序执行出错: $e');
  }
}
