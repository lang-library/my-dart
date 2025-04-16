#! /usr/bin/env -S my.dart run

import 'dart:core';
import 'dart:convert' as convert;
import 'package:embed_annotation/embed_annotation.dart';
import 'package:misc/misc.dart'as misc;

part 'embed-resource.g.dart';

final logger = misc.$globalLogger;

@EmbedLiteral('../pubspec.yaml')
const pubspec = _$pubspec;

@EmbedStr('../pubspec.yaml')
const pubspecStr = _$pubspecStr;

@EmbedBinary('../pubspec.yaml', base64: true)
const pubspecBin = _$pubspecBin;

@EmbedLiteral('config.json')
const config = _$config;

void main(List<String> args) async {
  print('Hello World!!');
  print('ハロー©');
  logger.i(pubspec.name);
  final $str = convert.utf8.decode(convert.base64.decode(pubspecBin));
  misc.dump($str, '\$str');
  misc.echo($str, '\$str');
}
