import 'package:flutter/material.dart';
class transcript extends StatefulWidget {
  @override
  _transcriptState createState() => _transcriptState();
}

class _transcriptState extends State<transcript> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(16.0),//Top, Right, Bottom, Left
        child: new Row(
          children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    child: new Text ('0:01:'),
                  )
                ],
              ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                  //Need to add space below this Text ?
                  new Text("This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter,C This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter, This channel contains tutorial videos in Flutter,"
                  "React Native, React, Angular",
                  style: new TextStyle(
                  color: Colors.grey[850],
                  fontSize: 16.0
                  ),
                ),
              ],
            ),
          ),
          ],
        )
    );
  }
}
