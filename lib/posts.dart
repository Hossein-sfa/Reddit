import 'Post.dart';

class UserPosts {
  static List<Post> posts = [
    Post("Test", 'hello \n hi \n \n bye \n', 5, DateTime.now(), 'Hossein'),
    Post("Test", 'hello \n hi \n \n bye \n', 10, DateTime.now(), 'Hossein'),
    Post("Test", 'hello \n hi \n \n bye \n', 271, DateTime.now(), 'Hossein'),
    Post("Test", 'hello \n hi \n \n bye \n', 85689, DateTime.now(), 'Hossein')
  ];

  // method that add post and sort
  static addPost(Post post) {
    //ToDo => shamsi date & each post of per associations
    posts.add(post);
    posts.sort((b, a) => a.dateTime.compareTo(b.dateTime));
  }
}
