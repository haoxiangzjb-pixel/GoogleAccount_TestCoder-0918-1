import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    // 使用http包获取数据
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      final random = Random();
      final randomFileName = 'fetched_data_${random.nextInt(1000000)}.dart';
      
      // 创建文件并写入数据
      final file = File('$randomFileName');
      await file.writeAsString(response.body);
      
      print('数据已保存到: $randomFileName');
      return randomFileName;
    } else {
      throw Exception('请求失败: ${response.statusCode}');
    }
  } catch (e) {
    print('获取网络数据时出错: $e');
    rethrow;
  }
}

void main() async {
  // 示例：获取JSONPlaceholder的数据并保存
  final url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    print('开始获取网络数据...');
    final fileName = await fetchAndSaveNetworkData(url);
    print('文件创建成功: $fileName');
  } catch (e) {
    print('操作失败: $e');
  }
}