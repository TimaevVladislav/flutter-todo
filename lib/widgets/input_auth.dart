import "package:flutter/material.dart";
import "package:flutter_todo_auth/styles/input.module.dart";

class Input extends StatelessWidget {
  Input({required this.onChanged, required this.label, required this.obscure});
  late bool obscure;
  final String label;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      textAlign: TextAlign.center,
      decoration: inputDecoration.copyWith(hintText: label),
      onChanged: onChanged
    );
  }
}