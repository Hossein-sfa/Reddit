import 'Post.dart';

class user {
  late String _name;
  late String _email;
  late String _password;
  late String _username;
  late String _profilePic;
  //late List<association> _association;
  late List<String> _post;
  late List<String> _save ;
  late List<String> _followers;
  late List<String> _following;
  List<Post> tasksList = [];

  void setName(String name) {
    _name = name;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setUsername(String username) {
    _username = username;
  }

  void setProfilePic(String profilePic) {
    _profilePic = profilePic;
  }

  void addPost(String post) {
    _post.add(post);
  }

  void addFollower(String follower) {
    _followers.add(follower);
  }

  void addFollowing(String following) {
    _following.add(following);
  }

}
