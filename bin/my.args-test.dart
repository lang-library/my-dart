#! /usr/bin/env -S my.dart run
import 'dart:core';
import 'package:misc/misc.dart' as misc;
import 'package:args/args.dart' as args;

// 【Dart】コマンドライン引数解析ライブラリargsを試す https://zenn.dev/slowhand/articles/7ca7a2250b65a3
void main(List<String> $args) async {
  misc.dump(misc.isInDebugMode, 'isInDebugMode');
  if (misc.isInDebugMode) {
    //$args = ['-m', 'debug', '-v', 'commit', '-a', 'A', 'B', 'C'];
    $args = ['-m', 'debug', '-v', 'commit', '-a', '-b', 'A', 'B', 'C'];
  }
  misc.dump($args, '\$args');
  try {
    var parser = args.ArgParser();
    parser.addOption('mode', abbr: 'm', allowed: ['debug', 'release']);
    parser.addFlag('verbose', abbr: 'v', defaultsTo: true);

    // command: commit
    var command = parser.addCommand('commit');
    command.addFlag('all', abbr: 'a');

    var results = parser.parse($args);
    print('mode: ${results['mode']}');
    print('verbose: ${results['verbose']}');
    var commandResults = results.command;
    if (commandResults != null) {
      print('command: ${commandResults.name}');
      print('command --all: ${commandResults['all']}');
      print(commandResults.arguments);
      print(commandResults.rest);
    }
  } catch ($e, $stacktrace) {
    misc.dump($e, 'Exception');
    misc.dump($stacktrace, 'Stacktrace');
  }
}
