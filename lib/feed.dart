import 'package:flutter/material.dart';
import 'main.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: Row(
          children: const [],
        )),
        body: SafeArea(
          child: Center(
            child: Container(),
          ),
        ),
      ),
    );
  }
}
