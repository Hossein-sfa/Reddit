import 'package:flutter/material.dart';
import 'ToHome.dart';
import 'signuppage.dart';
import 'main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true, userNameChecker = false, passwordChecker = false;
  String? userNameErrorMessage, passwordErrorMessage;

  @override
  void initState() {
    super.initState();
    userName.addListener(() {
      setState(() {
        if (userName.text != "") {
          userNameChecker = true;
        } else {
          userNameChecker = false;
        }
      });
    });
    password.addListener(() {
      setState(() {
        if (password.text != '' && password.text.length >= 8) {
          passwordChecker = true;
        } else {
          passwordChecker = false;
        }
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
      child: Scaffold(
        appBar: AppBars.reddit,
        body: SafeArea(
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
                        onChanged: (text) {
                          passwordErrorMessage = isValidPassword(password.text)
                              ? null
                              : 'This password is not strong enough.\nIt should have at least one lowercase, uppercase letter and a number.\nand it should be more than 8 characters.';
                        },
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: userNameChecker && passwordChecker
                          ? () {
                              // ToDo : sending username and password to server in phase to project
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ToHome(),
                                ),
                              );
                            }
                          : null,
                      child: TextButton(
                          child: const Text('Sign in',
                              style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ToHome(),
                              ),
                            );
                          }),
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
      ),
    );
  }
}
