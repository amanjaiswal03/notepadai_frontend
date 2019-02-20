import 'package:flutter/material.dart';
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

// Starting screen upon run
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
        title: new Text('Hypnotegit '),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.record_voice_over), title: Text('record')),
          BottomNavigationBarItem(icon: Icon(Icons.create), title: Text('new transscript')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('transscripts')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        elevation: 7,
        child: Icon(Icons.mic),
        onPressed: null,
        shape: DiamondBorder(),
      ),
    );
  }
}
