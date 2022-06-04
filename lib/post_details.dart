import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:comment_box/comment/comment.dart';
import 'main.dart';
import 'post.dart';
import 'user.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final TextEditingController comment = TextEditingController();

  // format date for reading humans in shamsi
  jalaliFormat(Date date) {
    return '${date.formatter.yyyy}/${date.formatter.mm}/${date.formatter.dd}';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBars.reddit,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                            widget.post.userName,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            widget.post.community,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        jalaliFormat(Jalali.fromDateTime(widget.post.time)),
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
                    widget.post.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 7),
                  Text(widget.post.description),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: widget.post.isLiked ? Colors.deepOrange : null,
                        ),
                        onPressed: () {
                          // Todo : send liking and disliking to server in phase 2 project
                          setState(() {
                            if (widget.post.isLiked == false) {
                              widget.post.setLike();
                            } else {
                              widget.post.setVoteLess();
                            }
                          });
                        },
                      ),
                      Text(widget.post.likes.toString()),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          color:
                              widget.post.isDisLiked ? Colors.deepOrange : null,
                        ),
                        onPressed: () {
                          // Todo : send liking and disliking to server in phase 2 project
                          setState(() {
                            if (widget.post.isDisLiked == false) {
                              widget.post.setDisLike();
                            } else {
                              widget.post.setVoteLess();
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.mode_comment_outlined),
                        onPressed: () {},
                      ),
                      Text(widget.post.commentNum.toString()),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          color: User.isSaved(widget.post)
                              ? Colors.deepOrange
                              : null,
                        ),
                        onPressed: () {
                          setState(() {
                            if (!User.isSaved(widget.post)) {
                              User.savedPosts.add(widget.post);
                            } else {
                              User.savedPosts.remove(widget.post);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.post.comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: SizedBox(
                          //width: MediaQuery.of(context).size.width - 50,
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
                                          widget.post.userName,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      widget.post.passedTime(DateTime.now()),
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  widget.post.title,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 7),
                                Text(widget.post.description),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color:
                                            widget.post.comments[index].isLiked
                                                ? Colors.deepOrange
                                                : null,
                                      ),
                                      onPressed: () {
                                        // Todo : send liking and disliking to server in phase 2 project
                                        setState(() {
                                          if (widget.post.comments[index]
                                                  .isLiked ==
                                              false) {
                                            widget.post.comments[index]
                                                .setLike();
                                          } else {
                                            widget.post.comments[index]
                                                .setVoteLess();
                                          }
                                        });
                                      },
                                    ),
                                    Text(widget.post.comments[index].likes
                                        .toString()),
                                    const SizedBox(width: 10),
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_down,
                                        color: widget
                                                .post.comments[index].isDisLiked
                                            ? Colors.deepOrange
                                            : null,
                                      ),
                                      onPressed: () {
                                        // Todo : send liking and disliking to server in phase 2 project
                                        setState(() {
                                          if (widget.post.comments[index]
                                                  .isDisLiked ==
                                              false) {
                                            widget.post.comments[index]
                                                .setDisLike();
                                          } else {
                                            widget.post.comments[index]
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
                                    Text(widget.post.commentNum.toString()),
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
        // bottomNavigationBar: BottomNavigationBar(
        //   items: <BottomNavigationBarItem> [
        //     CommentBox(
        //       userImage:
        //       'assets/images/circleAvatar.png',
        //       child: commentChild(filedata),
        //       labelText: 'Write a comment...',
        //       withBorder: false,
        //       errorText: 'Comment cannot be blank',
        //       sendButtonMethod: () {
        //         if (formKey.currentState.validate()) {
        //           setState(() {
        //             var value = {
        //               'name': 'New User',
        //               'pic':
        //               'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
        //               'message': comment.text
        //             };
        //             filedata.insert(0, value);
        //           });
        //           comment.clear();
        //           FocusScope.of(context).unfocus();
        //         }
        //       },
        //       formKey: formKey,
        //       commentController: comment,
        //       backgroundColor: Colors.black,
        //       textColor: Colors.white,
        //       sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
        //     ),
        //   ],
        //),
    ),
    );
  }
}
