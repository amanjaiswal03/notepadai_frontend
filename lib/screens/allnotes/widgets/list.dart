import 'package:flutter/material.dart';
import 'package:notepadai_app/screens/allnotes/widgets/note-card.dart';
import 'package:notepadai_app/models/Note.dart';
import 'dart:async';

Future<List<Map>> fetchNotesFromDatabase() async {
  return Note().getNotes();
}

class ListViewTranscripts extends StatefulWidget {
  @override
  _ListViewTranscriptsState createState() => _ListViewTranscriptsState();
}


class _ListViewTranscriptsState extends State<ListViewTranscripts> {

  @override
  initState(){
    super.initState();
    _db.init();
    _db.values['Note']['title'] = "hey";
    _db.values['Note']['text'] = "My transcript";
    _db.save().then((saved) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(saved ? "Data saved successfully" : "Data not saved!"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change!
          },
        ),
      ));
    });
  }

  Note _db = Note();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<Map>>(
      future: fetchNotesFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return new Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Column(
                    children: <Widget>[
                      new GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/singlenoteTranscript', arguments: snapshot.data[index]);
                          },
                          // new noteItem(title: snapshot.data[index]["title"], text: snapshot.data[index]["text"]) --old item
                          child: new noteItem()
                      )
                    ]
                ),
              );
            }
          );
        }
      },
    );
  }
}
