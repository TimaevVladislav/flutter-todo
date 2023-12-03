import "package:flutter/material.dart";

import "package:flutter_todo_auth/screens/login.dart";
import "package:flutter_todo_auth/screens/registration.dart";

import "package:flutter_todo_auth/widgets/button.dart";
import "package:flutter_todo_auth/widgets/animations/logo.dart";
import "package:flutter_todo_auth/widgets/animations/title.dart";

class WelcomeScreen extends StatefulWidget {
  static String route = "welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                LogoAnimation(),
                AnimatedTitle(),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                title: "Log In",
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.route);
            }),
            RoundedButton(
                title: "Register",
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.route);
            })
          ]
        )
      )
    );
  }
}

