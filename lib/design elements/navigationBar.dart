import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key,  this.title}) : super(key: key);
  final String title;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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