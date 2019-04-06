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
  Widget _search;
  void initState() {
    super.initState();
    _search = nonSearchingMode();
  }
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
                              Container(
                                child: _search,
                              )
                              /*
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 32,
                              ), */
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
            child: ListViewTranscripts()
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


  Widget nonSearchingMode () {
    return GestureDetector(
      onTap: () {
        setState(() {
          _search = this.searchingMode();
        });
        print("change to searchingmode");
        print(this._search);

      },
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 32,
      ),
    );

  }

  Widget searchingMode () {
    return Expanded(
      child: Container(
        decoration: new BoxDecoration(
              color: Color(0xFFFEFEFE).withOpacity(0.6),
              borderRadius: BorderRadius.circular(6.0),
        ),
        margin: EdgeInsets.all(12),
        child: Container(
          padding: EdgeInsets.all(6),
          child:  Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: ""),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  )
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this._search = this.nonSearchingMode();
                  });
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 32,
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
