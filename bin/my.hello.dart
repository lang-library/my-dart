#! /usr/bin/env -S my.dart run
import 'dart:core';
import 'package:misc/misc.dart' as misc;

final logger = misc.$globalLogger;

void main(List<String> args) async {
  logger.i('ハロー©');
  misc.echo('ハロー©', 'タイトル©');
  var a = 1; // varで変数定義
  print(a);
  a = 2;
  print('\$で変数の値を埋め込み、$a');
  // dartのbuild-in型（明示的な型宣言変数）
  int b = 10;
  double c = 12.3;
  String d = 'abc';
  bool e = true;
  print('$b, $c, $d, $e');
  List f = [1, 2, 3]; // 配列
  f.add(4); // 末尾追加
  f.add(4);
  print('$f, ${f.length}, ${f[0]}');
  Set g = {'a', 'b', 'c'}; // 重複を許さない配列
  g.add('d'); // 末尾追加
  g.add('d'); // 重複して入ることはない
  print('$g, ${g.length}, ${g.toList()[1]}'); // 配列に変換するときはtoListを使う
  // Key/Valueペア
  Map h = {
    // Key: Value
    'first': 'one',
    'second': 'two',
    'third': 'three',
  };
  h.addAll({'fourth': 'four'});
  print('$h, ${h.length}, ${h['first']}'); // Keyでアクセス

  // ルーン文字は、文字列のUTF-32コードポイント。\uで文字を指定する
  // 絵文字の表示に使える
  Runes i = Runes(
    '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}',
  );
  print(String.fromCharCodes(i));

  // Symbolオブジェクトは、Dartプログラムで宣言された演算子または識別子を表します。
  // コンパイル時にAPI名などは変更されてしまうが、Symbolは変更されないため、API参照などの識別に使える
  // ただし、dartライブラリなどの作成者でない限り、ほぼ使う機会はない
  // #で始まる
  #hogehoge;

  // Dartは強く型付けされていますが、Dartは型を推論できるので型注釈はオプションです。
  // 次のコードで、数値はint型であると推論されます。型が想定されていないことを明示的に示したい場合は、特殊な型dynamicを使用します。
  // any型、スクリプト言語の変数と同じような性質を持つ
  dynamic j = 10;
  j = 'a'; // dynamicだと途中で別の型のデータも格納できる
  print(j);

  // varの場合は初期化時の型推論が働くので途中で違う型を入れようとするとエラーになる
  // var j = 0;
  // j = 'a'; // エラー

  // cast、別のデータ型への変換
  print(int.parse('42') == 42); // String => int
  print(double.parse('42.3') == 42.3); // String => double
  print(42.31.toString() == '42.31'); // number => String
  misc.echo(h, 'h');
  misc.setCwd(r'C:\Windows');
  misc.dump(misc.getCwd());
  misc.dump(misc.pathFullName(r'aaa.txt'));
  misc.dump(misc.pathFileName(r'C:\Windows\xyz.dll'));
  misc.dump(misc.pathBaseName(r'C:\Windows\xyz.dll'));
  misc.dump(misc.pathDirectoryName(r'C:\Windows\xyz.dll'));
  misc.dump(await misc.directoryFiles(r'C:\Windows'));
  misc.dump(await misc.directoryDirs(r'C:\Windows'));
  misc.dump(await misc.directoryFiles(r'.'));
  misc.dump(await misc.directoryDirs(r'.'));
  misc.dump(
    await misc.readFileText(r'D:/home11/dart/git/dart-misc/pubspec.yaml'),
  );
  misc.dump(
    await misc.readFileLines(r'D:/home11/dart/git/dart-misc/pubspec.yaml'),
  );
  misc.dump(
    misc.textToLines('''
abc
def
xyz
'''),
  );
}
