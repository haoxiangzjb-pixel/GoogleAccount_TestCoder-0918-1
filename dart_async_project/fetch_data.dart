// Since the Dart SDK is not available in this environment, 
// I will create the Dart file content as requested.
// This file demonstrates an asynchronous function to fetch data.

import 'dart:convert';
import 'dart:io';

/// Asynchronously fetches data from a URL and saves it to a file.
Future<void> fetchDataAndSave() async {
  final url = Uri.parse('https://httpbin.org/json'); // Example API
  try {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(url);
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = await response.transform(utf8.decoder).join();
      print('Data fetched successfully. Status: ${response.statusCode}');

      // Generate a random filename
      final randomNum = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'fetched_data_$randomNum.dart';

      // Write the data to the file
      final file = File(fileName);
      await file.writeAsString(responseBody);
      print('Data saved to file: $fileName');
    } else {
      print('Failed to fetch data. Status: ${response.statusCode}');
    }
    httpClient.close();
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchDataAndSave();
}