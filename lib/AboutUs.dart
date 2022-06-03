import 'package:flutter/material.dart';

class ABUS extends StatelessWidget {
  const ABUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "User Profile",
      debugShowCheckedModeBanner: false,
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  final String _fullName = "Hossein & Navid";
  final String _status = "Computer Engineers Student";
  final String _bio =
      "\"Hi, ٌWE are computer engineers students from Iran. We are trying to make a better world."
      "cadvdvvdzvdvdxvxvxvdz"
      "vxdxvdvdvxdvxv"
      "dzdfddzdzczczdcdzcdzcdzdzczdcdzczdcdzcdzcdz"
      "czdcdzcdzcdzcdzdczczdczdcz"
      "zdcdzczdczdcdzcdzcdzczdczdcdzcdzcdzcdzcdczcdzczcdzczcdzcz"
      "zdcdzczdcdzcdzcdcdfefrsgtdhyfjyjtyhrgrsgsgrgdg"
      "d"
      "cadvdvvdzvdvdxvxvxvdz"
      "vxdxvdvdvxdvxv"
      "dzdfddzdzczczdcdzcdzcdzdzczdcdzczdcdzcdzcdz"
      "czdcdzcdzcdzcdzdczczdczdcz"
      "zdcdzczdczdcdzcdzcdzczdczdcdzcdzcdzcdzcdczcdzczcdzczcdzcz"
      "zdcdzczdcdzcdzcdcdfefrsgtdhyfjyjtyhrgrsgsgrgdg"
      "d"
      "cadvdvvdzvdvdxvxvxvdz"
      "vxdxvdvdvxdvxv"
      "dzdfddzdzczczdcdzcdzcdzdzczdcdzczdcdzcdzcdz"
      "czdcdzcdzcdzcdzdczczdczdcz"
      "zdcdzczdczdcdzcdzcdzczdczdcdzcdzcdzcdzcdczcdzczcdzczcdzcz"
      "zdcdzczdcdzcdzcdcdfefrsgtdhyfjyjtyhrgrsgsgrgdg"
      "d"
      "cadvdvvdzvdvdxvxvxvdz"
      "vxdxvdvdvxdvxv"
      "dzdfddzdzczczdcdzcdzcdzdzczdcdzczdcdzcdzcdz"
      "czdcdzcdzcdzcdzdczczdczdcz"
      "zdcdzczdczdcdzcdzcdzczdczdcdzcdzcdzcdzcdczcdzczcdzczcdzcz"
      "zdcdzczdcdzcdzcdcdfefrsgtdhyfjyjtyhrgrsgsgrgdg"
      "d"
      "cadvdvvdzvdvdxvxvxvdz"
      "vxdxvdvdvxdvxv"
      "dzdfddzdzczczdcdzcdzcdzdzczdcdzczdcdzcdzcdz"
      "czdcdzcdzcdzcdzdczczdczdcz"
      "zdcdzczdczdcdzcdzcdzczdczdcdzcdzcdzcdzcdczcdzczcdzczcdzcz"
      "zdcdzczdcdzcdzcdcdfefrsgtdhyfjyjtyhrgrsgsgrgdg"
      "d"
      "cadvdvvdzvdvdxvxvxvdz"
      "vxdxvdvdvxdvxv"
      "dzdfddzdzczczdcdzcdzcdzdzczdcdzczdcdzcdzcdz"
      "czdcdzcdzcdzcdzdczczdczdcz"
      "zdcdzczdczdcdzcdzcdzczdczdcdzcdzcdzcdzcdczcdzczcdzczcdzcz"
      "zdcdzczdcdzcdzcdcdfefrsgtdhyfjyjtyhrgrsgsgrgdg"
      "d"
      "cadvdvvdzvdvdxvxvxvdz"
      "vxdxvdvdvxdvxv"
      "dzdfddzdzczczdcdzcdzcdzdzczdcdzczdcdzcdzcdz"
      "czdcdzcdzcdzcdzdczczdczdcz"
      "zdcdzczdczdcdzcdzcdzczdczdcdzcdzcdzcdzcdczcdzczcdzczcdzcz"
      "zdcdzczdcdzcdzcdcdfefrsgtdhyfjyjtyhrgrsgsgrgdg"
      "d"
      "grsgrgrgtdhhyfjgyukulkkgmrskrjfejfkjekofjkrjkgjkrjgjrkjgrjg  jjt jvj jbbjjnjsjkjrjgkgjrkjgjuct leave a message.\"";
  final String _stuid1 = "Navid";
  final String _stuid2 = "Hossein";

  const UserProfilePage({Key? key}) : super(key: key);

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 90.0,
        height: 90.0,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/circleAvatar.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(150.0),
          border: Border.all(
            color: Colors.white,
            width: 5.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.deepOrangeAccent,
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: const TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = const TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("400243103", _stuid2),
          _buildStatItem("400243103", _stuid1),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = const TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,
      //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: const EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with ${_fullName.split(" ")[0]},",
        style: const TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {}, //TODO: open dialog box for telegram ID's
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: const Color(0xFF404A5C),
                ),
                child: const Center(
                  child: Text(
                    "Contact  Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () {}, //ToDo => go to home
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Home",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.5),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                  _buildStatContainer(),
                  _buildBio(context),
                  _buildSeparator(screenSize),
                  const SizedBox(height: 10.0),
                  _buildGetInTouch(context),
                  const SizedBox(height: 8.0),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
