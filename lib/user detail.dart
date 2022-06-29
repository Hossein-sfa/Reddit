import 'package:flutter/material.dart';
import 'package:reddit/userSetting.dart';
import 'ToHome.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key}) : super(key: key);
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
  final String _userName = "Navid82";
  final String _fullName = "Navid Raeiszadeh"; //ToDo implement it with server !
  final String _bio =
      "Bio: \n You must be the wish that you want to see in the world!";
  final String followers = "10"; // user.followers.toString();
  final String followings = "20"; // user.followings.toString();
  final String posts = "0"; // user.posts.toString();

  const UserProfilePage({Key? key}) : super(key: key);

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/profiledesign.jfif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 45.0, bottom: 10.0),
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/circleAvatar.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(500.0),
          border: Border.all(
            color: Colors.deepOrange,
            width: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildUserName() {
    TextStyle nameTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.orangeAccent,
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
    );
    return Text(
      _userName,
      style: nameTextStyle,
    );
  }

  Widget _buildFullName(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 17.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(
          color: Colors.deepOrangeAccent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        _fullName,
        style: const TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 15.0,
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
      height: 65.0,
      width: 450.0,
      margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("followings", followings),
          _buildStatItem("followers", followers),
          _buildStatItem("posts", posts),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = const TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: Colors.white,
      fontSize: 16.0,
    );
    return Container(
      //color: Colors.white70,
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "\"$_bio\"",
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.2,
      height: 3.0,
      color: Colors.white60,
      margin: const EdgeInsets.only(top: 8.0),
    );
  }

  // Widget _nameText(BuildContext context) {
  //
  // }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.change_circle,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const UserSetting(key: Key('userSetting')),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ToHome()),
            );
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      backgroundColor: Colors.black45,
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6),
                  _buildProfileImage(),
                  _buildUserName(),
                  _buildFullName(context),
                  _buildStatContainer(),
                  _buildBio(context),
                  // _nameText(context),
                  _buildSeparator(screenSize),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
