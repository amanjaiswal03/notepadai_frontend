import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class noteItem extends StatefulWidget {
  @override
  _noteItemState createState() => _noteItemState();
}

class _noteItemState extends State<noteItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile,
      ),
    );
  }
  final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.event_note, color: Colors.black),
      ),
      title: Text(
        "Biology Lecture",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Text(new DateFormat('dd/MM yy').format(new DateTime.now()), style: TextStyle(color: Colors.black)
      ),
          Spacer(),
          Icon(Icons.access_time, color: Colors.black, size: 10.0),
          Text(" 10 min", style: TextStyle(color: Colors.black))
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.black54, size: 24.0));
}
