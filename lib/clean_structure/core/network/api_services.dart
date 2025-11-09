import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {
  static Future<Map<String, dynamic>> post(dynamic body, String apiUrl) async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'x-api-key': 'reqres-free-v1',
        }, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
