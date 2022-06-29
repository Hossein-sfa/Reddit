import 'post.dart';
import 'comment.dart';
import 'association.dart';

class User {
  static late String name;
  static late String _email;
  static late String _password;
  static late String _profilePic;
  //late List<association> _association;
  static List<Comment> c = [
    Comment('hossein', 'comment1 test\nhello nyr good google', DateTime.now()),
    Comment('navid', 'comment2 test\nhello nyr good google', DateTime.now()),
    Comment('mamad', 'comment3 test\nhello nyr good google', DateTime.now())
  ];
  static List<Comment> c1 = [
    Comment('hossein', 'comment1 test\nhello nyr good google', DateTime.now()),
    Comment('navid', 'comment2 test\nhello nyr good google', DateTime.now()),
    Comment('mamad', 'comment3 test\nhello nyr good google', DateTime.now())
  ];
  static List<Comment> c2 = [
    Comment('hossein', 'comment1 test\nhello nyr good google', DateTime.now()),
    Comment('navid', 'comment2 test\nhello nyr good google', DateTime.now()),
    Comment('mamad', 'comment3 test\nhello nyr good google', DateTime.now())
  ];
  static late List<String> _post;
  static List<Post> savedPosts = [
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 4), 'Hossein',
        'SBU', c),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 15), 'Hossein',
        'SBU', c1),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 31, 15),
        'Hossein', 'SBU', c2),
    Post("Test", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 31, 16, 48),
        'Hossein', 'SBU', c),
  ];
  static late List<String> _followers;
  static late List<String> _following;
  List<Post> tasksList = [];
  //static List<association> communities = [association('first fav community', '', 'hossein'), association('second fav community', '', 'hossein'), association('third fav community', '', 'hossein'), association('fourth fav community', '', 'hossein'), association('fifth fav community', '', 'hossein'), association('sixth fav community', '', 'hossein'), association('seventh fav community', '', 'hossein')];
  //static List<association> favCommunities = [association('first community', '', 'hossein'), association('second community', '', 'hossein'), association('third community', '', 'hossein'), association('fourth community', '', 'hossein'), association('fifth community', '', 'hossein'), association('sixth community', '', 'hossein'), association('seventh community', '', 'hossein'), association('eighth community', 'fgggdsgdgdsfgsgsdg', 'hossein'), association('ninth community', '', 'hossein'), association('tenth community', '', 'hossein')];

  static bool isSaved(Post post) {
    for (Post p in savedPosts) {
      if (p.title == post.title && p.description == post.description) {
        return true;
      }
    }
    return false;
  }

  static remove(Post post) {
    for (Post p in savedPosts) {
      if (p.title == post.title && p.description == post.description) {
        savedPosts.remove(p);
        break;
      }
    }
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
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
