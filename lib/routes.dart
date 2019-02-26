import 'package:flutter/material.dart';
import 'screens/homePage/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/HomePage': (BuildContext context) => new HomePage()
  };

  Routes() {
    runApp(new MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      home: new HomePage(),
    ));
  }
}