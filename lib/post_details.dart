import 'package:shamsi_date/shamsi_date.dart';
import 'package:flutter/material.dart';
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
                    return Expanded(
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(18),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                            ),),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
