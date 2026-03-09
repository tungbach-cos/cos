import 'package:flutter/material.dart';

final class AppTextStyles {
  AppTextStyles._();

  static final TextStyle s16h30 = _calculatedTextStyle(
    fontSize: 18,
    height: 34,
  );
  static final TextStyle s18h34 = _calculatedTextStyle(
    fontSize: 18,
    height: 34,
  );
  static final TextStyle h2 = _calculatedTextStyle(fontSize: 38, height: 50);

  static TextStyle _calculatedTextStyle({
    required double fontSize,
    required double height,
  }) => TextStyle(
    fontSize: fontSize,
    height: height / fontSize,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
