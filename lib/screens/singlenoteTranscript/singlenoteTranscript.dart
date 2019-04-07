import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'widgets/custom_float.dart';
import 'widgets/transcript.dart';
import 'widgets/searchbar.dart';
import 'widgets/bottomBar.dart';
import 'widgets/bulletPointlist.dart';

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
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back, size: 32,),
                    onPressed: () { Navigator.pushNamed(context, '/allnotes'); },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              backgroundColor: Color(0xFF354CD3),
              bottom: TabBar(
                labelPadding: EdgeInsets.all(4.0),
                tabs: [
                  Text("Notes", style: TextStyle(fontSize: 22)),
                  Text("Transcript", style: TextStyle(fontSize: 22)),
                ],
              ),
              title: Container(
                margin: EdgeInsets.only(top: 2.0, right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Biology: Mitosis"),
                    Text("Created:", style: TextStyle(fontSize: 12),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("2 days ago - 6:11 PM", style: TextStyle(fontSize: 14),),
                        Text("Duration: 40:10", style: TextStyle(fontSize: 14),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                new bulletPointlist(),
                new transcript(widget.text)
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFloat(
          icon: Icons.edit,
          qrCallback: () {
            // edit bulletpointlist
          },
        ),
    );
  }
}
