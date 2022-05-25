import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Post.dart';

class AddPost extends StatefulWidget {
  const AddPost({required Key key, required this.addNewPost}) : super(key: key);
  final Function addNewPost;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late String title;

  late final TextEditingController titleC;
  late final TextEditingController body;
  late final DateTime time;

  @override
  void initState() {
    titleC = TextEditingController();
    body = TextEditingController();
    time = DateTime.now();
    super.initState();
  }

  void dispode() {
    titleC.dispose();

    /// make state to unusable state
    body.dispose();
    time.toString();
    super.dispose();
  }

  int _selectedIndex = 0;

  // const TextEditingController txt = TextEditingController();
  String str = "";
  static List<Widget> _pages = <Widget>[
    Center(),
    Center(
      child: Icon(
        Icons.add_a_photo,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.video_collection,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.link,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.poll,
        size: 150,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.next_plan,
              color: Colors.orangeAccent,
            ),
            onPressed: () {
              String title = titleC.text;
              String desc = body.text;
              DateTime datetime = time;
              Post post = Post(title, desc, 0, datetime);
              widget.addNewPost(post);
              titleC.clear();
              body.clear();
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text("Add Posts"),
        backgroundColor: Colors.black12,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedIconTheme:
            IconThemeData(color: Colors.deepOrangeAccent, size: 38),
        selectedItemColor: Colors.deepOrangeAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_link),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Poll',
          ),
        ],
        currentIndex: _selectedIndex,
        //New
        onTap: _onItemTapped,
      ),
      body: (10 < 20)
          ? Container(
              color: Colors.black26,
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: "Title", fillColor: Colors.grey),
                      controller: titleC,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextField(
                      decoration:
                          const InputDecoration(hintText: "Description"),
                      controller: body,
                    ),
                  ),
                ],
              ),
            )
          : IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
