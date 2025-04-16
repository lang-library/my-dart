#! /usr/bin/env -S my.dart run
import 'dart:core';
import 'dart:io' as io;
import 'package:path/path.dart' as path;
import 'package:misc/misc.dart' as misc;

final $logger = misc.$globalLogger;

void main(List<String> args) async {
  $logger.i('ハロー©');
  misc.echo('from echo', 'title');
  String? $home = io.Platform.environment['HOME'];
  print('\$home=${$home}');
  Map<String, String> $env = io.Platform.environment;
  $env.forEach((k, v) => print('Key=$k Value=$v'));
  final $dir = io.Directory(path.join($home!, 'cmd'));
  final List<io.FileSystemEntity> $entities = await $dir.list().toList();
  for (var $x in $entities) {
    print(path.basename($x.path));
    print(path.basenameWithoutExtension($x.path));
  }
  final Iterable<io.File> $files = $entities.whereType<io.File>();
  $logger.i('[ONLY FILES]');
  $files.toList().forEach((x) {
    print(path.basename(x.path));
    print(path.basenameWithoutExtension(x.path));
  });
  io.Directory.current = path.join($home, 'dart');
  final $dartDir = io.Directory('.');
  final List<io.FileSystemEntity> dartDirEntities =
      await $dartDir.list().toList();
  $logger.i(dartDirEntities);
  dartDirEntities.toList().forEach(($x) {
    misc.echo(path.basename($x.path), r'path.basename($x.path)');
  });

  // var result = await io.Process.run('ping', ['-n', '2', 'www.youtube.com']);
  // io.stdout.write(result.stdout);
  // io.stderr.write(result.stderr);

  // var process = await io.Process.start('ping', ['-n', '10', 'www.youtube.com']);
  // io.stdout.addStream(process.stdout);
  // io.stderr.addStream(process.stderr);

  // misc.wsystem('ping -n 10 www.youtube.com');
  misc.command('ping', ['-n', '10', 'www.youtube.com']);
}
