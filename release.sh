#! /usr/bin/env bash
set -uvx
set -e
dart pub get
cd app
dart compile exe my-dart.dart
cp -p my-dart.exe ~/cmd/
git add .
git-put
