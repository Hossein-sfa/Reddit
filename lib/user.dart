import 'post.dart';
import 'association.dart';

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
  //static List<association> communities = [association('first fav community', '', 'hossein'), association('second fav community', '', 'hossein'), association('third fav community', '', 'hossein'), association('fourth fav community', '', 'hossein'), association('fifth fav community', '', 'hossein'), association('sixth fav community', '', 'hossein'), association('seventh fav community', '', 'hossein')];
  //static List<association> favCommunities = [association('first community', '', 'hossein'), association('second community', '', 'hossein'), association('third community', '', 'hossein'), association('fourth community', '', 'hossein'), association('fifth community', '', 'hossein'), association('sixth community', '', 'hossein'), association('seventh community', '', 'hossein'), association('eighth community', 'fgggdsgdgdsfgsgsdg', 'hossein'), association('ninth community', '', 'hossein'), association('tenth community', '', 'hossein')];

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
