import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter/material.dart';
import 'posts.dart';
import 'post.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);
  @override
  State<AddPost> createState() => AddPostState();
}

class AddPostState extends State<AddPost> {
  late String title;
  late final TextEditingController titleC;
  late final TextEditingController body;
  late final DateTime time;

  @override
  void initState() {
    titleC = TextEditingController();
    body = TextEditingController();
    time = DateTime.now();
    titleC.text = "";
    body.text = "";
    super.initState();
  }

  @override
  void dispose() {
    titleC.dispose();
    body.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
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
        Icons.keyboard_voice,
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
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.next_plan,
              color: Colors.deepOrangeAccent,
            ),
            onPressed: () {
              if (titleC.text != "" && body.text != "" && _selectedIndex == 0) {
                String title = titleC.text;
                String desc = body.text;
                String datetime =  DateFormat('2022-07-01 17:30:08.653').format(time);
                Post post = Post(title, desc, datetime, 'hossein', 'SBU' , []);
                UserPosts.addPost(post);
                titleC.clear();
                body.clear();
                Navigator.pop(context);
              } else if (_selectedIndex == 1) {
                MotionToast.error(
                  title: const Text("Error"),
                  description:
                  const Text("Please insert your interesting images!"),
                ).show(context);
              } else if (_selectedIndex == 0) {
                MotionToast.error(
                  title: const Text("Error"),
                  description: const Text(
                      "Please fill interesting title and text body!"),
                ).show(context);
              } else if (_selectedIndex == 2) {
                MotionToast.error(
                  title: const Text("Error"),
                  description:
                  const Text("Please insert your interesting videos!"),
                ).show(context);
              } else if (_selectedIndex == 3) {
                MotionToast.error(
                  title: const Text("Error"),
                  description: const Text("Please attach a link!"),
                ).show(context);
              } else if (_selectedIndex == 4) {
                MotionToast.error(
                  title: const Text("Error"),
                  description: const Text("Please insert voice or music!"),
                ).show(context);
              } else if (_selectedIndex == 5) {
                MotionToast.error(
                  title: const Text("Error"),
                  description: const Text("Please add a poll!"),
                ).show(context);
              }
            },
          ),
        ],
        title: const Text("Add Post"),
        backgroundColor: Colors.black54,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        selectedFontSize: 18,
        selectedIconTheme:
        const IconThemeData(color: Colors.deepOrangeAccent, size: 22),
        selectedItemColor: Colors.deepOrangeAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.image),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.video_collection),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.add_link),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.keyboard_voice),
            label: 'Voice',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.poll),
            label: 'Poll',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: (_selectedIndex == 0)
          ? Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bkg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        //  color: Colors.black26,
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "An interesting title"),
                controller: titleC,
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: 150,
              child: TextField(
                decoration: const InputDecoration(hintText: "Text Body"),
                controller: body,
                keyboardType: TextInputType.multiline,
                minLines: 10,
                maxLines: null,
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
