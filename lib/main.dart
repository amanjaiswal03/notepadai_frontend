import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/design elements/DiamondBorder.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:notepadai_app/proto/audioStream.pbgrpc.dart';
import 'package:notepadai_app/proto/audioStream.pb.dart';
import 'package:grpc/grpc.dart';

/* NotepadAI
  Copy of base application example provided by Google
 */

//TODO: Move to corresponding class
const int PORT = 12345;
const String HOSTNAME = "127.0.0.1";
const Color MAIN_COLOR = Colors.cyan;


// Main function running the class containing the whole project
void main() => runApp(NotepadAI());

// Actual app implementation
// Sets the widget where the whole application is built up on
class NotepadAI extends StatelessWidget {

  // Initializes a base app with the HomePage class as starting view and some view settings
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotepadAI',
      theme: ThemeData(
        primarySwatch: MAIN_COLOR,
      ),
      home: HomePage(title: 'HomePage - NotepadAI'),
    );
  }
}

// Starting screen upon run
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

// Subclass of the HomePage specifying style and interactive elements and putting them in a grid
class _HomePageState extends State<HomePage> {
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Hypnote'),
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
      // BUTTON FOR TESTING PURPOSE ONLY - REMOVE OR CHANGE ONCE TEST COMPLETED (->AUDIO OVER gRPC)
      floatingActionButton: FloatingActionButton(
        backgroundColor: _buttonColor,
        child: _buttonIcon,
        onPressed: _streamAudio,
        tooltip: 'Start streaming audio',
      ),
    );
  }
}
