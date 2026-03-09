import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

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
          child: screenSize.isDesktop || screenSize.isTablet
              ? Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: _ImageSection(screenSize: screenSize),
                    ),
                    const Gap(60),
                    Expanded(
                      flex: 5,
                      child: _ContentSection(screenSize: screenSize),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _ContentSection(screenSize: screenSize),
                    const Gap(40),
                    _ImageSection(screenSize: screenSize),
                  ],
                ),
        );
      },
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({required this.screenSize});

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
          aspectRatio: 1,
          child: AppAssets.images.logo.image(fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  _ContentSection({required this.screenSize});

  final ScreenSizes screenSize;

  final List<_Feature> features = [
    _Feature(
      title: 'Chất Lượng Đảm Bảo',
      description:
          'Sản phẩm chính hãng, có nguồn gốc rõ ràng, '
          'đạt tiêu chuẩn chất lượng',
    ),
    _Feature(
      title: 'Giá Cả Cạnh Tranh',
      description:
          'Giá tốt nhất thị trường, nhiều chương trình ưu đãi '
          'cho khách hàng thân thiết',
    ),
    _Feature(
      title: 'Giao Hàng Nhanh Chóng',
      description:
          'Đội ngũ giao hàng chuyên nghiệp, cam kết giao hàng đúng hẹn',
    ),
    _Feature(
      title: 'Tư Vấn Chuyên Nghiệp',
      description:
          'Đội ngũ kỹ thuật giàu kinh nghiệm, tư vấn tận tình cho nông dân',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: screenSize.isDesktop || screenSize.isTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'Tại Sao Chọn Chúng Tôi',
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
          textAlign: screenSize.isDesktop || screenSize.isTablet
              ? TextAlign.start
              : TextAlign.center,
        ),
        const Gap(24),
        Text(
          'Chúng tôi cam kết mang đến cho bà con nông dân những sản phẩm và '
          'dịch vụ tốt nhất, góp phần nâng cao hiệu quả sản xuất nông nghiệp.',
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
          textAlign: screenSize.isDesktop || screenSize.isTablet
              ? TextAlign.start
              : TextAlign.center,
        ),
        const Gap(40),
        ...features.map(
          (feature) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _FeatureItem(feature: feature, screenSize: screenSize),
          ),
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({required this.feature, required this.screenSize});

  final _Feature feature;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: AppColors.neutral100, size: 16),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feature.title,
                style: GoogleFonts.lora(
                  fontSize: 20,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral800,
                ),
              ),
              const Gap(8),
              Text(
                feature.description,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.6,
                  color: AppColors.neutral600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Feature {
  _Feature({required this.title, required this.description});

  final String title;
  final String description;
}
