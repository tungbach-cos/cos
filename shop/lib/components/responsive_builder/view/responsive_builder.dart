import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tungbach/components/responsive_builder/model/model.dart';

typedef WidgetBuilder =
    Widget Function(
      BuildContext context,
      ScreenSizes screenSize,
      BoxConstraints constraints,
    );

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = switch (ResponsiveBreakpoints.of(context)) {
          ResponsiveBreakpointsData(isDesktop: true) => ScreenSizes.desktop,
          ResponsiveBreakpointsData(isTablet: true) => ScreenSizes.tablet,
          ResponsiveBreakpointsData(isPhone: true) => ScreenSizes.phone,
          _ => ScreenSizes.mobile,
        };
        return builder(context, screenSize, constraints);
      },
    );
  }
}
