import "package:flutter_todo_auth/api.dart";

class Authentication {

  Future register(email, password) async {
    final user = await ApiClient.post("/api/auth/registration", {});
    return user;
  }

  Future login(email, password) async {
    final user = await ApiClient.post("/api/auth/login", {});
    return user;
  }

  Future logout() async {

  }
}