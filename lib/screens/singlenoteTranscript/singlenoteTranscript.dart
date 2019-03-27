import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'widgets/custom_float.dart';
import 'widgets/transcript.dart';
import 'widgets/searchbar.dart';
import 'widgets/bottomBar.dart';

class singlenoteTranscript extends StatefulWidget {
  final String title;
  final String text;
  singlenoteTranscript({Key key, this.title, this.text}) : super(key: key);
  @override
  _singlenoteTranscriptState createState() {
    return new _singlenoteTranscriptState();
  }
}

class _singlenoteTranscriptState extends State<singlenoteTranscript> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: new SearchList(widget.title),
        body: Container(
          child: new transcript(widget.text),
        ),
        bottomNavigationBar: new bottomBar(),
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
