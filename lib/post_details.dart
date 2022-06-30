import 'package:comment_tree/comment_tree.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:flutter/material.dart';
import 'comment.dart';
import 'post.dart';
import 'user.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  State<PostDetails> createState() => PostDetailsState();
}

class PostDetailsState extends State<PostDetails> {
  final TextEditingController comment = TextEditingController();
  bool commentChecker = false;
  List<CommentClass> comments = [];

  @override
  void initState() {
    super.initState();
    comments = widget.post.getSortedComments();

    // checks that comment is not empty
    comment.addListener(() {
      setState(() {
        if (comment.text.isNotEmpty) {
          commentChecker = true;
        } else {
          commentChecker = false;
        }
      });
    });
  }

  // set State comments when user adds comment
  refreshComments() {
    setState(() {
      comments = widget.post.getSortedComments();
    });
  }

  // format date for reading humans in shamsi
  jalaliFormat(Date date) =>
      '${date.formatter.yyyy}/${date.formatter.mm}/${date.formatter.dd}';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reddit'),
        ),
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
                            widget.post.userName,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            widget.post.community,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        jalaliFormat(Jalali.fromDateTime(widget.post.time)),
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
                            comments = widget.post.getSortedComments();
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
                            comments = widget.post.getSortedComments();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.mode_comment_outlined),
                        onPressed: () {},
                      ),
                      Text(widget.post.comments.length.toString()),
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
                  const Divider(thickness: 0.8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/circleAvatar.png'),
                      ),
                      title: TextFormField(
                        controller: comment,
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Add a comment: ',
                          labelStyle: TextStyle(color: Color(0xFFFFB34F)),
                          border: InputBorder.none,
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: commentChecker
                            ? () {
                                // ToDo : sending username and password to server in phase to project
                                widget.post.addComment(
                                  CommentClass(
                                    User.name,
                                    comment.text,
                                    DateTime.now(),
                                  ),
                                );
                                comment.clear();
                                refreshComments();
                              }
                            : null,
                        child: const Text(
                          'Post',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                    ),
                  ),
                  const Divider(thickness: 0.8),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
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
                                            'assets/images/circleAvatar.png',
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 4),
                                            Text(
                                              comments[index].userName,
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          comments[index].time.toString(),
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 22),
                                    Text(comments[index].description),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.thumb_up,
                                            color: comments[index].isLiked
                                                ? Colors.deepOrange
                                                : null,
                                          ),
                                          onPressed: () {
                                            // Todo : send liking and disliking to server in phase 2 project
                                            setState(() {
                                              if (comments[index].isLiked ==
                                                  false) {
                                                comments[index].setLike();
                                              } else {
                                                comments[index].setVoteLess();
                                              }
                                            });
                                          },
                                        ),
                                        Text(comments[index].likes.toString()),
                                        const SizedBox(width: 10),
                                        IconButton(
                                          icon: Icon(
                                            Icons.thumb_down,
                                            color: comments[index].isDisLiked
                                                ? Colors.deepOrange
                                                : null,
                                          ),
                                          onPressed: () {
                                            // Todo : send liking and disliking to server in phase 2 project
                                            setState(() {
                                              if (comments[index].isDisLiked ==
                                                  false) {
                                                comments[index].setDisLike();
                                              } else {
                                                widget.post.comments[index]
                                                    .setVoteLess();
                                              }
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.reply),
                                          onPressed: () {},
                                        ),
                                        Text(comments[index]
                                            .replies
                                            .length
                                            .toString()),
                                        const Spacer(),
                                        IconButton(
                                          icon: const Icon(Icons.share),
                                          onPressed: () {},
                                        ),
                                        const SizedBox(width: 10),
                                        IconButton(
                                          icon: const Icon(Icons.more_horiz),
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
