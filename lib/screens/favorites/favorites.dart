import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'package:notepadai_app/widgets/bottomBar.dart';

class favorites extends StatefulWidget {
  favorites({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _favoritesState createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {

  static int _isPressed = 0;

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

  Widget myBottomBar() => BottomAppBar(
    clipBehavior: Clip.antiAlias,
    shape: CircularNotchedRectangle(),
    child: Ink(
      height: 50.0,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [
            // new Color.fromRGBO(103, 218, 255, 1.0),
            // new Color.fromRGBO(3, 169, 244, 1.0),
            // new Color.fromRGBO(0, 122, 193, 1.0),
            Colors.blueGrey.shade800,
            Colors.black87,
          ])),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            child: new InkWell(
              radius: 10.0,
              splashColor: Colors.yellow,
              onTap: () {},
              child: Center(
                child: new Text(
                  "ADD TO WISHLIST",
                  style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          new SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: double.infinity,
            child: new InkWell(
              onTap: () {},
              radius: 10.0,
              splashColor: Colors.yellow,
              child: Center(
                child: new Text(
                  "ORDER PAGE",
                  style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("favorites"),
      ),
      bottomNavigationBar: myBottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _buttonColor,
        child: _buttonIcon,
        onPressed: _streamAudio,
        tooltip: 'Start streaming audio',
      ),
    );
  }
}
