import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:notepadai_app/src/client.dart';
import 'package:mic_stream/mic_stream.dart';

class CustomFloat extends StatelessWidget {
  final IconData icon;
  final Widget builder;
  final VoidCallback qrCallback;
  final isMini;
  StreamSubscription<Uint8List> listener;

  CustomFloat({this.icon, this.builder, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: () {
        Stream<Uint8List> stream = microphone().asBroadcastStream();
        listener = stream.listen((samples) => null);
        Stream<String> response = new Client().transcriptAudio(stream);
      },
      child: Ink(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
              // new Color.fromRGBO(103, 218, 255, 1.0),
              // new Color.fromRGBO(3, 169, 244, 1.0),
              // new Color.fromRGBO(0, 122, 193, 1.0),
              Colors.blue,
              Colors.blue,
            ])),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            builder != null
                ? Positioned(
              right: 7.0,
              top: 7.0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: builder,
                radius: 10.0,
              ),
            )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}
