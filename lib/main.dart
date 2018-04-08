import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
      title: "The Book App",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: null,
    );
  }
}