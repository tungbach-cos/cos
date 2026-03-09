import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/resources/resources.dart';

/// Reusable icon with text widget for displaying information
class IconTextItem extends StatelessWidget {
  const IconTextItem({
    required this.icon,
    required this.text,
    super.key,
    this.iconSize = 18,
    this.iconColor = AppColors.primary,
    this.textColor = AppColors.neutral600,
    this.fontSize = 15,
    this.gap = 12,
  });

  final IconData icon;
  final String text;
  final double iconSize;
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: iconSize, color: iconColor),
        Gap(gap),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: fontSize,
              height: 1.5,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
