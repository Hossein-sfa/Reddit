class Comment {
  int likes = 0, replyNum = 0;
  String ? description;
  bool isLiked = false, isDisLiked = false;
  DateTime time;
  List replies = [];

  Comment(this.description, this.time);

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
