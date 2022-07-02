import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'ToHome.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({required Key key}) : super(key: key);
  @override
  CreateProfileState createState() => CreateProfileState();
}

class CreateProfileState extends State<UserSetting> {
  // final networkHandler = NetworkHandler();
  bool circular = false;
  //late PickedFile _imageFile;
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0X73000000),
        title: const Text(
          "Change User Settings",
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return const ToHome();
                  },
                ),
              );
            },
            icon: const Icon(Icons.home_filled),
          ),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bkg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _globalKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: <Widget>[
              imageProfile(),
              const SizedBox(
                height: 20,
              ),
              nameTextField(),
              const SizedBox(
                height: 20,
              ),
              caseTextField(),
              const SizedBox(
                height: 20,
              ),
              titleTextField(),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    circular = true;
                  });
                  if (_globalKey.currentState!.validate()) {
                    Map<String, String> data = {
                      "name": _fullName.text,
                      "Username": _username.text,
                      "Email": _email.text,
                      "about": _bio.text,
                    };
                  }
                },
                child: Center(
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: circular
                          ? const CircularProgressIndicator()
                          : const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          const CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('assets/images/circleAvatar.png'),
            //backgroundImage: (_imageFile == null)
            //     ? const AssetImage("assets/images/circleAvatar.png")
            //       :  AssetImage(_imageFile.path),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              FlatButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      // _imageFile = pickedFile!;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _fullName,
      validator: (value) {
        return (value!.isEmpty) ? "Email can't be empty" : null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Email",
        helperText: "email can't be empty",
        hintText: "Navid@gmail.com",
        //ToDo => It must be the current name of the user auto complete
      ),
    );
  }

  Widget caseTextField() {
    return TextFormField(
      controller: _username,
      validator: (value) {
        if (value!.isEmpty) return "Case can't be empty";
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "User Name",
        helperText: "User name can't be empty",
        //ToDo => It must be edited or don't change
        hintText: "navid82",
        //ToDo => It must be the current user name of the user
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: _username,
      validator: (value) {
        if (value!.isEmpty) return "Email can't be empty";
        return null;
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Password",
          helperText: "Password can't be empty",
          hintText: "qwER123!"
      ),
    );
  }
}
