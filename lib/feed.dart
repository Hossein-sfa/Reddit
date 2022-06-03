import 'package:flutter/material.dart';
import 'posts.dart';
import 'post_details.dart';
import 'user.dart';

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
                              const SizedBox(height: 4),
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
                          IconButton(
                            icon: const Icon(
                              Icons.more_horiz,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        UserPosts.posts[index].title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7),
                      Text(UserPosts.posts[index].description),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: UserPosts.posts[index].isLiked
                                  ? Colors.deepOrange
                                  : null,
                            ),
                            onPressed: () {
                              // Todo : send liking and disliking to server in phase 2 project
                              setState(() {
                                if (UserPosts.posts[index].isLiked == false) {
                                  UserPosts.posts[index].setLike();
                                } else {
                                  UserPosts.posts[index].setVoteLess();
                                }
                              });
                            },
                          ),
                          Text(UserPosts.posts[index].likes.toString()),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              color: UserPosts.posts[index].isDisLiked
                                  ? Colors.deepOrange
                                  : null,
                            ),
                            onPressed: () {
                              // Todo : send liking and disliking to server in phase 2 project
                              setState(() {
                                if (UserPosts.posts[index].isDisLiked ==
                                    false) {
                                  UserPosts.posts[index].setDisLike();
                                } else {
                                  UserPosts.posts[index].setVoteLess();
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.mode_comment_outlined),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PostDetails(post: UserPosts.posts[index]),
                                ),
                              );
                            },
                          ),
                          Text(UserPosts.posts[index].comments.toString()),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark_border,
                              color: User.isSaved(UserPosts.posts[index])
                                  ? Colors.deepOrange
                                  : null,
                            ),
                            onPressed: () {
                              setState(() {
                                if (!User.isSaved(UserPosts.posts[index])) {
                                  User.savedPosts.add(UserPosts.posts[index]);
                                } else {
                                  User.savedPosts
                                      .remove(UserPosts.posts[index]);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
