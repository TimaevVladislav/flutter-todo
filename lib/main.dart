import "package:flutter/material.dart";

import "package:flutter_todo_auth/screens/welcome.dart";
import "package:flutter_todo_auth/screens/home.dart";
import "package:flutter_todo_auth/screens/login.dart";
import "package:flutter_todo_auth/screens/registration.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.route, routes: {
      WelcomeScreen.route: (context) => WelcomeScreen(),
      RegistrationScreen.route: (context) => RegistrationScreen(),
      LoginScreen.route: (context) => LoginScreen(),
      HomeScreen.route: (context) => HomeScreen()
    });
  }
}