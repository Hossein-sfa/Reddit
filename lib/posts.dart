import 'Post.dart';

class UserPosts {
  static List<Post> posts = [];

  // method that add post and sort
  static addPost(Post post) {
    //ToDo => shamsi date & each post of per associations
    posts.add(post);
    posts.sort((b, a) => a.dateTime.compareTo(b.dateTime));
  }
}