import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_todo_auth/store/tasks.dart";


class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late String newTaskTitle;

  @override
  void initState() {
    super.initState();
    newTaskTitle = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  newTaskTitle = value;
                });
              }
            ),
            AddTaskButton(title: newTaskTitle),
          ],
        ),
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text("Add", style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.lightBlueAccent,
      onPressed: () {
        if (title != "") {
          Provider.of<Tasks>(context, listen: false).addTask(title);
          Navigator.pop(context);
        }
      }
    );
  }
}
