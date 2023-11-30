import "dart:convert";
import "package:flutter_todo_auth/api.dart";

class Authentication {

  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      final response = await ApiClient.post("/api/auth/registration", {email, password} as Map<String, String>);
      final responseData = jsonDecode(response.body);
      return responseData;
    } catch (e) {
      return {"errors": "Failed to register user. Please try again."};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await ApiClient.post("/api/auth/login", {email, password} as Map<String, String>);
      final responseData = jsonDecode(response.body);
      return responseData;
    } catch (e) {
      return {"errors": "Failed to log in. Please check your credentials and try again."};
    }
  }

  Future logout() async {

  }
}