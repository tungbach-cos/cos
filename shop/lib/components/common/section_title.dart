import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/resources/resources.dart';

/// Reusable section title widget with consistent styling
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.text,
    super.key,
    this.fontSize = 18,
    this.color = AppColors.neutral800,
    this.fontWeight = FontWeight.bold,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lora(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
