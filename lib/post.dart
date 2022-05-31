class Post {
  String title,description, userName, community;
  int _likes ;
  DateTime time;

  Post(this.title, this.description , this._likes, this.time, this.userName, this.community);

  int get likes => _likes ;
  void setLike (){
    _likes ++;
  }

  set setDateTime (DateTime date){
    time = date ;
  }

  // Method that calculate how much time is passed since the post was created
  String passedTime(DateTime date) {
    if (date.difference(time).inSeconds < 60) {
      return date.difference(time).inSeconds.toString() + " sec";
    } else if (date.difference(time).inMinutes < 60) {
      return date.difference(time).inMinutes.toString() + " mi";
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
  set setTitle (String str){
    title = str ;
  }

  set setDescription (String value){
    description = value ;
  }
}