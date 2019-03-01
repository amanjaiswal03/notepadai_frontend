import 'src/generated/audioStream.pb.dart';
import 'src/generated/audioStream.pbgrpc.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mic_stream/mic_stream.dart';
import 'package:grpc/grpc.dart';

import 'dart:typed_data';
import 'dart:async';

/* NotepadAI
  Copy of base application examples provided by Google
 */

//TODO: Move to corresponding class
const int PORT = 50004;
const String HOSTNAME = "10.0.2.2";
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

  /// TESTING PURPOSE ONLY ///
  // TODO: stream audio to server using gRPC
  static int _isPressed = 1;
  static bool _isRecording = false;
  Microphone _microphone;
  AudioProcessorClient _client;
  StreamSubscription<Uint8List> _subscriber;

  void _init() async {
    _microphone = new Microphone();
    _client = new AudioProcessorClient(new ClientChannel(HOSTNAME, port: PORT));
  }

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

  void _floatingButtonPress() {
    setState(() {
      _buttonIcon = _floatingButtonState[_isPressed];
      _buttonColor = _floatingButtonColor[_isPressed];
      _isPressed = (_isPressed + 1) % 2;
    });
    _audioStream();
  }

  void _audioStream() async {
    StreamController<Samples> _sender = new StreamController();

    if (!_isRecording) {
      print("Start sending stuff to localhost");
      _isRecording = true;
      _subscriber = _microphone.start().listen((samples) => _sender.add(_convertByteArrayToAudioChunk(samples)));
      (_client.transcriptAudio(_sender.stream)).listen((response) => print(response.word));
    }
    else {
      print("Stop sending stuff");
      _isRecording = false;
      _subscriber.cancel();
      _microphone.stop();
      _sender.close();
    }
  }

  _convertByteArrayToAudioChunk (Uint8List samplesIn) {
    Samples samplesOut = new Samples();
    samplesOut.setField(1, samplesIn);
    return samplesOut;
  }

  /// END OF TESTING PART ///

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Button currently used for audio testing
      floatingActionButton: FloatingActionButton(
        backgroundColor: _buttonColor,
        child: _buttonIcon,
        onPressed: _floatingButtonPress,
        tooltip: 'Start streaming audio',
      ),
    );
  }
}
