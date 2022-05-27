import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'Post.dart';
import 'addPost.dart';
import 'home.dart';

class ToHome extends StatefulWidget {
  @override
  State<ToHome> createState() => ToDoListState();
}

class ToDoListState extends State<ToHome> {
  List<Post> tasksList = [];

  void addTask(Post post) {
    setState(() {
      tasksList.add(post);                //ToDo => shamsi date & each post of per associations
      tasksList.sort((b, a) => a.dateTime!.compareTo(b.dateTime!));     // sort posts by time
    });
  }

  void deleteTask(Post post) {
    setState(() {                  //ToDo => For delete post
      tasksList.remove(Post);
    });
  }

  int _selectedIndex = 0;

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
            )),
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
      body: Container(
        child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (contex, index) {
            return TaskItem(post: tasksList[index], TodoList: ToDoListState());
          },
        ),
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
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {           // ToDo => if + selected means add post so push add post page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return AddPost(
              addNewPost: addTask,
              key: Key("navid"),
            );
          },
        ),
      );
    }
  }
}
