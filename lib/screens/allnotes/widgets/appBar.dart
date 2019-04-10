import 'package:flutter/material.dart';
class appBar extends StatefulWidget {
  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {

  bool _searchingModeEnabled = false;

  void initState() {
    super.initState();
    _searchingModeEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container (
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
                            child: _searchingModeEnabled ? this.searchingMode() : nonSearchingMode(),
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
    );
  }

  Widget nonSearchingMode () {
    return GestureDetector(
      onTap: () {
        setState(() {
          _searchingModeEnabled = true;
        });
        print("change to searchingmode");
        print(_searchingModeEnabled);
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
                        _searchingModeEnabled = false;
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
