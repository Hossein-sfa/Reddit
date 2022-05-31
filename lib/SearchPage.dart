import 'package:flutter/material.dart';
import 'ToHome.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  //final TabController _tabController = TabController(length: 3 , vsync: this);
  final TextEditingController search =
  TextEditingController(); // text editing controller for save search text!
  //ToDo => implement and find searched text from lists
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0XFF616161), //gray Design
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0X73000000),
            actions: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return const ToHome();

                            /// back to main page home from Search box!
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.keyboard_return_rounded),
                    color: const Color(0XFFFF5722),

                    /// deep orange
                  )),
            ],
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
                    controller: search,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            search.clear();

                            /// delete text field and renew it
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
            bottom: (
                //mainAxisAlignment: MainAxisAlignment.end,
                //children: const [
                const TabBar(tabs: [
                  Tab(
                    text: "Communities",
                  ),
                  Tab(
                    text: "Posts",
                  ),
                  Tab(
                    text: "People",
                  )
                ])
                //   ],
            ),
          ),
          body: (const TabBarView(
            children: [
              Communities(),
              Posts(),
              People(),
            ],
          )),
        ));
  }
}

class Communities extends StatefulWidget {
  const Communities({Key? key}) : super(key: key);

  @override
  State<Communities> createState() => CommunitiesSearchResult();
}

class CommunitiesSearchResult extends State<Communities>
    with AutomaticKeepAliveClientMixin<Communities> {
  int count = 10;

  void clear() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xB3FFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.group_rounded, size: 80),
            //ToDo => to sort Communities (association) result
            // Text('Total incoming calls: $count',
            //     style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => PostSearchResult();
}

class PostSearchResult extends State<Posts>
    with AutomaticKeepAliveClientMixin<Posts> {
  final items = List<String>.generate(1000, (i) => "Posts $i");

  /// 1000 posts list
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xB3FFFFFF), //gray Design
      body: Center(
        child: Icon(Icons.post_add, size: 80),
        /* itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
        ),
     */
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  State<People> createState() => PeopleSearchResult();
}

class PeopleSearchResult extends State<People>
    with AutomaticKeepAliveClientMixin<People> {
  final items = List<String>.generate(1000, (i) => "People $i");

  /// 1000 people user
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xB3FFFFFF),
      body: Center(
        child: Icon(Icons.people_alt_rounded, size: 80),
        /* child: ListView.builder(
          itemCount: items.length,               //ToDo => implement people search results there
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );

          },
        ),
     */
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
