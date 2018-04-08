import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'data.dart';
import 'rating_bar.dart';

class Detail extends StatelessWidget {
  final Book book;
  Detail({@required this.book});

  Widget text(String data,
          {Color color = Colors.black87,
          double size = 14.0,
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
        text("${book.pages} pages", color: Colors.black38, size: 12.0)
      ],
    );

    final topRight = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new SizedBox(height: 16.0),
        text(book.title, size: 18.0, isBold: true, padding: new EdgeInsets.only(top: 16.0)),
        text('by ${book.writer}', color: Colors.black54, size: 15.0, padding: new EdgeInsets.only(top: 8.0, bottom: 16.0)),
        new Row(children: <Widget>[
          text(book.price, isBold: true, padding: new EdgeInsets.only(right: 8.0)),
          new RatingBar(rating: book.rating),
        ],),
        new SizedBox(height: 42.0),
        new Material(
          elevation: 5.0,
          borderRadius: new BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          child: new MaterialButton(
            onPressed: (){},
            color: Colors.blue,
            minWidth: 200.0,
            child: text("Buy Now", color: Colors.white, size: 13.0),
          )
        )
      ],
    );

    final topContent = new Container(
      color: Theme.of(context).primaryColor,
      padding: new EdgeInsets.only(bottom: 16.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Flexible(flex: 2, child: topLeft,),
          new Flexible(flex: 3, child: topRight),
        ],
      ),
      );


    //Scrolling description
    final bottomContent = new Container(
      height: 310.0,
        child: new SingleChildScrollView(
          padding: new EdgeInsets.all(20.0),
          child: new Text(
            book.description,
            style: new TextStyle(fontSize: 13.0, height: 2.0),
          ),
        )
    );

    return new Scaffold(
      appBar: appBar,
      body: new Column(
        children: <Widget>[
          topContent, 
          bottomContent
        ],
      ),
    );
  }

  
}
