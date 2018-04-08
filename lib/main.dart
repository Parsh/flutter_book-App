import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
      title: "The Book App",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
        platform: TargetPlatform.android,
      ),
      home: new Home(),
    );
  }
}