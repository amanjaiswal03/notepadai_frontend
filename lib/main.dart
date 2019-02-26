import 'package:flutter/material.dart';
import 'package:notepadai_app/routes/homescreen.dart';
import 'dart:async';
import 'package:notepadai_app/design elements/DiamondBorder.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:notepadai_app/proto/audioStream.pbgrpc.dart';
import 'package:notepadai_app/proto/audioStream.pb.dart';
import 'package:grpc/grpc.dart';
import 'routes.dart';

/* NotepadAI
  Copy of base application example provided by Google
 */

//TODO: Move to corresponding class
const int PORT = 12345;
const String HOSTNAME = "127.0.0.1";
const Color MAIN_COLOR = Colors.cyan;


// Main function running the class containing the whole project
void main () {
  new Routes();
}

// Starting screen upon run
