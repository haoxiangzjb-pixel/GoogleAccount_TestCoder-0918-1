import 'dart:io';
import 'dart:convert';
import 'dart:math';

Future<void> fetchAndSaveData(String url, String outputDir) async {
  try {
    print('Fetching data from $url...');
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode != 200) {
      throw Exception('Failed to load data. Status Code: ${response.statusCode}');
    }

    final responseBody = await response.transform(utf8.decoder).join();
    client.close();

    // Generate a random file name
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final randomFileName = StringBuffer();
    for (int i = 0; i < 10; i++) {
      randomFileName.write(chars[random.nextInt(chars.length)]);
    }
    final fileName = '${randomFileName.toString()}.dart';
    final filePath = Platform.pathSeparator == '\\' ? '$outputDir\\$fileName' : '$outputDir/$fileName';

    print('Saving data to $filePath...');
    final file = File(filePath);
    await file.writeAsString(responseBody);

    print('Data successfully fetched and saved to $filePath');
  } catch (e) {
    print('An error occurred: $e');
    rethrow; // Re-throw the exception to be handled upstream if necessary
  }
}

// Example usage
void main() async {
  const String url = 'https://httpbin.org/json'; // Example API that returns JSON
  const String outputDir = '/workspace'; // Example output directory

  await fetchAndSaveData(url, outputDir);
}