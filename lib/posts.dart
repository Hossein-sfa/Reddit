import 'post.dart';
import 'comment.dart';

class UserPosts {
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
  static List<Post> posts = [
    Post(
        "Test",
        'hello \n hi \n \n bye \n',
        DateTime(
          2000,
          10,
          19,
        ),
        'Hossein',
        'SBUuuuuuuu',
        c),
    Post("Test1", 'hello \n hi \n \n bye \n', DateTime(2022, 4), 'Hossein',
        'SBU', c1),
    Post("Test2", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 15), 'Hossein',
        'SBU', c2),
    Post("Test3", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 26), 'Hossein',
        'SBU', c),
    Post("Test4", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 31, 15),
        'Hossein', 'SBU', c1),
    Post("Test5", 'hello \n hi \n \n bye \n', DateTime(2022, 5, 31, 16, 48),
        'Hossein', 'SBU', c2),
    Post("Test6", 'hello \n hi \n \n bye \n', DateTime.now(), 'Hossein', 'SBU',
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
