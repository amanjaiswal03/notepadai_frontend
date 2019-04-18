import 'dart:async';

import 'package:permission/permission.dart';

import 'package:flutter/services.dart';

const EventChannel _transcriptEventChannel = EventChannel('aaron.code.com/notepadai_app/speech');

Permissions _permission;
Stream<dynamic> _transcript;

/// Permission Handling
Future<bool> get permissionStatus async {
  _permission = (await Permission.getPermissionsStatus([PermissionName.Microphone, PermissionName.Storage])).first;
  if (_permission.permissionStatus != PermissionStatus.allow) _permission = (await Permission.requestPermissions([PermissionName.Microphone, PermissionName.Storage])).first;
  return (_permission.permissionStatus == PermissionStatus.allow);
}

/// Returns Response Stream if entered json credentials file is valid
Stream<dynamic> transcript(String credentialsJson) async* {
  if (!(await permissionStatus)) throw (PlatformException);
  if (_transcript == null) _transcript = _transcriptEventChannel
      .receiveBroadcastStream([credentialsJson]);
  yield* _transcript;
}