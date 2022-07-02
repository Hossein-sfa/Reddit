import 'dart:io';

import 'package:flutter/material.dart';

class ShowCommunitiesCategory extends StatefulWidget {
  int catNum = 0;
  ShowCommunitiesCategory(this.catNum, {Key? key}) : super(key: key);
  @override
  State<ShowCommunitiesCategory> createState() =>
      _StateCommunitiesCategory(catNum);
}

class _StateCommunitiesCategory extends State<ShowCommunitiesCategory> {

  Future<String> getCommunity() async {
    await Socket.connect("192.168.1.34", 8080).then((serverSocket) {
      serverSocket.write(
          'getcommunities~${title}\u0000');
      serverSocket.flush();
      serverSocket.listen((socket) {
        setState(() {
          comustr = String.fromCharCodes(socket);
        });
      });
    });
    return comustr;
  }

  void splitCommunities(){
    var split = comustr.split("\n");
    count = split.length ;
    for (int i= 0 ; i<split.length ; i++) {
      var split2 = split[i].split("~");
      lst.add(split2[0]);
      lst.add(split2[2]);
      lst.add(split2[3]);
    }
  }
  int count = 0 ;
  List <String> lst = [];
  int catNum = 0;
  _StateCommunitiesCategory(this.catNum);
  String comustr = "";
  String name = "";
  String compic = "" ;
  String title = "";
  void _setter() {
    switch (catNum) {
      case 1:
        name = "assets/images/sociaty.jpg";
        compic = name ;
        title = "Society & Life";
        break;
      case 2:
        name = "assets/images/technology.jpg";
        compic = "assets/images/code.jpg";
        title = "Technology";
        break;
      case 3:
        name = "assets/images/nature.jpg";
        compic = "assets/images/lion.jpg";
        title = "Nature & Animals";
        break;
      case 4:
        name = "assets/images/science_main.jpg";
        compic = "assets/images/Science.jpg";
        title = "Science";
        break;
      case 5:
        name = "assets/images/Sp.jpg";
        compic = "assets/images/sport.png";
        title = "Sports";
        break;
      case 6:
        name = "assets/images/movie.jpg";
        compic = "assets/images/movie.jpg";
        title = "Entertainment";
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    _setter();
    getCommunity();
    splitCommunities();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: screenSize.height / 2.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(name),
                  fit: BoxFit.cover,
                ),
                // color: Colors.blue,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 10,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      icon: const Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 280,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: count,

                itemBuilder: (BuildContext context, int index) {
                  return ListView(
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
                                  compic,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Title",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "adad adwdwdd wdaedf frsfaea ffasa edada dsadjhdj jjjdjjsjdoad nsdajndjkdj sadsad dsad ",
                                    overflow: TextOverflow.ellipsis,
                                    //ToDo =  > implement it with short text of each communities
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                // prevent to scroll it
              ),
            ],
          ),
        ],
      ),
    );
  }
}
