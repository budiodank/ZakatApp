import 'package:flutter/material.dart';
import 'package:zakat/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zakat App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MainScreen(title: 'Main Menu'),
    );
  }
}
