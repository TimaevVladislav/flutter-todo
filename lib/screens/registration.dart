import "package:flutter/material.dart";
import "package:flutter_todo_auth/store/auth.dart";
import "package:shared_preferences/shared_preferences.dart";

import "package:flutter_todo_auth/screens/home.dart";

import "package:flutter_todo_auth/widgets/button_auth.dart";
import "package:flutter_todo_auth/widgets/input_auth.dart";
import "package:flutter_todo_auth/widgets/animations/logo.dart";

import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";

class RegistrationScreen extends StatefulWidget {
  static String route = "registration";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final Authentication auth = Authentication();

  bool loading = false;
  String email = "";
  String password = "";
  late String message = "";

  void setLoading(bool state) {
    setState(() {
      loading = state;
    });
  }

  void registerHandler() async {
    try {
      setLoading(true);
      final response = await auth.register(email, password);
      final String? token = response["token"];

      if (token != null && token.isNotEmpty) {
        accessTokenHandler(token);
        Navigator.pushNamed(context, HomeScreen.route);
      }

      errorMessageHandler(response["message"]);
    } catch (e) {
      setLoading(false);
    }
  }

  void accessTokenHandler(String token) async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("access_token", token);

    message = "";
    email = "";
    password = "";
    setLoading(false);
  }

  void errorMessageHandler(String msg) {
    setLoading(false);
    message = msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
          inAsyncCall: loading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                LogoAnimation(),
                Center(child: Text(message, style: TextStyle(color: Colors.redAccent))),
                SizedBox(height: 48.0),
                Input(
                    label: "Enter your email",
                    obscure: false,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    }
                ),
                SizedBox(height: 8.0),
                Input(
                    label: "Enter your password",
                    obscure: true,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    }
                ),
                SizedBox(height: 24.0),
                RoundedButton(
                    title: "Register",
                    color: Colors.blueAccent,
                    onPressed: () async {
                       registerHandler();
                    })
              ]
            )
          ))
    );
  }
}