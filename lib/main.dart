import 'package:flutter/material.dart';
import 'communities.dart';
import 'siginpage.dart';

void main() => runApp(const MyApp());

// class for switching between dark and light theme
class Theme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.deepOrange,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE53F3F),
    ),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.deepOrange,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE53F3F),
    ),
  );
}

// contains app bar for different pages
class AppBars {
  static var reddit = AppBar(
    backgroundColor: Colors.black,
    title: const Text(
      "  Reddit",
      textAlign: TextAlign.center,
      //textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 25 , color: Colors.redAccent , shadows: [Shadow(
          blurRadius: 10.0 , color: Colors.white38 , offset: Offset(5.0, 5.0)
      )]),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      theme: Theme.light,
      darkTheme: Theme.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: SignIn(),
      body:
      SignIn(),
    );
  }
}
