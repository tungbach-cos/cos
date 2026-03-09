import 'package:flutter/material.dart';
import 'package:tungbach/resources/resources.dart';

/// Reusable social media icon button with consistent styling
class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    required this.icon,
    required this.onTap,
    super.key,
    this.iconColor = AppColors.primary,
    this.borderColor = AppColors.neutral400,
    this.iconSize = 20,
    this.padding = 10,
    this.borderRadius = 8,
  });

  final Widget icon;
  final VoidCallback onTap;
  final Color iconColor;
  final Color borderColor;
  final double iconSize;
  final double padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: IconTheme(
            data: IconThemeData(color: iconColor, size: iconSize),
            child: icon,
          ),
        ),
      ),
    );
  }
}
