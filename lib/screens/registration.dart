import "package:flutter/material.dart";

import "package:flutter_todo_auth/screens/home.dart";
import "package:flutter_todo_auth/services/auth.service.dart";

import "package:flutter_todo_auth/widgets/button.dart";
import "package:flutter_todo_auth/widgets/logo_animation.dart";

import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";

class RegistrationScreen extends StatefulWidget {
  static String route = "registration";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final Authentication auth = Authentication();

  bool loading = false;
  late String email;
  late String password;

  void setLoading(bool state) {
    setState(() {
      loading = state;
    });
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
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  // decoration: inputDecoration.copyWith(hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  // decoration: inputDecoration.copyWith(hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    title: "Register",
                    color: Colors.blueAccent,
                    onPressed: () async {
                      try {
                        setLoading(true);
                        final newUser = await auth.register(email, password);

                        if (newUser != null) {
                          setLoading(false);
                          Navigator.pushNamed(context, HomeScreen.route);
                        }
                      } catch (e) {
                        setLoading(false);
                      }
                    })
              ],
            ),
          )),
    );
  }
}