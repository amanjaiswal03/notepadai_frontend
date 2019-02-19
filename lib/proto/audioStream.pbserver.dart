///
//  Generated code. Do not modify.
//  source: audioStream.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;
import 'audioStream.pb.dart';
import 'audioStream.pbjson.dart';

export 'audioStream.pb.dart';

abstract class AudioProcessorServiceBase extends $pb.GeneratedService {
  $async.Future<Sentence> transcriptAudio($pb.ServerContext ctx, AudioChunk request);

  $pb.GeneratedMessage createRequest(String method) {
    switch (method) {
      case 'TranscriptAudio': return new AudioChunk();
      default: throw new ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'TranscriptAudio': return this.transcriptAudio(ctx, request);
      default: throw new ArgumentError('Unknown method: $method');
    }
  }

  Map<String, dynamic> get $json => AudioProcessorServiceBase$json;
  Map<String, Map<String, dynamic>> get $messageJson => AudioProcessorServiceBase$messageJson;
}

