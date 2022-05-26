import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

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
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                disabledColor: const Color(0xffff5d5d),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.group),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
              //const Spacer(),
            ],
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
