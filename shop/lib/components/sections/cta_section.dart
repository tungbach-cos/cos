import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/screens.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          color: AppColors.primary,
          padding: EdgeInsets.symmetric(
            vertical: screenSize.isDesktop
                ? 100
                : screenSize.isTablet
                ? 80
                : 60,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Sẵn Sàng Hợp Tác Cùng Chúng Tôi?',
                    style: GoogleFonts.lora(
                      fontSize: switch (screenSize) {
                        .desktop => 48,
                        .tablet => 40,
                        .phone => 36,
                        .mobile => 32,
                      },
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutral100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(24),
                  Text(
                    'Liên hệ với chúng tôi ngay hôm nay để được tư vấn '
                    'và báo giá tốt nhất cho nhu cầu của bạn.',
                    style: GoogleFonts.inter(
                      fontSize: switch (screenSize) {
                        .desktop => 18,
                        .tablet => 16,
                        .phone => 16,
                        .mobile => 14,
                      },
                      height: 1.6,
                      color: AppColors.neutral100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(40),
                  Button(
                    text: 'Liên Hệ Ngay',
                    buttonType: .outlined,
                    buttonSize: .large,
                    onTap: () => context.go('/${ContactScreen.path}'),
                    customColors: const ButtonColors(
                      textColor: AppColors.neutral100,
                      borderColor: AppColors.neutral100,
                      hoverBgColor: AppColors.neutral100,
                      hoverTextColor: AppColors.primary,
                    ),
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
