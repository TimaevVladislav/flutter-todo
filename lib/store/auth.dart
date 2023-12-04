import "dart:convert";
import "package:flutter_todo_auth/api.dart";
import "package:shared_preferences/shared_preferences.dart";

class Authentication {

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
}