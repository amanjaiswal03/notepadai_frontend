import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'widgets/custom_float.dart';
import 'widgets/transcript.dart';
import 'widgets/appbar.dart';

class recording extends StatefulWidget {
  recording({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _recordingState createState() => _recordingState();
}

class _recordingState extends State<recording> {

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
            Colors.blue,
            Colors.blue,
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
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Center(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.pause, color: Colors.white,),
                    Text(
                      "pause",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ),
            ),
          ),
          new SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: double.infinity,
            child: new InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              radius: 10.0,
              splashColor: Colors.yellow,
              child: Center(
                child: Center(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.highlight, color: Colors.white,),
                        Text(
                          "highlighter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
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
        appBar: new appbar(),
        body: Center(
          child: new transcript(),
        ),
        bottomNavigationBar: myBottomBar(),
        floatingActionButton: CustomFloat(
          icon: Icons.stop,
          qrCallback: () {
            Navigator.pushNamed(context, '/allnotes');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}