import "package:flutter/material.dart";
import "package:flutter_todo_auth/services/auth.service.dart";
import "package:flutter_todo_auth/widgets/tasks/list.dart";

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
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                auth.logout();
                Navigator.pop(context);
              }),
        ],
        title: Text("Todo"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
               TasksList(),

          ],
        ),
      ),
    );
  }
}