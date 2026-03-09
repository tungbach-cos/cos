import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

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
              _ServicesGrid(screenSize: screenSize),
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
          'Dịch Vụ Của Chúng Tôi',
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
          'Cung cấp giải pháp toàn diện cho nông nghiệp hiện đại',
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

class _ServicesGrid extends StatelessWidget {
  _ServicesGrid({required this.screenSize});

  final ScreenSizes screenSize;

  final List<_ServiceItem> services = [
    _ServiceItem(
      title: 'Phân Bón Chất Lượng',
      description:
          'Cung cấp các loại phân bón hữu cơ và vô cơ chất lượng cao, '
          'giúp cây trồng phát triển khỏe mạnh và cho năng suất cao.',
      iconAsset: AppAssets.icons.leaf1,
    ),
    _ServiceItem(
      title: 'Cám & Thức Ăn Chăn Nuôi',
      description:
          'Thức ăn chăn nuôi đạt chuẩn, dinh dưỡng cân đối, '
          'giúp vật nuôi tăng trưởng nhanh và khỏe mạnh.',
      iconAsset: AppAssets.icons.leaf2,
    ),
    _ServiceItem(
      title: 'Thu Mua Nông Sản',
      description:
          'Thu mua nông sản với giá cạnh tranh, thanh toán nhanh chóng, '
          'hỗ trợ bà con nông dân tiêu thụ sản phẩm.',
      iconAsset: AppAssets.icons.leaf3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = screenSize.isDesktop
            ? 3
            : screenSize.isTablet
            ? 2
            : 1;

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: services
              .map(
                (service) => SizedBox(
                  width:
                      (constraints.maxWidth - (24 * (crossAxisCount - 1))) /
                      crossAxisCount,
                  child: _ServiceCard(service: service, screenSize: screenSize),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service, required this.screenSize});

  final _ServiceItem service;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.neutral200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutral400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              service.iconAsset.path,
              width: 40,
              height: 40,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Gap(24),
          Text(
            service.title,
            style: GoogleFonts.lora(
              fontSize: 24,
              height: 1.3,
              fontWeight: FontWeight.bold,
              color: AppColors.neutral800,
            ),
          ),
          const Gap(12),
          Text(
            service.description,
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.6,
              color: AppColors.neutral600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceItem {
  _ServiceItem({
    required this.title,
    required this.description,
    required this.iconAsset,
  });

  final String title;
  final String description;
  final SvgGenImage iconAsset;
}
