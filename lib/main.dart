import 'package:flutter/material.dart';

/* NotepadAI
  Copy of base application examples provided by Google
 */

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
