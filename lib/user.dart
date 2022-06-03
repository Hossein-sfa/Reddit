import 'Post.dart';
class User {
  static late String _name;
  static late String _email;
  static late String _password;
  static late String _username;
  static late String _profilePic;
  //late List<association> _association;
  static late List<String> _post;
  static List<Post> savedPosts = [];
  static late List<String> _followers;
  static late List<String> _following;
  List<Post> tasksList = [];

  static bool isSaved(post) {
    if (savedPosts.contains(post)) {
      return true;
    }
    return false;
  }

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
