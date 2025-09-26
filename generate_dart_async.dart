// This script generates a Dart async function that fetches data from a URL
// and saves the code to a randomly named .dart file.

import 'dart:io';
import 'dart:math';

String generateDartFunction(String url) {
  return '''
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Fetches data from the specified URL.
/// Throws an exception if the request fails.
Future<dynamic> fetchDataFromUrl() async {
  final response = await http.get(Uri.parse('$url'));

  if (response.statusCode == 200) {
    // If the call is successful, return the parsed JSON
    return jsonDecode(response.body);
  } else {
    // If the call fails, throw an error
    throw Exception('Failed to load data: \${response.statusCode}');
  }
}
''';
}

void main() {
  final url = 'https://jsonplaceholder.typicode.com/posts/1'; // Example URL
  final dartCode = generateDartFunction(url);

  // Generate a random filename
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  String randomString() => List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  String fileName = 'fetch_func_${randomString()}.dart';

  // Write the generated code to the file
  final file = File(fileName);
  file.writeAsStringSync(dartCode);

  print('Generated Dart function saved to: \$fileName');
}