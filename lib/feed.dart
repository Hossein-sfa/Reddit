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
                title: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/circleAvatar.png'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                UserPosts.posts[index].userName,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                UserPosts.posts[index].community,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            UserPosts.posts[index].passedTime(DateTime.now()),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        UserPosts.posts[index].title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7),
                      Text(UserPosts.posts[index].description),
                      Row(
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up,
                                color: UserPosts.posts[index].isLiked
                                    ? Colors.deepOrange
                                    : null),
                            onPressed: () {
                              // Todo : send liking and disliking to server in phase 2 project
                              setState(() {
                                if (UserPosts.posts[index].isLiked == false) {
                                  UserPosts.posts[index].setLike();
                                }
                                else {
                                  UserPosts.posts[index].setVoteLess();
                                }

                              });
                            },
                          ),
                          Text(UserPosts.posts[index].likes.toString()),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.thumb_down,
                                color: UserPosts.posts[index].isDisLiked
                                    ? Colors.deepOrange
                                    : null),
                            onPressed: () {
                              // Todo : send liking and disliking to server in phase 2 project
                              setState(() {
                                if (UserPosts.posts[index].isDisLiked == false) {
                                  UserPosts.posts[index].setDisLike();
                                }
                                else {
                                  UserPosts.posts[index].setVoteLess();
                                }
                              });
                            },
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
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
