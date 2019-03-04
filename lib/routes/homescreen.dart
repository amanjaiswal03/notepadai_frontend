import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
//import 'package:notepadai_app/design elements/DiamondBorder.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

// Subclass of the HomePage specifying style and interactive elements and putting them in a grid
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('All Notes')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text('Favorites')),
          BottomNavigationBarItem(icon: Icon(Icons.edit), title: Text('Editor')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings'))
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
