import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'signuppage.dart';
import 'ToHome.dart';
import 'user.dart';
import 'main.dart';
import 'dart:io';

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
  String showMessage = '' , response = '';

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

  // connects to server
  Future<String> logIn() async {
    await Socket.connect("192.168.1.34", 8080).then((serverSocket) {
      serverSocket.write('signin~${userName.text}~${password.text}\u0000');
      serverSocket.flush();
      serverSocket.listen((socket) {
        setState((){
          response = String.fromCharCodes(socket);
        });
      });
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Material(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              themeChange.darkTheme = !themeChange.darkTheme;
            });
          },
          child: themeChange.darkTheme
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.sunny),
        ),
        appBar: AppBars.reddit,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/1.jpg"), fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Center(
              child: Wrap(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    width: 365,
                    height: 320,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 20,
                            bottom: 5,
                          ),
                          child: TextField(
                            controller: userName,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'UserName: ',
                              labelStyle: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
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
                              passwordErrorMessage = isValidPassword(
                                  password.text)
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
                              labelStyle: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
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
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const SizedBox(width: 25),
                            const Text("Don't have an account?  "),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: userNameChecker && passwordChecker
                                ? () async {
                              String result = await logIn();
                              if (result == '1') {
                                User.name = userName.text ;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ToHome(),
                                  ),
                                );
                              } else {
                                showMessage =
                                'User name or password is incorrect!';
                              }
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              primary: const Color(0xffffb34f),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
