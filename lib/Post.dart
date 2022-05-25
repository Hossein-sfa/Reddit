class Post {
  String _title;
  String _description;
  int _likes ;
  DateTime _dateTime ;
  Post( this._title , this._description , this._likes , this._dateTime);
  int get likes => _likes ;
  void setlike (){
    _likes ++;
  }

  DateTime get dateTime => _dateTime ;
  set setdateTime (DateTime date){
    _dateTime = date ; }

  String get title => _title;
  set setTitle (String str){
    _title = str ;
  }

  String get description => _description;
  set setDescription (String value){
    _description = value ;
  }
}