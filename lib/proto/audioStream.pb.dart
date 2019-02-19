///
//  Generated code. Do not modify.
//  source: audioStream.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;
// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

class AudioChunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('AudioChunk')
    ..a<List<int>>(1, 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AudioChunk() : super();
  AudioChunk.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AudioChunk.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AudioChunk clone() => new AudioChunk()..mergeFromMessage(this);
  AudioChunk copyWith(void Function(AudioChunk) updates) => super.copyWith((message) => updates(message as AudioChunk));
  $pb.BuilderInfo get info_ => _i;
  static AudioChunk create() => new AudioChunk();
  AudioChunk createEmptyInstance() => create();
  static $pb.PbList<AudioChunk> createRepeated() => new $pb.PbList<AudioChunk>();
  static AudioChunk getDefault() => _defaultInstance ??= create()..freeze();
  static AudioChunk _defaultInstance;
  static void $checkItem(AudioChunk v) {
    if (v is! AudioChunk) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<int> get chunk => $_getN(0);
  set chunk(List<int> v) { $_setBytes(0, v); }
  bool hasChunk() => $_has(0);
  void clearChunk() => clearField(1);
}

class Sentence extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Sentence')
    ..aOS(1, 'msg')
    ..hasRequiredFields = false
  ;

  Sentence() : super();
  Sentence.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Sentence.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Sentence clone() => new Sentence()..mergeFromMessage(this);
  Sentence copyWith(void Function(Sentence) updates) => super.copyWith((message) => updates(message as Sentence));
  $pb.BuilderInfo get info_ => _i;
  static Sentence create() => new Sentence();
  Sentence createEmptyInstance() => create();
  static $pb.PbList<Sentence> createRepeated() => new $pb.PbList<Sentence>();
  static Sentence getDefault() => _defaultInstance ??= create()..freeze();
  static Sentence _defaultInstance;
  static void $checkItem(Sentence v) {
    if (v is! Sentence) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get msg => $_getS(0, '');
  set msg(String v) { $_setString(0, v); }
  bool hasMsg() => $_has(0);
  void clearMsg() => clearField(1);
}

class AudioProcessorApi {
  $pb.RpcClient _client;
  AudioProcessorApi(this._client);

  $async.Future<Sentence> transcriptAudio($pb.ClientContext ctx, AudioChunk request) {
    var emptyResponse = new Sentence();
    return _client.invoke<Sentence>(ctx, 'AudioProcessor', 'TranscriptAudio', request, emptyResponse);
  }
}

