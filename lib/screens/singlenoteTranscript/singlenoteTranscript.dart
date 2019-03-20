import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'widgets/custom_float.dart';
import 'widgets/transcript.dart';
import 'widgets/searchbar.dart';
import 'widgets/bottomBar.dart';

class singlenoteTranscript extends StatefulWidget {
  singlenoteTranscript({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _singlenoteTranscriptState createState() => _singlenoteTranscriptState();
}

class _singlenoteTranscriptState extends State<singlenoteTranscript> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new SearchList(title: widget.title),
        body: Center(
          child: new transcript(),
        ),
        bottomNavigationBar: new BottomAppBar(),
        floatingActionButton: CustomFloat(
          icon: Icons.format_list_bulleted,
          qrCallback: () {
            Navigator.pushNamed(context, '/singlenoteBulletPointList');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}
