import 'package:flutter/material.dart';
import 'Post.dart';
import 'posts.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        child: SizedBox(
          width: 50,
          child: Row(
            children: [
              Builder(builder: (context) {
                UserPosts.posts.remove(post);
                return const Icon(Icons.delete, color: Colors.red);
              }),
              Builder(builder: (context) {
                //post.setlike();    // bayad eslah shavad!
                return const Icon(Icons.monitor_heart_rounded,
                    color: Colors.red);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
