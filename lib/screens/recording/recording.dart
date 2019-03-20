import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'widgets/custom_float.dart';
import 'widgets/transcript.dart';
import 'widgets/appbar.dart';
import 'widgets/bottomBar.dart';

class recording extends StatefulWidget {
  recording({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _recordingState createState() => _recordingState();
}

class _recordingState extends State<recording> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new appbar(),
        body: Center(
          child: new transcript(),
        ),
        bottomNavigationBar: new bottomBar(),
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
