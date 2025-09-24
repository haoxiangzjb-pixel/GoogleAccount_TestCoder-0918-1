import 'dart:io';
import 'dart:convert';
import 'dart:math';

Future<void> fetchAndSaveData() async {
  final url = 'https://jsonplaceholder.typicode.com/posts/1';
  try {
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonString = await response.transform(utf8.decoder).join();
      final data = jsonDecode(jsonString);

      // Generate a random filename
      const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      final random = Random();
      final randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
      final filename = '${randomString}_data.dart';

      // Format the data into a Dart file content string
      final fileContent = '''
// Data fetched from $url
// Generated on ${DateTime.now()}

const Map<String, dynamic> fetchedData = ${jsonEncode(data)};
''';

      // Write the content to the file
      final file = File(filename);
      await file.writeAsString(fileContent);

      print('Data successfully fetched and saved to \$filename');
    } else {
      print('Failed to load data. Status code: \${response.statusCode}');
    }
    client.close();
  } catch (e) {
    print('An error occurred: \$e');
  }
}
