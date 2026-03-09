import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/resources/resources.dart';

/// Reusable clickable text widget with hover effects
class ClickableText extends StatelessWidget {
  const ClickableText({
    required this.text,
    required this.onTap,
    super.key,
    this.fontSize = 15,
    this.color = AppColors.neutral600,
    this.hoverColor = AppColors.primary,
    this.fontWeight,
  });

  final String text;
  final VoidCallback onTap;
  final double fontSize;
  final Color color;
  final Color hoverColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            height: 1.5,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
