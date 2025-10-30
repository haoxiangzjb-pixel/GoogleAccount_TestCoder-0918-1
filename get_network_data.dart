import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url, {String? directory}) async {
  try {
    print('Fetching data from: $url');
    
    // 使用http包进行网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 成功获取数据，将响应数据转换为Dart类格式
      String responseData = response.body;
      
      // 尝试解析JSON数据并生成Dart类
      String dartCode = _generateDartClassFromJson(responseData, url);
      
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String fileName = '${randomFileName}.dart';
      
      // 确定保存目录
      String saveDirectory = directory ?? Directory.current.path;
      String fullPath = '$saveDirectory/$fileName';
      
      // 将数据写入文件
      File file = File(fullPath);
      await file.writeAsString(dartCode);
      
      print('Data saved to: $fullPath');
      return fullPath;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred while fetching and saving network data: \$e');
    rethrow;
  }
}

/// 根据JSON数据生成Dart类代码
String _generateDartClassFromJson(String jsonData, String sourceUrl) {
  try {
    // 解析JSON数据
    final dynamic parsedJson = json.decode(jsonData);
    
    // 生成Dart类代码
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln('// Generated Dart file from network data');
    stringBuffer.writeln('// Source URL: $sourceUrl');
    stringBuffer.writeln('// Generated at: ${DateTime.now()}');
    stringBuffer.writeln();
    
    if (parsedJson is Map<String, dynamic>) {
      // 为Map类型生成Dart类
      stringBuffer.writeln('class NetworkData {');
      
      // 为每个键生成字段
      parsedJson.forEach((key, value) {
        String typeName = _getTypeName(value);
        stringBuffer.writeln('  $typeName ${_toCamelCase(key)};');
      });
      
      stringBuffer.writeln();
      stringBuffer.writeln('  NetworkData({');
      
      // 构造函数参数
      parsedJson.forEach((key, value) {
        stringBuffer.writeln('    required this.${_toCamelCase(key)},');
      });
      
      stringBuffer.writeln('  });');
      stringBuffer.writeln();
      
      // fromJson工厂构造函数
      stringBuffer.writeln('  factory NetworkData.fromJson(Map<String, dynamic> json) {');
      stringBuffer.writeln('    return NetworkData(');
      
      parsedJson.forEach((key, value) {
        String camelKey = _toCamelCase(key);
        String defaultValue = _getDefaultValue(value);
        stringBuffer.writeln('      ${camelKey}: json[\'$key\'] ?? $defaultValue,');
      });
      
      stringBuffer.writeln('    );');
      stringBuffer.writeln('  }');
      stringBuffer.writeln();
      
      // toJson方法
      stringBuffer.writeln('  Map<String, dynamic> toJson() {');
      stringBuffer.writeln('    return {');
      
      parsedJson.forEach((key, value) {
        stringBuffer.writeln('      \'$key\': ${_toCamelCase(key)},');
      });
      
      stringBuffer.writeln('    };');
      stringBuffer.writeln('  }');
      stringBuffer.writeln();
      
      // toString方法
      stringBuffer.writeln('  @override');
      stringBuffer.writeln('  String toString() {');
      stringBuffer.write('    return \'NetworkData(');
      
      bool first = true;
      parsedJson.forEach((key, value) {
        if (!first) stringBuffer.write(', ');
        stringBuffer.write('${_toCamelCase(key)}: \\\$${_toCamelCase(key)}');
        first = false;
      });
      
      stringBuffer.writeln(')\';');
      stringBuffer.writeln('  }');
      stringBuffer.writeln('}');
    } else if (parsedJson is List) {
      // 为List类型生成Dart类
      stringBuffer.writeln('class NetworkDataList {');
      stringBuffer.writeln('  final List<dynamic> items;');
      stringBuffer.writeln();
      stringBuffer.writeln('  NetworkDataList({required this.items});');
      stringBuffer.writeln();
      stringBuffer.writeln('  factory NetworkDataList.fromJson(List<dynamic> json) {');
      stringBuffer.writeln('    return NetworkDataList(items: json);');
      stringBuffer.writeln('  }');
      stringBuffer.writeln();
      stringBuffer.writeln('  List<dynamic> toJson() {');
      stringBuffer.writeln('    return items;');
      stringBuffer.writeln('  }');
      stringBuffer.writeln('}');
    } else {
      // 简单值类型
      stringBuffer.writeln('class NetworkData {');
      stringBuffer.writeln('  final dynamic value;');
      stringBuffer.writeln();
      stringBuffer.writeln('  NetworkData({required this.value});');
      stringBuffer.writeln();
      stringBuffer.writeln('  factory NetworkData.fromJson(dynamic json) {');
      stringBuffer.writeln('    return NetworkData(value: json);');
      stringBuffer.writeln('  }');
      stringBuffer.writeln();
      stringBuffer.writeln('  dynamic toJson() {');
      stringBuffer.writeln('    return value;');
      stringBuffer.writeln('  }');
      stringBuffer.writeln('}');
    }
    
    return stringBuffer.toString();
  } catch (e) {
    // 如果JSON解析失败，返回原始数据的包装
    return '''
// Generated Dart file from network data
// Source URL: $sourceUrl
// Generated at: ${DateTime.now()}
// Note: Could not parse as JSON, saved as raw string

class NetworkData {
  final String rawData;
  
  NetworkData({required this.rawData});
  
  @override
  String toString() {
    return rawData;
  }
}
''';
  }
}

/// 根据值类型确定Dart类型名
String _getTypeName(dynamic value) {
  if (value is int) {
    return 'int';
  } else if (value is double) {
    return 'double';
  } else if (value is String) {
    return 'String';
  } else if (value is bool) {
    return 'bool';
  } else if (value is List) {
    return 'List<dynamic>';
  } else if (value is Map) {
    return 'Map<String, dynamic>';
  } else {
    return 'dynamic';
  }
}

/// 获取默认值
String _getDefaultValue(dynamic value) {
  if (value is int) {
    return '0';
  } else if (value is double) {
    return '0.0';
  } else if (value is String) {
    return "''";
  } else if (value is bool) {
    return 'false';
  } else if (value is List) {
    return '[]';
  } else if (value is Map) {
    return '{}';
  } else {
    return 'null';
  }
}

/// 将下划线命名转换为驼峰命名
String _toCamelCase(String str) {
  if (str.contains('_')) {
    List<String> parts = str.split('_');
    StringBuffer result = StringBuffer(parts[0].toLowerCase());
    
    for (int i = 1; i < parts.length; i++) {
      String part = parts[i];
      if (part.isNotEmpty) {
        result.write('${part[0].toUpperCase()}${part.substring(1).toLowerCase()}');
      }
    }
    
    return result.toString();
  } else {
    return str;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  StringBuffer stringBuffer = StringBuffer();
  
  // 生成10位随机字符作为文件名
  for (int i = 0; i < 10; i++) {
    stringBuffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return stringBuffer.toString();
}

/// 使用示例
Future<void> main() async {
  try {
    // 示例URL - 在实际应用中，这将是真实的API端点
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    
    // 调用异步函数获取网络数据并保存
    String savedFilePath = await fetchAndSaveNetworkData(url, directory: '/workspace');
    
    print('Successfully saved network data to: \$savedFilePath');
    
    // 验证文件是否已创建
    File file = File(savedFilePath);
    if (await file.exists()) {
      print('File exists and contains \${(await file.length())} bytes');
    }
  } catch (e) {
    print('Failed to fetch and save network data: \$e');
  }
}