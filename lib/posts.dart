import 'post.dart';
import 'comment.dart';


class UserPosts {
  static List<Comment> c = [];
  static List<Post> posts = [
    Post(
        "Test",
        'hello \n hi \n \n bye \n',
        '2022-07-01 17:30:08.653',
        'Hossein',
        'SBUuuuuuuu',
        c),
    Post("Test3", 'hello \n hi \n \n bye \n', '2021-02-01 17:30:08.653', 'Hossein',
        'SBU', c),
    Post("Test6", 'hello \n hi \n \n bye \n', '2022-07-01 17:20:08.653', 'Hossein', 'SBU',
        [])
  ];

  // method that add post and sort
  static addPost(Post post) {
    //ToDo => each post of per associations
    posts.add(post);
    posts.sort((b, a) => a.time.compareTo(b.time));
  }

  // method that sort posts based on time
  static List<Post> getSortedPosts() {
    posts.sort((b, a) => a.time.compareTo(b.time));
    return posts;
  }
}

