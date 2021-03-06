import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:reddit/user.dart';
import 'siginpage.dart';
import 'ToHome.dart';
import 'main.dart';
import 'dart:io';

// validate that password contains 8 chars and  at least one number and  a small and a capital character
isValidPassword(String pass) {
  if (pass.length >= 8) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    return RegExp(pattern).hasMatch(pass);
  }
  return false;
}

// Validates email
isValidEmail(String email) {
  if (email.isNotEmpty) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
  return false;
}

isValidUserName(String userName) {
  if (userName.isNotEmpty) {
    return true;
  }
  return false;
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  bool obscure = true,
      emailChecker = false,
      userNameChecker = false,
      passwordChecker = false;
  String? emailErrorMessage, userNameErrorMessage, passwordErrorMessage;
  String showMessage = '', response = '';


  // disabling button when password is not valid and username and pass and email are not empty and email is correct
  @override
  void initState() {
    super.initState();
    email.addListener(() {
      setState(() {
        if (isValidEmail(email.text)) {
          emailChecker = true;
        } else {
          emailChecker = false;
        }
      });
    });
    userName.addListener(() {
      setState(() {
        if (isValidUserName(userName.text)) {
          userNameChecker = true;
        } else {
          userNameChecker = false;
        }
      });
    });
    password.addListener(() {
      setState(() {
        if (isValidPassword(password.text)) {
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
    email.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  Future<String> signUp() async {
    await Socket.connect("192.168.1.34", 8080).then((serverSocket) {
      serverSocket.write(
          'signup~${email.text}~${userName.text}~${password.text}\u0000');
      serverSocket.flush();
      serverSocket.listen((socket) {
        setState(() {
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
                image: AssetImage("assets/images/bkg4.jpg"), fit: BoxFit.cover),
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
                    width: 370,
                    height: 450,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 18,
                          ),
                          child: TextField(
                            controller: email,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              emailErrorMessage = isValidEmail(email.text)
                                  ? null
                                  : 'This email is not valid';
                            },
                            decoration: InputDecoration(
                              filled: true,
                              errorText: emailErrorMessage,
                              labelText: 'Email: ',
                              labelStyle:
                              const TextStyle(color: Colors.redAccent),
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
                          child: TextField(
                            controller: userName,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              userNameErrorMessage =
                              isValidUserName(userName.text)
                                  ? null
                                  : 'This username is already chosen';
                            },
                            decoration: InputDecoration(
                              filled: true,
                              errorText: userNameErrorMessage,
                              labelText: 'UserName: ',
                              labelStyle:
                              const TextStyle(color: Colors.redAccent),
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
                              errorText: passwordErrorMessage,
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
                              labelStyle:
                              const TextStyle(color: Colors.redAccent),
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
                            const Text("Have an account? : "),
                            TextButton(
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignIn(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: emailChecker &&
                              userNameChecker &&
                              passwordChecker
                              ? () async {
                            String result = await signUp();
                            print('this is result: $result');
                            if (result == '1') {
                              User.name = userName.text ;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ToHome(),
                                ),
                              );
                            } else {
                              // ToDo : show error message that user name is duplicate
                              showMessage = 'User name is duplicate';
                            }
                          }
                              : null,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: const Color(0xffffb34f),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                          ),
                        ),
                        Text(
                          showMessage,
                          style: const TextStyle(color: Colors.red),
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
