import 'package:flutter/material.dart';
import 'package:notepadai_app/screens/homePage/index.dart';
import 'package:notepadai_app/screens/favorites/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new HomePage(title: "string"),
    '/favorites': (BuildContext context) => new favorites(title: "favorites")
  };

  Routes() {

    runApp(MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: routes,
    ));
  }
}