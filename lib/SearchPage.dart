import 'package:flutter/material.dart';
import 'ToHome.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({required Key key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final TextEditingController Search = TextEditingController();         // text editing controller for save search text!
                                                                        //ToDo => implement and find searched text from lists
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF616161), //gray Design
        appBar: AppBar(
          actions: [
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return ToHome();     /// back to main page home from Search box!
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.keyboard_return_rounded),
                  color: const Color(0XFFFF5722),    /// deep orange
                )),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0X73000000),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: TextField(
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              controller: Search,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      Search.clear();     /// delete text field and renew it
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
              //onSubmitted: (searchValue) {
              //getSubredditsTitles(searchValue, globals.bearerToken!.bodyToken)
              //.then((value) => setState(() {                 //ToDo => implement body for auto complete search result
                                                               //ToDo => Linked associations list
              //       widget.searchResults = value;
              //}
            )),
          ),
        ));
  }
}
