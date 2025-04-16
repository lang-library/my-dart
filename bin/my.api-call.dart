#! /usr/bin/env -S my.dart run
import 'dart:core';
import 'package:misc/misc.dart' as misc;

void main(List<String> args) async {
  misc.dump(misc.isInDebugMode, 'isInDebugMode');
  if (misc.isInDebugMode) {
    args = ['x', 'y', 'z'];
  }
  misc.dump(args, 'args');
  final $api = misc.NativeJsonApi('PROGRAM.dll');
  try{
    $api.call('system', ['ping', '-n', '2', 'www.youtube.com']);
    print($api.call('add2', [11, 22]));
    print($api.call('add2', [11, 22, 33]));
  } catch (e, stacktrace) {
    print('Exception: $e');
    print('Stacktrace: $stacktrace');
  }
}
