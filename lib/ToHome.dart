import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit/post_details.dart';
import 'package:reddit/posts.dart';
import 'package:reddit/siginpage.dart';
import 'package:reddit/user%20detail.dart';
import 'package:reddit/user.dart';
import 'package:reddit/userSetting.dart';
import 'Post.dart';
import 'SearchPage.dart';
import 'Setting.dart';
import 'addCommunitie.dart';
import 'addPost.dart';

class ToHome extends StatefulWidget {
  const ToHome({Key? key}) : super(key: key);

  @override
  State<ToHome> createState() => homeState();
}

class homeState extends State<ToHome> {
  List<Post> tasksList = [];  //this is a temp list!!

  void addTask(Post post) {
    setState(() {
      tasksList.add(post); //ToDo => shamsi date & each post of per associations
     // sort posts by time
    });
  }

  void deleteTask(Post post) {
    setState(() {
      //ToDo => For delete post
      tasksList.remove(Post);
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xB3FFFFFF), // gray
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black45,
                image: DecorationImage(
                  image: AssetImage('assets/images/profiledesign.jfif'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Text(
                'Menu',
                style: (TextStyle(fontSize: 20, color: Colors.deepOrangeAccent)),
                textAlign: TextAlign.left,
              ),
            ),
            CircleAvatar(
              radius: 30,
              foregroundImage: const AssetImage('assets/images/circleAvatar.png'),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const userDetail();
                      },
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: const Text("Change user profile"),
              trailing: const Icon(Icons.change_circle , color: Colors.blueAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const UserSetting(key: Key('userSetting'));
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Most Viewed Community"),
              trailing: const Icon(Icons.launch),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Add Community"),
              trailing: const Icon(Icons.add , color: Colors.green),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return CreatProfile(key: UniqueKey());
                    },
                  ),
                );
              },
            ),
            ListTile(

              title: const Text("Settings"),
              trailing: const Icon(Icons.settings , color: Colors.brown),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return Setting(key: UniqueKey());
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Logout"),
              trailing: const Icon(Icons.power_settings_new , color: Colors.red),
              onTap: () {
                //ToDo => Go to login page and delete user data from mobile and send data to server
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return  const SignIn (
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: const Color(0X73000000),
        title: const SizedBox(
            width: double.infinity,
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Reddit"),
            )),
        actions: [
          // Go to Search Page
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const SearchPage(
                        key: Key("Search page"),
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search_rounded)),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const Setting(
                            key: Key("About us"),
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings)))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        selectedFontSize: 18,
        selectedIconTheme:
        const IconThemeData(color: Colors.orangeAccent, size: 22),
        selectedItemColor: Colors.orangeAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.group_rounded),
            label: "Association",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.add),
            label: "Add",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.chat_bubble),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(Icons.inbox),
            label: "Inbox",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: UserPosts.posts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/circleAvatar.png'),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              UserPosts.posts[index].userName,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              UserPosts.posts[index].community,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          UserPosts.posts[index].passedTime(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 10,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_horiz,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      UserPosts.posts[index].title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 7),
                    Text(UserPosts.posts[index].description),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: UserPosts.posts[index].isLiked
                                ? Colors.deepOrange
                                : null,
                          ),
                          onPressed: () {
                            // Todo : send liking and disliking to server in phase 2 project
                            setState(() {
                              if (UserPosts.posts[index].isLiked == false) {
                                UserPosts.posts[index].setLike();
                              } else {
                                UserPosts.posts[index].setVoteLess();
                              }
                            });
                          },
                        ),
                        Text(UserPosts.posts[index].likes.toString()),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: UserPosts.posts[index].isDisLiked
                                ? Colors.deepOrange
                                : null,
                          ),
                          onPressed: () {
                            // Todo : send liking and disliking to server in phase 2 project
                            setState(() {
                              if (UserPosts.posts[index].isDisLiked ==
                                  false) {
                                UserPosts.posts[index].setDisLike();
                              } else {
                                UserPosts.posts[index].setVoteLess();
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.mode_comment_outlined),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostDetails(post: UserPosts.posts[index]),
                              ),
                            );
                          },
                        ),
                        Text(UserPosts.posts[index].commentNum.toString()),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.bookmark_border,
                            color: User.isSaved(UserPosts.posts[index])
                                ? Colors.deepOrange
                                : null,
                          ),
                          onPressed: () {
                            setState(() {
                              if (!User.isSaved(UserPosts.posts[index])) {
                                User.savedPosts.add(UserPosts.posts[index]);
                              } else {
                                User.savedPosts
                                    .remove(UserPosts.posts[index]);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PostDetails(post: UserPosts.posts[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {
      // ToDo => if + selected means add post so push add post page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return AddPost(
              //addNewPost: addTask,
              key: const Key("navid"),
            );
          },
        ),
      );
    }
  }
}
