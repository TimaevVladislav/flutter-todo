import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:flutter_todo_auth/api.dart";
import "package:shared_preferences/shared_preferences.dart";

class Authentication extends ChangeNotifier {
  static dynamic logged;

  Future<dynamic> register(String email, String password) async {
    try {
      final response = await ApiClient.post("api/auth/registration", {"email": email, "password": password});
      return jsonDecode(response.body);
    } catch (e) {
      return {"errors": e.toString()};
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await ApiClient.post("api/auth/login", {"email": email, "password": password});
      return jsonDecode(response.body);
    } catch (e) {
      return {"errors": e.toString()};
    }
  }

  Future logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("access_token");
  }

  Future<dynamic> currentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString("access_token");

    if (token != null) {
      final parts = token.split(".");
      final user = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
      logged = user;
      notifyListeners();
    }
  }
}