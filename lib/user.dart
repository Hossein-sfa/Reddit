import 'post.dart';
import 'comment.dart';
import 'association.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'user.g.dart';

@JsonSerializable()
class User {
  static late String name;
  static late String _email;
  static late String _password;
  static late String _profilePic;
  static late List<association> associations;
  static late List<Comment> comments;
  static late List<String> _post;
  static late List<Post> savedPosts;
  static late List<User> _followers;
  static late List<User> _following;
  static late List<Post> _likedPosts;

  Map<String, dynamic> toJson() => _$UserToJson(this);
  String jsonUser = jsonEncode(User);

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
    _email = _email;
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

  void addFollower(User follower) {
    _followers.add(follower);
  }

  void addFollowing(User following) {
    _following.add(following);
  }
}
