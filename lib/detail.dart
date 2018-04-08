import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'data.dart';
import 'rating_bar.dart';

class Detail extends StatelessWidget {
  final Book book;
  Detail({@required this.book});

  Widget text(String data,
          {Color color = Colors.black87,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: new Text(
          data,
          style: new TextStyle(
            color: color,
            fontSize: size,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    
    final appBar = new AppBar(
      elevation: 4.0,
      leading: new IconButton(
        icon: new Icon(Icons.menu),
        onPressed: () {},
      ),
      title: new Center(child: new Text("Design Books")),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );

    final topLeft = new Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Hero(
            tag: book.title,
            child: new Material(
              elevation: 15.0,
              shadowColor: Colors.yellow.shade900,
              child: new Image(
                image: new AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text("${book.pages} pages", color: Colors.black38, size: 12)
      ],
    );

    final topRight = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(book.title, size: 16, isBold: true, padding: new EdgeInsets.only(top: 16.0))
      ],
    );

    return new Container();
  }

  
}
