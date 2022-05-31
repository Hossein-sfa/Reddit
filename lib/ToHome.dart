import 'package:flutter/material.dart';
import 'feed.dart';
import 'SearchPage.dart';
import 'addPost.dart';
import 'posts.dart';

class ToHome extends StatefulWidget {
  const ToHome({Key? key}) : super(key: key);

  @override
  State<ToHome> createState() => ToDoListState();
}

class ToDoListState extends State<ToHome> {
  int _selectedIndex = 0;

  num length = UserPosts.posts.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0X73000000),
        title: const SizedBox(
          width: double.infinity,
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Reddit"),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const SearchPage(
                        key: Key("navid"),
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search_rounded)),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.menu_rounded)))
        ],
      ),
      body: const Feed(),
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
            return const AddPost(
              //addNewPost: addTask,
              key: Key("navid"),
            );
          },
        ),
      );
    }
  }
}
