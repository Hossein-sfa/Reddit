import 'package:flutter/material.dart';
import 'post_details.dart';
import 'user.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({Key? key}) : super(key: key);
  @override
  State<SavedPosts> createState() => SavedPostsState();
}

class SavedPostsState extends State<SavedPosts> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text(
            "Saved Posts",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SafeArea(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: User.savedPosts.length,
            itemBuilder: (context, index) {
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
                            backgroundImage: AssetImage(
                              'assets/images/circleAvatar.png',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                User.savedPosts[index].userName,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                User.savedPosts[index].community,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            User.savedPosts[index].passedTime(DateTime.now()),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
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
                        User.savedPosts[index].title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7),
                      Text(User.savedPosts[index].description),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: User.savedPosts[index].isLiked
                                  ? Colors.deepOrange
                                  : null,
                            ),
                            onPressed: () {
                              // Todo : send liking and disliking to server in phase 2 project
                              setState(() {
                                if (User.savedPosts[index].isLiked == false) {
                                  User.savedPosts[index].setLike();
                                } else {
                                  User.savedPosts[index].setVoteLess();
                                }
                              });
                            },
                          ),
                          Text(User.savedPosts[index].likes.toString()),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              color: User.savedPosts[index].isDisLiked
                                  ? Colors.deepOrange
                                  : null,
                            ),
                            onPressed: () {
                              // Todo : send liking and disliking to server in phase 2 project
                              setState(() {
                                if (User.savedPosts[index].isDisLiked ==
                                    false) {
                                  User.savedPosts[index].setDisLike();
                                } else {
                                  User.savedPosts[index].setVoteLess();
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
                                      PostDetails(post: User.savedPosts[index]),
                                ),
                              );
                            },
                          ),
                          Text(User.savedPosts[index].comments.length
                              .toString()),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark_border,
                              color: User.isSaved(User.savedPosts[index])
                                  ? Colors.deepOrange
                                  : null,
                            ),
                            onPressed: () {
                              setState(() {
                                if (!User.isSaved(User.savedPosts[index])) {
                                  User.savedPosts.add(User.savedPosts[index]);
                                } else {
                                  User.savedPosts
                                      .remove(User.savedPosts[index]);
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
                      builder: (context) => PostDetails(
                        post: User.savedPosts[index],
                      ),
                    ),
                  );
                  setState(() {});
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
