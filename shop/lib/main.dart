import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/application.dart';
import 'package:tungbach/injection.dart';

Future<void> main() async {
  usePathUrlStrategy();
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize dependency injection
    await configureDependencies();

    GoogleFonts.config.allowRuntimeFetching = false;
    runApp(const Application());
  }, (error, stack) {});
}
