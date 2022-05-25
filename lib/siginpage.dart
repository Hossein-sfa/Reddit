import 'package:flutter/material.dart';
import 'signuppage.dart';
import 'feed.dart';

// validate that password contains 8 chars and  at least one number and  a small and a capital character
isValidPassword(String pass) {
  if (pass.length >= 8) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(pass);
  }
  return false;
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true, button = false;

  // disabling button when password is not valid and username and pass are not empty
  @override
  void initState() {
    super.initState();
    password.addListener(() {
      setState(() {
        button = (isValidPassword(password.text) && userName.text != '');
      });
    });
  }

  // deleting the text controller when widget is disposed (finalize method)
  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Wrap(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: userName,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'UserName: ',
                        labelStyle: const TextStyle(color: Colors.redAccent),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: Color(0xfffdfdfd)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: Color(0xfffc4040)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: password,
                      obscureText: obscure,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Password: ',
                        suffixIcon: IconButton(
                          icon: Icon(obscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                        ),
                        labelStyle: const TextStyle(color: Colors.redAccent),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: Color(0xfffdfdfd)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: Color(0xfffc4040)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 25),
                      const Text("Don't have an account? : "),
                      TextButton(
                        child: const Text('Sign up'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: button
                        ? () {
                            // TODO: sending userName and password to server in phase 2 project

                            userName.clear();
                            password.clear();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Feed()),
                            );
                          }
                        : null,
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      primary: const Color(0xffffb34f),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
