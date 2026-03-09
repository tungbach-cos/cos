import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/shop/shop.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        final isDesktop = screenSize.isDesktop;
        final isTablet = screenSize.isTablet;

        return Container(
          constraints: const BoxConstraints(maxWidth: 1268),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: isDesktop
                ? 80
                : isTablet
                ? 60
                : 40,
          ),
          child: isDesktop || isTablet
              ? Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: _HeroContent(screenSize: screenSize),
                    ),
                    const Gap(60),
                    Expanded(
                      flex: 5,
                      child: _HeroImage(screenSize: screenSize),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _HeroContent(screenSize: screenSize),
                    const Gap(40),
                    _HeroImage(screenSize: screenSize),
                  ],
                ),
        );
      },
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: screenSize.isDesktop || screenSize.isTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          Labels.heroTitle,
          style: GoogleFonts.lora(
            fontSize: switch (screenSize) {
              .desktop => 56,
              .tablet => 48,
              .phone => 40,
              .mobile => 36,
            },
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral800,
          ),
          textAlign: screenSize.isDesktop || screenSize.isTablet
              ? TextAlign.start
              : TextAlign.center,
        ),
        const Gap(24),
        Text(
          Labels.heroSubtitle,
          style: GoogleFonts.inter(
            fontSize: switch (screenSize) {
              .desktop => 20,
              .tablet => 18,
              .phone => 16,
              .mobile => 16,
            },
            height: 1.6,
            color: AppColors.neutral600,
          ),
          textAlign: screenSize.isDesktop || screenSize.isTablet
              ? TextAlign.start
              : TextAlign.center,
        ),
        const Gap(40),
        Button(
          text: Labels.exploreNow,
          buttonType: .filled,
          buttonSize: .large,
          onTap: () => context.go('/${ShopScreen.path}'),
        ),
      ],
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.neutral300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: AppAssets.images.logo.image(fit: BoxFit.cover),
        ),
      ),
    );
  }
}
