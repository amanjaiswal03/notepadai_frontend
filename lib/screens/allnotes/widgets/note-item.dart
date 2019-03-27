import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class noteItem extends StatefulWidget {
  final String title;
  final String text;

  noteItem({Key key, @required this.title, this.text}) : super(key: key);
  @override
  _noteItemState createState() => _noteItemState(this.title, this.text);

}


class _noteItemState extends State<noteItem> {

  String _title;
  String _text;
  _noteItemState(this._title, this._text);

  @override
  Widget build(BuildContext context) {
    this._title = "hey";
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.event_note, color: Colors.black),
            ),
            title: Text(
              this._title,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Text(new DateFormat('dd/MM yy').format(new DateTime.now()), style: TextStyle(color: Colors.black)
                ),
                Spacer(),
                Icon(Icons.access_time, color: Colors.black, size: 10.0),
                Text(" "+new Duration(minutes:3, seconds:2).inMinutes.toString()+":"+new Duration(seconds:2).inSeconds.toString(), style: TextStyle(color: Colors.black))
              ],
            ),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.black54, size: 24.0)),
      ),
    );
  }
}
