import 'package:json_annotation/json_annotation.dart';
import 'comment.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
//part 'post.g.dart';

//@JsonSerializable()
class Post {
  String title, description, userName, community;
  int likes = 0;
  List<Comment> comments;
  String time = DateFormat('2022-07-01 17:30:08.653').format(DateTime.now());
  bool isLiked = false, isDisLiked = false;

  Post(this.title, this.description, this.time, this.userName, this.community,
      this.comments);

/*
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
  String json = jsonEncode(Post);

  String getJson() {
    return json;
  }
*/
  setLike() {
    if (isDisLiked) {
      isDisLiked = false;
      likes += 2;
    } else {
      likes++;
    }
    isLiked = true;
  }

  DateTime getTime(String time) {
    return DateTime.parse(time);
  }

  setVoteLess() {
    if (isLiked) {
      likes--;
      isLiked = false;
    } else if (isDisLiked) {
      likes++;
      isDisLiked = false;
    }
  }

  setDisLike() {
    if (isLiked) {
      isLiked = false;
      likes -= 2;
    } else {
      likes--;
    }
    isDisLiked = true;
  }

  // Method that calculate how much time is passed since the post was created
  String passedTime(DateTime date) {
    if (date.difference(getTime(time)).inSeconds < 60) {
      return date.difference(getTime(time)).inSeconds.toString() + " sec";
    } else if (date.difference(getTime(time)).inMinutes < 60) {
      return date.difference(getTime(time)).inMinutes.toString() + " min";
    } else if (date.difference(getTime(time)).inHours < 24) {
      return date.difference(getTime(time)).inHours.toString() + " hour";
    } else if (date.difference(getTime(time)).inDays < 7) {
      return date.difference(getTime(time)).inDays.toString() + " day";
    } else if (date.difference(getTime(time)).inDays < 30) {
      return (date.difference(getTime(time)).inDays ~/ 7).toString() + " week";
    } else if (date.difference(getTime(time)).inDays < 365) {
      return (date.difference(getTime(time)).inDays ~/ 30).toString() +
          " month";
    } else {
      return (date.difference(getTime(time)).inDays ~/ 365).toString() +
          " year";
    }
  }

  List<Comment> getSortedComments() {
    comments.sort((b, a) => a.likes.compareTo(b.likes));
    return comments;
  }

  addComment(comment) {
    comments.add(comment);
  }
}
