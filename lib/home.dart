import 'package:flutter/material.dart';
import 'post.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.post}) : super(key: key);

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
                post.setLike(); // bayad eslah shavad!
                return const Icon(Icons.favorite_rounded,
                    color: Colors.redAccent);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
