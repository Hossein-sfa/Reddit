import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;

class ShowCommunitiesCategory extends StatefulWidget {
  int catNum = 0 ;
  ShowCommunitiesCategory(this.catNum , {Key? key}) : super(key: key);
  @override
  State<ShowCommunitiesCategory> createState() => _StateCommunitiesCategory(catNum);
}

class _StateCommunitiesCategory extends State<ShowCommunitiesCategory> {
  int catNum = 0;
  _StateCommunitiesCategory(this.catNum);
  String name = "" ;
  String title = "" ;
  void _setter(){
    switch(catNum){
      case 1:
        name = "assets/images/sociaty.jpg";
        title = "Society & Life" ;
        break ;
      case 2:
        name = "assets/images/code.jpg";
        title = "Technology" ;
        break ;
      case 3:
        name = "assets/images/nature.jpg";
        title = "Nature & Animals" ;
        break ;
      case 4:
        name = "assets/images/science_main.jpg";
        title = "Science" ;
        break ;
      case 5:
        name = "assets/images/Sp.jpg";
        title = "Sports" ;
        break ;
      case 6:
        name = "assets/images/movie.jpg";
        title = "Entertainment" ;
        break ;
    }
  }
  @override
  Widget build(BuildContext context) {
    _setter();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Stack(
        children:[
          SizedBox(
            width: double.infinity,
            height: screenSize.height / 2.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(name),fit: BoxFit.cover,),
               // color: Colors.blue,
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30) , bottomLeft: Radius.circular(30)),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40 , horizontal: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white24 , shape: BoxShape.circle , ),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
                      icon: const Icon(Icons.arrow_downward_rounded , color: Colors.black, size: 25), ),

                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17 , vertical: 280),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      title,
                      style: const TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded,
                            size: 15, color: Colors.white60)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
