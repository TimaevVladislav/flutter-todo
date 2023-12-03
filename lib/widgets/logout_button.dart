import "package:flutter/material.dart";
import "package:flutter_todo_auth/services/auth.service.dart";

class CloseLogoutButton extends StatelessWidget {
  const CloseLogoutButton({super.key, required this.auth});
  final Authentication auth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          auth.logout();
          Navigator.pop(context);
        });
  }
}
