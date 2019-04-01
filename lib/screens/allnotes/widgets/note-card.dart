import 'package:flutter/material.dart';
class noteItem extends StatefulWidget {
  @override
  _noteItemState createState() => _noteItemState();
}

class _noteItemState extends State<noteItem> {
  @override
  Widget build(BuildContext context) {
    return
      new Container(
        height: 95,
          // box shadow
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(100.0),
              boxShadow: [
            new BoxShadow(
              color: Color(0xFF2F4DFF).withOpacity(0.4),
              blurRadius: 10.0,
              offset: new Offset(0, 5),
            ),
          ]),
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
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded( /* left site */
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
                                            "Mitosis",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "Rubik",
                                                fontSize: 24
                                            ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                        ),
                        Expanded( /* right site */
                          child: new Container(
                            color: Colors.white10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 38,
                                    color: Color(0xFF666666)
                                )
                              ],
                            )
                          )
                        )
                      ],
                    ),

                  )
              )
            ),
          ],
        )
      );
  }
}
