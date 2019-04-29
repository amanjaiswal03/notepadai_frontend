import 'package:flutter/material.dart';
import 'widgets/custom_float.dart';
import 'widgets/transcript.dart';
import 'widgets/bulletPointlist.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';
import 'dart:convert';

class singlenoteTranscript extends StatefulWidget {
  final String title;
  final String text;
  var note;
  singlenoteTranscript({Key key, this.title, this.text, this.note}) : super(key: key);
  @override
  _singlenoteTranscriptState createState() {
    return new _singlenoteTranscriptState();
  }
}

class _singlenoteTranscriptState extends State<singlenoteTranscript> {
  // ZefyrController _controller;
  FocusNode _focusNode;
  bool _edit = false;
  ZefyrController _controller;
  NotusDocument document;

  @override
  void initState() {
    super.initState();
    // Create an empty document or load existing if you have one.
    var doc = new Delta()..insert('Hello world', {'b': true});
    var change = new Delta()
      ..retain(6)
      ..delete(5)
      ..insert('Earth');
    var result = doc.compose(change);
    print('Original document:\n$doc\n');
    print('Change:\n$change\n');
    print('Updated document:\n$result\n');
    document = new NotusDocument.fromDelta(result);
    _controller = new ZefyrController(document);
    _focusNode = new FocusNode();
    _edit = false;
  }


  Widget Editor() {
    final form = ListView(
      children: <Widget>[
        buildEditor(),
      ],
    );

    return ZefyrScaffold(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: form,
      ),
    );
  }

  Widget buildEditor() {
    final theme = new ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.white,
        toggleColor: Colors.black54,
        iconColor: Colors.black54,
        disabledIconColor: Colors.grey.shade500,
      ),
    );

    return ZefyrTheme(
      data: theme,
      child: ZefyrField(
        height: 500.0,
        decoration: InputDecoration(),
        controller: _controller,
        focusNode: _focusNode,
        autofocus: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }

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
            bottom: _edit ? null : TabBar(
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
          body: _edit ? Editor() : TabView(),
        ),
      ),
      floatingActionButton: CustomFloat(
        icon: _edit ? Icons.save : Icons.edit,
        qrCallback: () {
          // edit bulletpointlist
          setState(() {
            _edit = !_edit;
          });
          //get text from edit
          print('here comes the document content');
          JsonEncoder encoder = new JsonEncoder.withIndent('  ');
          String prettyprint = encoder.convert(document.toJson());
          print(prettyprint);
        },
      ),
    );
  }

  Widget TabView () {
    return TabBarView(
      children: [
        new bulletPointlist(),
        new transcript(widget.note["text"])
      ],
    );
  }
}
