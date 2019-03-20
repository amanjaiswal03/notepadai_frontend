import 'package:flutter/material.dart';

class bottomBar extends StatefulWidget {
  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: CircularNotchedRectangle(),
      child: Ink(
        height: 50.0,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              // new Color.fromRGBO(103, 218, 255, 1.0),
              // new Color.fromRGBO(3, 169, 244, 1.0),
              // new Color.fromRGBO(0, 122, 193, 1.0),
              Colors.blue,
              Colors.blue,
            ])),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              child: new InkWell(
                radius: 10.0,
                splashColor: Colors.yellow,
                onTap: () {
                  Navigator.pushNamed(context, '/allnotes');
                },
                child: Center(
                    child: Row(
                      children: <Widget>[
                        Text("all notes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )
                ),
              ),
            ),
            new SizedBox(
              width: 20.0,
            ),
            SizedBox(
              height: double.infinity,
              child: new InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                radius: 10.0,
                splashColor: Colors.yellow,
                child: Center(
                  child: Center(
                      child: Row(
                        children: <Widget>[
                          new Text(
                            "Settings",
                            style: new TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
