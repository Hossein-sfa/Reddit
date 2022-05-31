import 'package:flutter/material.dart';
import 'package:reddit/posts.dart';

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
                leading: CircleAvatar(
                  backgroundColor: Colors.greenAccent[400],
                  radius: 100,
                  child: const Text(
                    'GeeksForGeeks',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ), //Text
                ),
                trailing: const Text(
                  "GFG",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("List item $index"),
              );
            },
          ),
        ),
      ),
    );
  }
}
