#! /usr/bin/env bash
set -uvx
set -e
cd bin
dart compile exe my.dart.dart
cp -p my.dart.exe ~/cmd/
