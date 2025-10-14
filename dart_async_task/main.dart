/// A Dart script to fetch data asynchronously and save it to a file.
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// Fetches data from a URL and saves it to a randomly named .dart file.
Future<void> fetchDataAndSave() async {
  const String url = 'https://httpbin.org/json'; // A public test API

  try {
    print('Fetching data from $url...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Data fetched successfully. Saving...');
      final data = response.body;

      // Generate a random filename
      const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      final random = Random();
      final randomString = Iterable.generate(10, (_) => chars[random.nextInt(chars.length)]).join('');
      final filename = '${randomString}_data.dart';

      // Write the data to the file
      final file = File(filename);
      await file.writeAsString(data);
      print('Data saved to $filename');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchDataAndSave();
}