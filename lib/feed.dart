import 'package:flutter/material.dart';
import 'package:reddit/addPost.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);
  @override
  State<Feed> createState() => FeedState();
}

class FeedState extends State<Feed> {
  // index of the current page for bottom app bar
  int index = 0;

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
    return Material(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffff5d5d),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const AddPost(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          child: Padding(
            padding: const EdgeInsets.only(left : 15, right : 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: index == 0 ? const Color(0xc2fa0000) : null,
                  iconSize: 30,
                  icon: const Icon(Icons.home),
                  disabledColor: const Color(0xffff5d5d),
                  onPressed: () {},
                ),
                IconButton(
                  color: index == 1 ? const Color(0xc2fa0000) : null,
                  iconSize: 30,
                  icon: const Icon(Icons.group),
                  onPressed: () {
                    if (index != 1) {
                      setState(
                        () {
                          index = 1;
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const Feed(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                IconButton(
                  color: index == 2 ? const Color(0xc2fa0000) : null,
                  iconSize: 30,
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    if (index != 2) {
                      setState(
                        () {
                          index = 2;
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const Feed(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                IconButton(
                  color: index == 3 ? const Color(0xc2fa0000) : null,
                  iconSize: 30,
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    if (index != 3) {
                      setState(
                        () {
                          index = 3;
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const Feed(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                //const Spacer(),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(),
          ),
        ),
      ),
    );
  }
}
