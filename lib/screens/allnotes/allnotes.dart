import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notepadai_app/main.dart';
import 'widgets/bottomBar.dart';
import 'package:notepadai_app/screens/allnotes/widgets/custom_float.dart';
import 'package:notepadai_app/screens/allnotes/widgets/list.dart';

class allnotes extends StatefulWidget {
  allnotes({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _allnotesState createState() => _allnotesState();
}

class _allnotesState extends State<allnotes> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        primary: true,
      backgroundColor: Color(0xFFF2EEEE),
      body: Column(
        children: <Widget>[
          Container (
            color: Color(0xFF354CD3),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(top: statusBarHeight, left: 12, right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  "All Notes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24
                                  )
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 32,
                              ),
                            ],
                          )
                        ],
                      )
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: new ListViewTranscripts(),
          ),
        ],
      ),


      bottomNavigationBar: new bottomBar(),
      floatingActionButton: CustomFloat(
        icon: Icons.mic,
        qrCallback: () {
          Navigator.pushNamed(context, '/recording');
        },
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}
