class Post {
  String title,description, userName;
  int _likes ;
  DateTime _dateTime ;

  Post( this.title , this.description , this._likes , this._dateTime, this.userName);

  int get likes => _likes ;
  void setLike (){
    _likes ++;
  }

  DateTime get dateTime => _dateTime ;
  set setDateTime (DateTime date){
    _dateTime = date ;
  }

  set setTitle (String str){
    title = str ;
  }

  set setDescription (String value){
    description = value ;
  }
}