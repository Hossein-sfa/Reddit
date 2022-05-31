import 'package:flutter/material.dart';
import 'Post.dart';
import 'ToHome.dart';

class TaskItem extends StatelessWidget {
  TaskItem({required this.post});
  final Post post;

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
                  post.setLike();    // bayad eslah shavad!
                  return const Icon(Icons.favorite_rounded,
                      color: Colors.redAccent);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
