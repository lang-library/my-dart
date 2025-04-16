#! /usr/bin/env -S dart
import 'dart:core';
import 'package:misc/misc.dart' as misc;
import 'package:args/args.dart' as args;

// 【Dart】コマンドライン引数解析ライブラリargsを試す https://zenn.dev/slowhand/articles/7ca7a2250b65a3
void main(List<String> $args) async {
  //misc.dump(misc.isInDebugMode, 'isInDebugMode');
  if (misc.isInDebugMode) {
    $args = [
      'run',
      r'D:\home11\dart\hello\bin\my.api-call.dart',
      'a',
      'b',
      'cハロー©',
    ];
    //$args = ['run', r'D:\home11\dart\hello\bin\my.api-call.dart'];
    //$args = ['run', r'D:\home11\dart\hello\bin\my.api-call.dart', 'abc'];
    //$args = ['run'];
  }
  //misc.dump($args, '\$args');
  try {
    var $parser = args.ArgParser();
    var $command = $parser.addCommand('run');
    $command.addFlag('all', abbr: 'a');
    var $results = $parser.parse($args);
    var $commandResults = $results.command;
    if ($commandResults == null) {
      throw 'Valid command not specified';
    }
    switch ($commandResults.name) {
      case 'run':
        {
          run($commandResults);
        }
    }
  } catch ($e, $stacktrace) {
    misc.dump($e, 'Exception');
    misc.dump($stacktrace, 'Stacktrace');
  }
}

void run(args.ArgResults $commandResults) {
  //misc.echo($commandResults.name, 'command name');
  //misc.echo($commandResults['all'], "\$commandResults['all']");
  //misc.echo($commandResults.rest, '\$commandResults.rest');
  if ($commandResults.rest.isEmpty) {
    throw 'File name count is ${$commandResults.rest.length}: ${$commandResults.rest}';
  }
  String $filePath = $commandResults.rest[0];
  //misc.echo($filePath, '\$fileName');
  $filePath = misc.pathFullName($filePath);
  //misc.echo($filePath, '\$fileName');
  String $projDir = misc.pathDirectoryName(misc.pathDirectoryName($filePath));
  //misc.echo($projDir, '\$projDir');
  String $cwd = misc.getCwd();
  //misc.echo($cwd, '\$cwd');
  misc.setCwd($projDir);
  misc.tryCommand('dart', ['pub', 'get']);
  misc.setCwd($cwd);
  misc.tryCommand('dart', $commandResults.rest.toList());
}
