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
        height: 65.0,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              // new Color.fromRGBO(103, 218, 255, 1.0),
              // new Color.fromRGBO(3, 169, 244, 1.0),
              // new Color.fromRGBO(0, 122, 193, 1.0),
             Color(0xFFFFFFFF),
             Color(0xFFFFFFFF)
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
                  Navigator.pushNamed(context, '/');
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.dashboard),
                      new Text(
                        "Categorize",
                        style: new TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.settings),
                        new Text(
                          "Settings",
                          style: new TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
