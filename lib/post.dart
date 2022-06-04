import 'comment.dart';

class Post {
  String title, description, userName, community;
  int likes = 0, commentNum = 0;
  List<Comment> comments = [];
  DateTime time;
  bool isLiked = false, isDisLiked = false;

  Post(this.title, this.description, this.time, this.userName,
      this.community, this.comments);

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

  set setDateTime(DateTime date) {
    time = date;
  }

  // Method that calculate how much time is passed since the post was created
  String passedTime(DateTime date) {
    if (date.difference(time).inSeconds < 60) {
      return date.difference(time).inSeconds.toString() + " sec";
    } else if (date.difference(time).inMinutes < 60) {
      return date.difference(time).inMinutes.toString() + " min";
    } else if (date.difference(time).inHours < 24) {
      return date.difference(time).inHours.toString() + " hour";
    } else if (date.difference(time).inDays < 7) {
      return date.difference(time).inDays.toString() + " day";
    } else if (date.difference(time).inDays < 30) {
      return (date.difference(time).inDays ~/ 7).toString() + " week";
    } else if (date.difference(time).inDays < 365) {
      return (date.difference(time).inDays ~/ 30).toString() + " month";
    } else {
      return (date.difference(time).inDays ~/ 365).toString() + " year";
    }
  }

  set setTitle(String str) {
    title = str;
  }

  set setDescription(String value) {
    description = value;
  }
}
