import 'package:flutter/material.dart';
import 'Post.dart';
import 'ToHome.dart';

class TaskItem extends StatelessWidget {
  TaskItem({required this.post, required this.TodoList});

  final Post post;

  final ToDoListState TodoList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: //Text (taskModel.title , style: _getTextStyle(taskModel)),
        GestureDetector(
          child: Text(post.title),
          onTap: () {
            //Todo implement for detailed post
          },
        ),
        subtitle: Text(post.description.substring(0, 3) + "..."),
        trailing: GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            child: Row(
              children: [
                Builder(builder: (context) {
                  ToDoListState().deleteTask(post);
                  return const Icon(Icons.delete, color: Colors.red);
                }),
                Builder(builder: (context) {
                  post.setlike();    // bayad eslah shavad!
                  return const Icon(Icons.monitor_heart_rounded,
                      color: Colors.red);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
