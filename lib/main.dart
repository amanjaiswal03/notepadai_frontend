import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:notepadai_app/proto/audioStream.pbgrpc.dart';
import 'package:notepadai_app/proto/audioStream.pb.dart';
import 'package:grpc/grpc.dart';

/* NotepadAI
  Copy of base application example provided by Google
 */


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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'HomePage - NotepadAI'),
    );
  }
}

//TODO: Implement audio recording, hack into chunks and send via proto

// Starting screen upon run
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

// Subclass of the HomePage specifying style and interactive elements and putting them in a grid
class _HomePageState extends State<HomePage> {
  static const int PORT = 12345;
  static const String HOSTNAME = "127.0.0.1";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
