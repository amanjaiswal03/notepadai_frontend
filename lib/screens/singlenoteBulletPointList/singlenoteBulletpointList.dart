import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'widgets/custom_float.dart';
import 'widgets/bulletPointlist.dart';
import 'widgets/searchbar.dart';
import 'widgets/bottomBar.dart';

class singlenoteBulletPointList extends StatefulWidget {
  singlenoteBulletPointList({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _singlenoteBulletPointListState createState() => _singlenoteBulletPointListState();
}

class _singlenoteBulletPointListState extends State<singlenoteBulletPointList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new SearchList(title: widget.title),
        body: Center(
          child: new bulletPointlist(),
        ),
        bottomNavigationBar: new bottomBar(),
        floatingActionButton: CustomFloat(
          icon: Icons.subject,
          qrCallback: () {
            Navigator.pushNamed(context, '/singlenoteTranscript');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}
