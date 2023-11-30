import "package:flutter/material.dart";
import "package:flutter_todo_auth/styles/input.module.dart";

class Input extends StatelessWidget {
  Input({required this.field, required this.label});
  late String field;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.center,
      decoration: inputDecoration.copyWith(hintText: label),
      onChanged: (value) {
         field = value;
      },
    );
  }
}