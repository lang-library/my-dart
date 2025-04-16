#! /usr/bin/env -S my.dart run
import 'package:misc/misc.dart'as misc;

final $logger = misc.$globalLogger;

void main(List<String> args) async {
  $logger.t('Hello logger!');
  $logger.d(1000);
  $logger.i(true);
  $logger.w([1, 2, 3]);
  $logger.e({'key': 'key', 'value': 'value'});
  $logger.f(Exception('例外もいけます'));
  $logger.i(() => '関数もいけます');
}
