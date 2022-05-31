import 'package:flutter/material.dart';
import 'posts.dart';
import 'post_details.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => FeedState();
}

class FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: UserPosts.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const CircleAvatar(
                  foregroundImage: AssetImage('assets/images/circleAvatar.png'),
                ),
                trailing:
                    Text(UserPosts.posts[index].passedTime(DateTime.now())),
                title: Text(UserPosts.posts[index].userName),
                subtitle: Text(UserPosts.posts[index].community),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PostDetails(post: UserPosts.posts[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
