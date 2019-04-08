import 'package:flutter/material.dart';
class transcript extends StatefulWidget {
  final String text;
  transcript(this.text);
  @override
  _transcriptState createState() => _transcriptState();
}

class _transcriptState extends State<transcript> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      padding: new EdgeInsets.all(24),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text ('0:10:'),
                      )
                    ],
                  ),
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Text(widget.text,
                            style: new TextStyle(
                                color: Colors.grey[850],
                                fontSize: 16.0
                            ),
                          ),
                        )
                      ],
                  ),
                ],
              )
            ]
        ),
    );
  }
}
