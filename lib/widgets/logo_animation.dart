import "package:flutter/material.dart";
import "package:flutter_todo_auth/config/config.dart";

class LogoAnimation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Hero(tag: "logo",
        child: Container(
          height: 200.0,
          child: Image.asset(Config.logo),
        )
    );
  }
}