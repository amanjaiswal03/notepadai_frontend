///
//  Generated code. Do not modify.
//  source: audioStream.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/grpc.dart' as $grpc;
import 'audioStream.pb.dart';
export 'audioStream.pb.dart';

class AudioProcessorClient extends $grpc.Client {
  static final _$transcriptAudio = new $grpc.ClientMethod<Sample, Sentence>(
      '/AudioProcessor/TranscriptAudio',
      (Sample value) => value.writeToBuffer(),
      (List<int> value) => new Sentence.fromBuffer(value));

  AudioProcessorClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<Sentence> transcriptAudio(
      $async.Stream<Sample> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$transcriptAudio, request, options: options);
    return new $grpc.ResponseStream(call);
  }
}

abstract class AudioProcessorServiceBase extends $grpc.Service {
  String get $name => 'AudioProcessor';

  AudioProcessorServiceBase() {
    $addMethod(new $grpc.ServiceMethod<Sample, Sentence>(
        'TranscriptAudio',
        transcriptAudio,
        true,
        true,
        (List<int> value) => new Sample.fromBuffer(value),
        (Sentence value) => value.writeToBuffer()));
  }

  $async.Stream<Sentence> transcriptAudio(
      $grpc.ServiceCall call, $async.Stream<Sample> request);
}
