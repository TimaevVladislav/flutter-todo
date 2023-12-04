import "package:flutter/material.dart";

import "package:flutter_todo_auth/store/auth.dart";
import "package:flutter_todo_auth/widgets/logout_button.dart";
import "package:flutter_todo_auth/widgets/tasks/actions.dart";
import "package:flutter_todo_auth/widgets/tasks/items.dart";

class HomeScreen extends StatefulWidget {
  static String route = "home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Authentication auth = Authentication();
  final TextEditingController messageController = TextEditingController();

  // late User logged;
  late String message;
  bool isOwnMessage = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    // final user = await auth.currentUser;
    // if (user != null) {
    //   logged = user;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          CloseLogoutButton(auth: auth),
        ],
        title: Text("Todo"),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: AddTaskButton(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TaskListItems()
          ]
        )
      )
    );
  }
}