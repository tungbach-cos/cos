import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String path = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(seconds: 3));
      if (mounted) {
        context.pushReplacement('/${HomeScreen.path}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppAssets.images.logo.image();
  }
}
