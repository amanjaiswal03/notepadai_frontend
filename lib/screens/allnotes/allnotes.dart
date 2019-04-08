import 'package:flutter/material.dart';
import 'widgets/bottomBar.dart';
import 'package:notepadai_app/screens/allnotes/widgets/custom_float.dart';
import 'package:notepadai_app/screens/allnotes/widgets/list.dart';
import 'package:notepadai_app/screens/allnotes/widgets/appBar.dart';

class allnotes extends StatefulWidget {
  allnotes({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _allnotesState createState() => _allnotesState();
}

class _allnotesState extends State<allnotes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Color(0xFFF2EEEE),
      body: Column(
        children: <Widget>[
          // appbar
          appBar(),
          // content
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
}
