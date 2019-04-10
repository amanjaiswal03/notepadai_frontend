import 'package:flutter/material.dart';
import 'widgets/transcript.dart';
import 'widgets/appBar.dart';

class recording extends StatefulWidget {
  recording({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _recordingState createState() => _recordingState();
}

class _recordingState extends State<recording> {

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        primary: true,
        backgroundColor: Color(0xFFF2EEEE),
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
                    Text("Today - 6:11 PM", style: TextStyle(fontSize: 14),),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            // content
            Container(
              height: 100,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/sound-frequency.png'),
                  Text(
                    'Recording',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      )
                    )
                ],
              )
            ),
            Expanded(
              child: transcript()
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              
              IconButton(icon: Icon(Icons.pause, color: Colors.blueAccent, size: 36.0 ), onPressed: () {},),
              IconButton(icon: Icon(Icons.stop, color: Colors.blueAccent, size: 36.0 ), onPressed: () {},),
            ],
          )
          
        ),
    );
  }
}
