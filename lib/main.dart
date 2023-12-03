import "package:flutter/material.dart";

import "package:flutter_todo_auth/screens/welcome.dart";
import "package:flutter_todo_auth/screens/home.dart";
import "package:flutter_todo_auth/screens/login.dart";
import "package:flutter_todo_auth/screens/registration.dart";
import "package:flutter_todo_auth/store/tasks.dart";
import "package:provider/provider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Tasks()), // Replace with your actual data model class
      ],
      child: Todo()
    )
  );
}

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (context) => WelcomeScreen(),
        RegistrationScreen.route: (context) => RegistrationScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        HomeScreen.route: (context) => HomeScreen()
      }
    );
  }
}