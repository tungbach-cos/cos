import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:tungbach/core/core.dart' show configureDependencies;

Future<void> init(InternetAddress address, int port) async {
  configureDependencies();
}

Future<HttpServer> run(Handler handler, InternetAddress address, int port) {
  return serve(handler, address, port);
}
