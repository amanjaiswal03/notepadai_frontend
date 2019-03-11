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
const int PORT = 12345;
const String HOST = "192.168.44.103";
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
  static int _isPressed = 0;
  static bool _isRecording = false;
  Microphone _microphone;
  ClientChannel _channel;
  Client _client;
  StreamSubscription<Uint8List> _subscriber;

  void _init() {
    _microphone = new Microphone();
    _client = new Client(HOST, PORT);
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
      _isPressed = (_isPressed + 1) % 2;
      _buttonIcon = _floatingButtonState[_isPressed];
      _buttonColor = _floatingButtonColor[_isPressed];
    });
    _audioStream();
  }

  void _audioStream() async {
    StreamController<Samples> _sender = new StreamController();

    if (!_isRecording) {
      print("Start microphone");
      _isRecording = true;

      print("Start transmission...");
      _client.transcriptAudio(_microphone.start()).listen((response) => print(response));
    }
    else {
      print("Stop transmission");
      _isRecording = false;
      _subscriber.cancel();
      _microphone.stop();
      _sender.close();
      _channel.shutdown();
    }
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

class Client {
  ClientChannel channel;
  AudioProcessorClient stub;
  CallOptions options;


  Client(String host, int port) {
    channel = new ClientChannel(host, port: port, options: const ChannelOptions(credentials: const ChannelCredentials.insecure()));
    options = new CallOptions(timeout: Duration(seconds: 30));
    stub = new AudioProcessorClient(channel, options: options);
  }

  Stream<String> transcriptAudio(Stream<Uint8List> audio) async* {
    yield* _responseToString(stub.transcriptAudio(audio.map((audio) => _audioToSamples(audio))));
  }

  Stream<String> _responseToString(ResponseStream<dynamic> response) async* {
    yield* response.map((value) => value.word);
  }

  Samples _audioToSamples(List<int> input) {
    Samples samples = new Samples();
    samples.chunk = input;
    return samples;
  }
}