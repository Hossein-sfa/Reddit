import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reddit/siginpage.dart';
import 'package:reddit/user%20detail.dart';
import 'package:reddit/userSetting.dart';
import 'CommunitiesCategory.dart';
import 'SearchPage.dart';
import 'Setting.dart';
import 'ToHome.dart';
import 'addCommunitie.dart';
import 'addPost.dart';

class CommunitiesDetailPage extends StatefulWidget {
  const CommunitiesDetailPage({Key? key}) : super(key: key);

  @override
  State<CommunitiesDetailPage> createState() => _CommunitiesDetailPage();
}

class _CommunitiesDetailPage extends State<CommunitiesDetailPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white38,
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
                    style:
                    (TextStyle(fontSize: 20, color: Colors.deepOrangeAccent)),
                    textAlign: TextAlign.left,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  foregroundImage:
                  const AssetImage('assets/images/circleAvatar.png'),
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
                  trailing:
                  const Icon(Icons.change_circle, color: Colors.blueAccent),
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
                  trailing: const Icon(Icons.add, color: Colors.green),
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
                  trailing: const Icon(Icons.settings, color: Colors.brown),
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
                  trailing: const Icon(Icons.power_settings_new, color: Colors.red),
                  onTap: () {
                    //ToDo => Go to login page and delete user data from mobile and send data to server
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const SignIn();
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CarouselSlider(
                      items: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                    ShowCommunitiesCategory(1),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            //padding: const EdgeInsets.all(40),
                            width: double.infinity,
                            //  height: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/sociaty.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.circle,
                                                  color: Colors.white, size: 17),
                                              Text(
                                                " Society & Life",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                    ShowCommunitiesCategory(2),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            //padding: const EdgeInsets.all(40),
                            width: double.infinity,
                            //  height: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/technology.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.circle,
                                                  color: Colors.white, size: 17),
                                              Text(
                                                " Technology",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                    ShowCommunitiesCategory(3),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            //padding: const EdgeInsets.all(40),
                            width: double.infinity,
                            //  height: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        boxShadow:  [
                                          BoxShadow(
                                              blurRadius: 22,
                                              spreadRadius: 10,
                                              offset: Offset(0, 7),
                                              color: Colors.grey),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/images/nature.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.circle,
                                                  color: Colors.white, size: 17),
                                              Text(
                                                " Nature & Animals",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                    ShowCommunitiesCategory(4),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            //  height: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/science_main.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.circle,
                                                  color: Colors.black, size: 17),
                                              Text(
                                                " Science",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                    ShowCommunitiesCategory(5),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            //padding: const EdgeInsets.all(40),
                            width: double.infinity,
                            //  height: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/Sp.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.circle,
                                                  color: Colors.white, size: 17),
                                              Text(
                                                " Sports",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                    ShowCommunitiesCategory(6),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            //padding: const EdgeInsets.all(40),
                            width: double.infinity,
                            //  height: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    child: Image.asset(
                                      "assets/images/movie.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.circle,
                                                  color: Colors.white, size: 17),
                                              Text(
                                                " Entertainments",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "All",
                        style: TextStyle(color: Colors.white60),
                      ),
                      IconButton(
                          onPressed: () {
                            _listTitlePressed();
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded,
                              size: 15, color: Colors.white60)),
                    ],
                  ),
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  // prevent to scroll it
                  shrinkWrap: true,
                  // we can scroll it just in list area
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      //Border:  BorderRadius.all(Radius.circular(15)),
                      decoration: const BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(
                                "assets/images/cover.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.person_outline_rounded,
                                        color: Colors.white60, size: 17),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      " r/ nasa",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),

                                const Text("Title",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    )),
                                const  SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "adad adwdwdd wdaedf frsfaea ffasa edada dsadjhdj jjjdjjsjdoad nsdajndjkdj sadsad dsad ",
                                  overflow: TextOverflow.ellipsis,
                                  //ToDo =  > implement it with short text of each communities
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
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
    if (_selectedIndex == 0) {
      // ToDo => if communities selected means push community page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const ToHome(
              //addNewPost: addTask,
              key: Key("navid"),
            );
          },
        ),
      );
    }
  }

  void _listTitlePressed() {
    //ToDo => open a list title of a subject of communities!
    //ToDo => select a title from page click!
  }
}
