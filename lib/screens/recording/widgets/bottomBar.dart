import 'package:flutter/material.dart';

class bottomBar extends StatefulWidget {
  bottomBar({Key key, this.selectedIndex}) : super(key: key);

  final int selectedIndex;


  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {

  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  final _widgetOptions = [
    '/allnotes',
    '/',
    '/recording',
    '/',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('All Notes')),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text('Favorites')),
        BottomNavigationBarItem(icon: Icon(Icons.edit), title: Text('Editor')),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings'))
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      // change the screen by call a route
      Navigator.pushNamed(context, _widgetOptions.elementAt(index));
    });
  }
}
