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
        appBar: AppBar(
          title: const Text(
            "Reddit",
            style: TextStyle(fontSize: 20),
          ),
        ),
        drawer: const Drawer(),
        body: SafeArea(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: UserPosts.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/circleAvatar.png'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      //mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          UserPosts.posts[index].userName,
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              UserPosts.posts[index].community,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // leading: SizedBox(
                //   width: 100,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Expanded(
                //         child: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const CircleAvatar(
                //               backgroundImage: AssetImage(
                //                   'assets/images/circleAvatar.png'),
                //             ),
                //             Expanded(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     UserPosts.posts[index].userName,
                //                     style: const TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 15,
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 5,
                //                   ),
                //                   Text(
                //                     UserPosts.posts[index].community,
                //                     textAlign: TextAlign.left,
                //                     style: TextStyle(
                //                       fontSize: 13,
                //                       color: Colors.white.withOpacity(0.8),
                //                     ),
                //                   ),
                //                   const SizedBox(
                //                     height: 5,
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       Expanded(
                //         child: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             IconButton(
                //               icon: const Icon(Icons.thumb_up),
                //               onPressed: () {},
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // title: Text(
                //   UserPosts.posts[index].title,
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
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
