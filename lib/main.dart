import 'package:flutter/material.dart';
import 'package:notepadai_app/routes/homescreen.dart';
import 'dart:async';
import 'package:notepadai_app/design elements/DiamondBorder.dart';

/* NotepadAI
  Copy of base application example provided by Google
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
      title: 'HypNote',
      theme: ThemeData(
        primarySwatch: MAIN_COLOR,
      ),
      home: HomePage(title: 'All Notes'),
    );
  }
}

// Starting screen upon run
