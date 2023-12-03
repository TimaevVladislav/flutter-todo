import "package:flutter/material.dart";
import "package:flutter_todo_auth/widgets/modals/add_task.dart";

class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTask(),
                  )
              )
          );
        }
    );
  }
}
