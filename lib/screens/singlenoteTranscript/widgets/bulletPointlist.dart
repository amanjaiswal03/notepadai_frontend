import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
class bulletPointlist extends StatefulWidget {
  @override
  _bulletPointlistState createState() => _bulletPointlistState();
}

class _bulletPointlistState extends State<bulletPointlist> {
  final testData = ["I don’t know what else to type", "Today, we will cover Myosis.", "Programming is like magic", "run sudo -Rf /*"];
  @override
  Widget build(BuildContext context) {
    final _markDownData = testData.map((x) => "- $x\n").reduce((x, y) => "$x$y");
    return new Container(
        margin: EdgeInsets.all(12.0),
        child: Markdown(data: _markDownData)
    );
  }
}
