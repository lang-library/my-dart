import 'dart:core';
import 'dart:io' as io;
import 'package:output/output.dart';
import 'package:sys/sys.dart' as sys;
import 'package:winsys/winsys.dart' as winsys;
import 'package:args/args.dart' as args;

// 【Dart】コマンドライン引数解析ライブラリargsを試す https://zenn.dev/slowhand/articles/7ca7a2250b65a3
void main(List<String> $args) async {
  //dump(misc.isInDebugMode, 'isInDebugMode');
  if (sys.isInDebugMode) {
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
    dump($e, 'Exception');
    dump($stacktrace, 'Stacktrace');
  }
}

void run(args.ArgResults $commandResults) {
  if ($commandResults.rest.isEmpty) {
    throw 'File name count is ${$commandResults.rest.length}: ${$commandResults.rest}';
  }
  String $filePath = $commandResults.rest[0];
  $filePath = sys.pathFullName($filePath);
  String $projDir = sys.pathDirectoryName($filePath);
  String $cwd = sys.getCwd();
  sys.setCwd($projDir);

  dump($projDir, r'$projDir');
  List<String> generatedFiles = sys.pathDirectories('./lib');
  dump(generatedFiles, 'generatedFiles');
  generatedFiles = generatedFiles.where(($x) => $x.endsWith('.g.dart')).toList();
  dump(generatedFiles, 'generatedFiles');

  winsys.tryCommand('dart', ['pub', 'get']);
  sys.setCwd($cwd);
  int $exitCode = winsys.command('dart', $commandResults.rest.toList());
  echo($exitCode, '\$exitCode');
  io.exit($exitCode);
}
