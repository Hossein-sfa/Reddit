import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'ToHome.dart';
//import 'dart:io';

class CreateProfile extends StatefulWidget {
  const CreateProfile({required Key key}) : super(key: key);
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  // final networkHandler = NetworkHandler();
  bool circular = false;

  //late PickedFile _imageFile;
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _case = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _about = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0X73000000),
        title: const Text(
          "Add Communities",
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
              const SizedBox(height: 20),
              nameTextField(),
              const SizedBox(height: 20),
              caseTextField(),
              const SizedBox(height: 20),
              titleTextField(),
              const SizedBox(height: 20),
              aboutTextField(),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  setState(() {
                    circular = true;
                  });
                  if (_globalKey.currentState!.validate()) {
                    Map<String, String> data = {
                      "name": _name.text,
                      "Case": _case.text,
                      "titleline": _title.text,
                      "about": _about.text,
                    };
                    /*
                    var response = await networkHandler.post("/profile/add", data);
                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      if (_imageFile.path != null) {
                        var imageResponse = await networkHandler.patchImage(
                            "/profile/add/image", _imageFile.path);
                        if (imageResponse.statusCode == 200) {
                          setState(() {
                            circular = false;
                          });
                         // Navigator.of(context).pushAndRemoveUntil();
                        }
                      } else {
                        setState(() {
                          circular = false;
                        });
                       // Navigator.of(context).pushAndRemoveUntil();
                      }
                    }
               */
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
                              "Submit",
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
              IconButton(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                ),
              ),
              IconButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      // _imageFile = pickedFile!;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value!.isEmpty) return "Name can't be empty";
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
        labelText: "Name",
        helperText: "Name can't be empty",
        hintText: "SBU Association",
      ),
    );
  }

  Widget caseTextField() {
    return TextFormField(
      controller: _case,
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
        labelText: "Case of Communication",
        helperText: "Case can't be empty",
        hintText: "Biography",
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: _title,
      validator: (value) {
        if (value!.isEmpty) return "Title can't be empty";
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
        labelText: "Title",
        helperText: "It can't be empty",
        hintText: "Flutter Project",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: _about,
      maxLines: 4,
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
        labelText: "About",
        helperText: "Write about your Association & Communication",
        hintText:
            "We are a group of students of Shahid Behesti University who are working on a project",
      ),
    );
  }
}
