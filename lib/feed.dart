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
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/circleAvatar.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              UserPosts.posts[index].userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              UserPosts.posts[index].community,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.thumb_up), onPressed: () {},)
                      ],
                    ),
                  ],
                ),

                // leading: const CircleAvatar(
                //   backgroundImage: AssetImage('assets/images/circleAvatar.png'),
                // ),
                // trailing:
                //     Text(UserPosts.posts[index].passedTime(DateTime.now())),
                // title: Text(UserPosts.posts[index].userName),
                // subtitle: Text(UserPosts.posts[index].community),

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
