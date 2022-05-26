import 'comment.dart';

class Post {
  String ? community, userNamePoster, text;
  DateTime ? date;
  int likes = 0, disLikes = 0, commentsNum = 0;
  List<Comment> comments = [];

  getSortedComments() {
    for (int j = 0; j < comments.length - 1; j++) {
      for (int i = 0; i < comments.length - j - 1; i++) {
        if (comments[i].likes< comments[i + 1].likes) {
          Comment temp = comments[i];
          comments[i] = comments[i + 1];
          comments[i + 1] = temp;
        }
      }
    }
    return comments;
  }
}