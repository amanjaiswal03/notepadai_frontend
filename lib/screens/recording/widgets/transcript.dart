import 'package:flutter/material.dart';
class transcript extends StatefulWidget {
  @override
  _transcriptState createState() => _transcriptState();
}

class _transcriptState extends State<transcript> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(20.0),//Top, Right, Bottom, Left
          child: new Row(
            children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.all(10.0),
                      child: new Text ('0:01: '),
                    )
                  ],
                ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                    //Need to add space below this Text ?
                    new Text("There has been some sort of change in the syllabus. Today, we will be covering Myosis."
  "According",
                    style: new TextStyle(
                    color: Colors.black,
                    fontSize: 16.0
                    ),
                  ),
                ],
              ),
            ),
            ],
          )
        )
    );
  }
}
