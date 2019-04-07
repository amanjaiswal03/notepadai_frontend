import 'package:flutter/material.dart';
class noteItem extends StatefulWidget {
  Map note;
  noteItem({this.note});
  @override
  _noteItemState createState() => _noteItemState();
}

class _noteItemState extends State<noteItem> {

  bool _expanded;

  void initState() {
    super.initState();
    _expanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2),
          /* box shadow
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(100.0),
              boxShadow: [
            new BoxShadow(
              color: Color(0xFF2F4DFF).withOpacity(0.4),
              blurRadius: 10.0,
              offset: new Offset(0, 0),
            ),
          ]), */
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Card(
                  // rounded borders
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            this.cardLeftSide(),
                            Expanded( /* right site */
                                child: new Container(
                                    color: Colors.white10,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _expanded = !_expanded;
                                              });
                                            },
                                            child: Icon(
                                                _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                                size: 38,
                                                color: Color(0xFF666666)
                                            )
                                        ),
                                      ],
                                    )
                                )
                            )
                          ],
                        ),
                        _expanded ? Container(
                          margin: EdgeInsets.only(top: 6, right: 24, left: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Created:",
                                    style: TextStyle(fontSize: 12, color: Color(0xFF000000).withOpacity(0.5)),
                                  ),
                                  Text(
                                    "2 days ago",
                                    style: TextStyle(fontSize: 12, color: Color(0xFF000000).withOpacity(0.5)),
                                  )
                                ],
                              ),
                              Text(
                                "Duration 40:10",
                                style: TextStyle(fontSize: 12, color: Color(0xFF000000).withOpacity(0.5)),
                              ),
                            ],
                          )
                        ) : Container()
                      ],
                    )
                  )
              )
            ),
          ],
        )
      );
  }

  Widget cardLeftSide() {
    return Expanded( /* left site */
      child: new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      // tag
                      Container(
                          padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffE0E0E0),
                            borderRadius: new BorderRadius.circular(32.0),
                          ),
                          child: Text("Biology")
                      ),
                      Text(
                        widget.note["title"]+widget.note["id"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: "Rubik",
                            fontSize: 24
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          )
      ),
    );
  }

  Widget cardRightSide() {

  }
}
