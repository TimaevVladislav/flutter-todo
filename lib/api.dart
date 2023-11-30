import "dart:convert";

import "package:flutter_todo_auth/config/config.dart";
import "package:http/http.dart" as http;

class ApiClient {

  static Future<http.Response> post(String endpoint, Map<String, String> body) async {
    try {
      final String apiUrl = "${Config.baseEndpoint}/$endpoint";
      final response = await http.post(Uri.parse(apiUrl), headers: <String, String>{"Content-Type": "application/json; charset=UTF-8"}, body: jsonEncode(body));
      return response;
    } catch (e) {
      return http.Response('Error: $e', 500);
    }
  }

  static Future<http.Response> get(String endpoint, {Map<String, String>? queryParameters}) async {
    try {
      final String apiUrl = "${Config.baseEndpoint}/$endpoint";
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{"Content-Type": "application/json; charset=UTF-8"});
      return response;
    } catch (e) {
      return http.Response('Error: $e', 500);
    }
  }
}