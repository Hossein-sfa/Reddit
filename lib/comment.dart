import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part  'comment.g.dart';

@JsonSerializable()
class Comment {
  int likes = 0;
  String userName, description;
  bool isLiked = false, isDisLiked = false;
  DateTime time;
  List replies = [];

  Comment(this.userName, this.description, this.time);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
  String json = jsonEncode(Comment);

  setLike() {
    if (isDisLiked) {
      isDisLiked = false;
      likes += 2;
    }
    else {
      likes++;
    }
    isLiked = true;
  }

  setVoteLess() {
    if (isLiked) {
      likes--;
      isLiked = false;
    }
    else if (isDisLiked) {
      likes++;
      isDisLiked = false;
    }
  }

  setDisLike() {
    if (isLiked) {
      isLiked = false;
      likes -= 2;
    }
    else {
      likes--;
    }
    isDisLiked = true;
  }
}
