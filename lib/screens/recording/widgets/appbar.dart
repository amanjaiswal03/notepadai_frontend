import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class appbar extends StatefulWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(kToolbarHeight+16);
  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: PreferredSize(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                      "new note",
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                  ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      DateFormat('dd/MM yy').format(new DateTime.now()),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    Row (
                      children: <Widget>[
                        Icon(Icons.access_time, color: Colors.white, size: 16),
                        Text(
                          " "+DateFormat('kk:mm').format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        preferredSize: Size(0.0, 80.0),
      ),
    );
  }
}
