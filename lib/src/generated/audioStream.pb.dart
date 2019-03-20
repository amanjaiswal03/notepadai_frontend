///
//  Generated code. Do not modify.
//  source: audioStream.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

class Samples extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Samples')
    ..a<List<int>>(1, 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Samples() : super();
  Samples.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Samples.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Samples clone() => new Samples()..mergeFromMessage(this);
  Samples copyWith(void Function(Samples) updates) => super.copyWith((message) => updates(message as Samples));
  $pb.BuilderInfo get info_ => _i;
  static Samples create() => new Samples();
  Samples createEmptyInstance() => create();
  static $pb.PbList<Samples> createRepeated() => new $pb.PbList<Samples>();
  static Samples getDefault() => _defaultInstance ??= create()..freeze();
  static Samples _defaultInstance;

  List<int> get chunk => $_getN(0);
  set chunk(List<int> v) { $_setBytes(0, v); }
  bool hasChunk() => $_has(0);
  void clearChunk() => clearField(1);
}

class Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Response')
    ..aOS(1, 'word')
    ..hasRequiredFields = false
  ;

  Response() : super();
  Response.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Response.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Response clone() => new Response()..mergeFromMessage(this);
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response));
  $pb.BuilderInfo get info_ => _i;
  static Response create() => new Response();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => new $pb.PbList<Response>();
  static Response getDefault() => _defaultInstance ??= create()..freeze();
  static Response _defaultInstance;

  String get word => $_getS(0, '');
  set word(String v) { $_setString(0, v); }
  bool hasWord() => $_has(0);
  void clearWord() => clearField(1);
}

