import 'dart:convert';
import 'package:http/http.dart' as http;

/// Fetches data from the specified URL.
/// Throws an exception if the request fails.
Future<dynamic> fetchDataFromUrl() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    // If the call is successful, return the parsed JSON
    return jsonDecode(response.body);
  } else {
    // If the call fails, throw an error
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}
