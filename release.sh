#! /usr/bin/env bash
set -uvx
set -e
pubspec-gen
#dart pub get
cd lib
dart compile exe my-dart.dart
cp -p my-dart.exe ~/cmd/
git add .
git-put
