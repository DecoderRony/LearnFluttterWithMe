import 'package:flutter/material.dart';
import 'homepage.dart';
import 'teamspage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'Hogwarts App',
      home: HomePage(),

      routes: {
        '/teams' : (context) => Teams(),
      },
    );
  }
}