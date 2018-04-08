import 'package:flutter/material.dart';
import 'data.dart';
import 'detail.dart';
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
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  // Generating parameterized routes => e.g.  detail/somebooktitle
  Route generateRoute(RouteSettings settings){
    final path = settings.name.split('/');
    final title = path[1];

    Book book = books.firstWhere((bk)=>bk.title == title);
    return new MaterialPageRoute(
      settings: settings,
      builder: (context) => new Detail(book: book)
    );
  }
}