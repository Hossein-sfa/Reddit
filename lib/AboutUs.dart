import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => AboutUsState();
}

class AboutUsState extends State<AboutUs> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  final double distanceFromTop =68;
  String src =
      "https://static.vecteezy.com/system/resources/previews/003/335/579/large_2x/desktop-source-code-and-wallpaper-by-coding-and-programming-free-photo.jpg";
  String src2 =
      "https://thumbs.dreamstime.com/b/business-man-icon-illustration-business-man-icon-white-background-107722188.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body:ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTopBar(),
          buildContent(),
        ],
      )


    );

  }
  Widget buildContent() => Column(
    children:[
      const SizedBox(height: 8),
      const Text("Hossein & Navid",
        style: TextStyle(fontSize: 28 ,fontWeight: FontWeight.bold),),
      const SizedBox(height: 8),
      const Text("Computer Engineering Students",
        style: TextStyle(fontSize: 20 ,color: Colors.black,),),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialIcon(FontAwesomeIcons.telegram , "Hossein"),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.github ,"Hossein"),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.github , "Navid"),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.telegram , "Navid"),
        ],
      )
    ],
  );
  Widget buildTopBar() {
    return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      buildCoverImage(),
      Positioned(
          top: distanceFromTop,
          child: buildProfileImage()
      ),
    ],
  );
  }
  Widget buildCoverImage() => Container(
    color: Colors.grey,
    width: double.infinity,
    height: coverHeight,
    child : Image.network(src),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,

    backgroundColor: Colors.grey.shade800,
      backgroundImage: const AssetImage('assets/images/circleAvatar.png'),
  );

  Widget buildSocialIcon(IconData icon, String name) => CircleAvatar(
    key: name == "Hossein" ? const Key("Hossein") : const Key("Navid"),
    radius: 25,
    child: Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {},
        child: Icon(
          icon,
          size: 32,
        ),
      ),
    ),
  );
}

















