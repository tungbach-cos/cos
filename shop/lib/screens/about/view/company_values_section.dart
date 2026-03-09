import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

/// Company core values section
class CompanyValuesSection extends StatelessWidget {
  const CompanyValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 1268),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: screenSize.isDesktop
                ? 100
                : screenSize.isTablet
                ? 80
                : 60,
          ),
          child: Column(
            children: [
              _SectionHeader(screenSize: screenSize),
              Gap(screenSize.isDesktop ? 60 : 40),
              _ValuesGrid(screenSize: screenSize),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Giá Trị Cốt Lõi',
          style: GoogleFonts.lora(
            fontSize: switch (screenSize) {
              .desktop => 48,
              .tablet => 40,
              .phone => 36,
              .mobile => 32,
            },
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral800,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(16),
        Text(
          'Những giá trị định hình cách chúng tôi làm việc '
          'và phục vụ khách hàng',
          style: GoogleFonts.inter(
            fontSize: switch (screenSize) {
              .desktop => 18,
              .tablet => 16,
              .phone => 16,
              .mobile => 14,
            },
            height: 1.6,
            color: AppColors.neutral600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ValuesGrid extends StatelessWidget {
  _ValuesGrid({required this.screenSize});

  final ScreenSizes screenSize;

  final List<_ValueItem> values = [
    _ValueItem(
      icon: Icons.verified_outlined,
      title: 'Chất Lượng',
      description:
          'Cam kết cung cấp sản phẩm chính hãng, '
          'đạt tiêu chuẩn chất lượng cao nhất',
    ),
    _ValueItem(
      icon: Icons.favorite_outline,
      title: 'Tận Tâm',
      description:
          'Phục vụ khách hàng với sự tận tâm và nhiệt tình '
          'trong mọi tình huống',
    ),
    _ValueItem(
      icon: Icons.handshake_outlined,
      title: 'Tin Cậy',
      description:
          'Xây dựng mối quan hệ lâu dài dựa trên sự tin tưởng và minh bạch',
    ),
    _ValueItem(
      icon: Icons.eco_outlined,
      title: 'Bền Vững',
      description:
          'Hướng đến phát triển nông nghiệp xanh, thân thiện với môi trường',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = screenSize.isDesktop
            ? 4
            : screenSize.isTablet
            ? 2
            : 1;

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: values
              .map(
                (value) => SizedBox(
                  width:
                      (constraints.maxWidth - (24 * (crossAxisCount - 1))) /
                      crossAxisCount,
                  child: _ValueCard(value: value, screenSize: screenSize),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard({required this.value, required this.screenSize});

  final _ValueItem value;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return HoverAnimatedCard(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.neutral100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.neutral400),
          boxShadow: const [
            BoxShadow(
              color: AppColors.neutral400,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(value.icon, color: AppColors.primary, size: 40),
            ),
            const Gap(24),
            Text(
              value.title,
              style: GoogleFonts.lora(
                fontSize: 24,
                height: 1.3,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral800,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            Text(
              value.description,
              style: GoogleFonts.inter(
                fontSize: 16,
                height: 1.6,
                color: AppColors.neutral600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ValueItem {
  _ValueItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}
