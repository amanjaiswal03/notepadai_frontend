import 'package:flutter/material.dart';
import 'package:notepadai_app/screens/allnotes/index.dart';
import 'package:notepadai_app/screens/recording/index.dart';
import 'package:notepadai_app/screens/singlenoteTranscript/index.dart';


class ScreenArguments {
  final String title;
  final String text;

  ScreenArguments(this.title, this.text);
}

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context)                     => new allnotes(title: "allnotes"),
    '/allnotes': (BuildContext context)             => new allnotes(title: "allnotes"),
    '/recording': (BuildContext context)            => new recording(title: "recording")
  };

  Routes() {

    runApp(MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: routes,
        onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == "/singlenoteTranscript") {
          // Cast the arguments to the correct type: ScreenArguments.
          final Map args = settings.arguments;
          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return MaterialPageRoute(
            builder: (context) {
              print("route args");
              print(args);
              return singlenoteTranscript(
                title: args["title"],
                text: args["text"],
                note: {'text': args['text'], 'title': args['title']},
              );
            },
          );
        }
        return null;
      }
    ));
  }
}