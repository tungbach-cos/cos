import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

/// Hero section for About Us page
class AboutHeroSection extends StatelessWidget {
  const AboutHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          color: AppColors.primary,
          padding: EdgeInsets.symmetric(
            vertical: screenSize.isDesktop
                ? 120
                : screenSize.isTablet
                ? 100
                : 80,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Về Chúng Tôi',
                    style: GoogleFonts.lora(
                      fontSize: switch (screenSize) {
                        .desktop => 56,
                        .tablet => 48,
                        .phone => 40,
                        .mobile => 36,
                      },
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutral100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(16),
                  Text(
                    'Đối tác tin cậy của bà con nông dân Việt Nam',
                    style: GoogleFonts.inter(
                      fontSize: switch (screenSize) {
                        .desktop => 20,
                        .tablet => 18,
                        .phone => 16,
                        .mobile => 16,
                      },
                      height: 1.6,
                      color: AppColors.neutral100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
