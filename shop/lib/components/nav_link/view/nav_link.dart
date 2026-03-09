import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/resources/resources.dart';

class NavLink extends StatelessWidget {
  const NavLink({required this.label, required this.onTap, super.key});

  final String label;
  final void Function(BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(context),
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.inter(textStyle: AppTextStyles.s18h34),
        ),
        overlayColor: WidgetStateColor.transparent,
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if (states.firstOrNull == WidgetState.hovered) {
            return AppColors.primary;
          }
          return AppColors.neutral800;
        }),
      ),
      child: Text(label),
    );
  }
}
