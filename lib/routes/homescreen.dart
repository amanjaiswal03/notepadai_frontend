import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
//import 'package:notepadai_app/design elements/DiamondBorder.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:audio_recorder/audio_recorder.dart';
//import 'package:notepadai_app/proto/audioStream.pbgrpc.dart';
//import 'package:notepadai_app/proto/audioStream.pb.dart';
//import 'package:grpc/grpc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

// Subclass of the HomePage specifying style and interactive elements and putting them in a grid
class _HomePageState extends State<HomePage> {
  static int _isPressed = 0;
  int _selectedIndex = 0;

  /* Test purposes only: */
  static final _floatingButtonState = [
    Icon(Icons.keyboard_voice),
    Icon(Icons.stop),
  ];
  static final _floatingButtonColor = [
    MAIN_COLOR,
    Colors.red,
  ];

  Icon _buttonIcon = _floatingButtonState[_isPressed];
  Color _buttonColor = _floatingButtonColor[_isPressed];

  void _streamAudio() {
    setState(() {
      _buttonIcon = _floatingButtonState[_isPressed];
      _buttonColor = _floatingButtonColor[_isPressed];
      _isPressed = (_isPressed + 1) % 2;
    });

    StreamController<String> controller = new StreamController();
    //Stream<String> audioStream = new Stream.fromFuture();
  }

  final _widgetOptions = [
    Text('Index 0: All Notes'),
    Text('Index 1: Favorites'),
    Text('Index 2: Editor'),
    Text('Index 3: Settings'),
  ];


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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _buttonColor,
        child: _buttonIcon,
        onPressed: _streamAudio,
        tooltip: 'Start streaming audio',
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

