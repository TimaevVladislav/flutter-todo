import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_todo_auth/store/tasks.dart";

class EditTask extends StatefulWidget {
  final String title;

  EditTask({required this.title});

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.title);
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
              "Edit Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: _textEditingController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
            EditTaskButton(
              oldTitle: widget.title,
              newTitleController: _textEditingController,
            ),
          ],
        ),
      ),
    );
  }
}

class EditTaskButton extends StatelessWidget {
  final String oldTitle;
  final TextEditingController newTitleController;

  EditTaskButton({required this.oldTitle, required this.newTitleController});

  void editTaskHandler(context) {
    String newTitle = newTitleController.text;

    if (newTitle != "") {
      Provider.of<Tasks>(context, listen: false).editTask(oldTitle, newTitle);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text("Save", style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.lightBlueAccent,
      onPressed: () {
        editTaskHandler(context);
      }
    );
  }
}
