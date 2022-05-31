import 'package:flutter/material.dart';
import 'Post.dart';

class PostDetails extends StatelessWidget {
   const PostDetails({Key? key, required this.post}) : super(key: key);

   final Post post;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Text(post.title),
        ),
      )
    );
  }
}
