import "package:flutter/material.dart";
import "package:flutter_todo_auth/styles/input.module.dart";

class Input extends StatelessWidget {
  Input({required this.field, required this.label, required this.obscure});
  late String field;
  late bool obscure;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      textAlign: TextAlign.center,
      decoration: inputDecoration.copyWith(hintText: label),
      onChanged: (value) {
         field = value;
      },
    );
  }
}