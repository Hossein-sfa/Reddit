class Comment {
  int likes = 0, disLikes = 0, replyNum = 0;
  String ? description;
  DateTime time;
  List replies = [];

  Comment(this.likes, this.disLikes, this.replyNum, this.description, this.time);
}
