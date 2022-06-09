import 'package:flutter/material.dart';
import 'association.dart';
import 'main.dart';
import 'post.dart';
import 'posts.dart';

class CommunityDetails extends StatefulWidget {
  CommunityDetails({Key? key, required this.community}) : super(key: key);
  final Post post = Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 4),
      'Hossein', 'SBU', []);

  final association community;

  @override
  State<CommunityDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<CommunityDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBars.reddit,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
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
                            widget.community.associationName,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            widget.community.memberCount.toString() +
                                ' members',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        child: const Text(
                          'join',
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.community.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 7),
                  Text(widget.community.description),
                  // Row(
                  //   children: [
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.thumb_up,
                  //         color: widget.post.isLiked ? Colors.deepOrange : null,
                  //       ),
                  //       onPressed: () {
                  //         // Todo : send liking and disliking to server in phase 2 project
                  //         setState(() {
                  //           if (widget.post.isLiked == false) {
                  //             widget.post.setLike();
                  //           } else {
                  //             widget.post.setVoteLess();
                  //           }
                  //         });
                  //       },
                  //     ),
                  //     Text(widget.post.likes.toString()),
                  //     const SizedBox(width: 10),
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.thumb_down,
                  //         color:
                  //             widget.post.isDisLiked ? Colors.deepOrange : null,
                  //       ),
                  //       onPressed: () {
                  //         // Todo : send liking and disliking to server in phase 2 project
                  //         setState(() {
                  //           if (widget.post.isDisLiked == false) {
                  //             widget.post.setDisLike();
                  //           } else {
                  //             widget.post.setVoteLess();
                  //           }
                  //         });
                  //       },
                  //     ),
                  //     IconButton(
                  //       icon: const Icon(Icons.mode_comment_outlined),
                  //       onPressed: () {},
                  //     ),
                  //     Text(widget.post.commentNum.toString()),
                  //     const Spacer(),
                  //     IconButton(
                  //       icon: const Icon(Icons.share),
                  //       onPressed: () {},
                  //     ),
                  //     const SizedBox(width: 10),
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.bookmark_border,
                  //         color: User.isSaved(widget.post)
                  //             ? Colors.deepOrange
                  //             : null,
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           if (!User.isSaved(widget.post)) {
                  //             User.savedPosts.add(widget.post);
                  //           } else {
                  //             User.savedPosts.remove(widget.post);
                  //           }
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // ),
                  const Divider(
                    thickness: 0.8,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: UserPosts.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/circleAvatar.png'),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          UserPosts.posts[index].userName,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                                const SizedBox(height: 15),
                                Text(
                                  UserPosts.posts[index].title,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 7),
                                Text(UserPosts.posts[index].description),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color:
                                        UserPosts.posts[index].comments[index].isLiked
                                                ? Colors.deepOrange
                                                : null,
                                      ),
                                      onPressed: () {
                                        // Todo : send liking and disliking to server in phase 2 project
                                        setState(() {
                                          if (UserPosts.posts[index].comments[index]
                                                  .isLiked ==
                                              false) {
                                            UserPosts.posts[index].comments[index]
                                                .setLike();
                                          } else {
                                            UserPosts.posts[index].comments[index]
                                                .setVoteLess();
                                          }
                                        });
                                      },
                                    ),
                                    Text(UserPosts.posts[index].comments[index].likes
                                        .toString()),
                                    const SizedBox(width: 10),
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_down,
                                        color: UserPosts.posts[index].comments[index].isDisLiked
                                            ? Colors.deepOrange
                                            : null,
                                      ),
                                      onPressed: () {
                                        // Todo : send liking and disliking to server in phase 2 project
                                        setState(() {
                                          if (UserPosts.posts[index].comments[index]
                                                  .isDisLiked ==
                                              false) {
                                            UserPosts.posts[index].comments[index]
                                                .setDisLike();
                                          } else {
                                            UserPosts.posts[index].comments[index]
                                                .setVoteLess();
                                          }
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.reply,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(UserPosts.posts[index].commentNum.toString()),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.share),
                                      onPressed: () {},
                                    ),
                                    const SizedBox(width: 10),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.more_horiz,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
