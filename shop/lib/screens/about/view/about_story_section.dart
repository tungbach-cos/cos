import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

/// Company story and introduction section
class AboutStorySection extends StatelessWidget {
  const AboutStorySection({super.key});

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
          aspectRatio: 4 / 3,
          child: AppAssets.images.logo.image(fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  const _ContentSection({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: screenSize.isDesktop || screenSize.isTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'Câu Chuyện Của Chúng Tôi',
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
          'Cửa Hàng Nông sản Tùng Bách được thành lập với sứ mệnh '
          'mang đến cho bà con nông dân những sản phẩm chất lượng cao '
          'và dịch vụ tốt nhất. Chúng tôi hiểu rằng nông nghiệp là '
          'nền tảng của đất nước, và việc hỗ trợ người nông dân chính '
          'là đóng góp cho sự phát triển bền vững của cộng đồng.',
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
        const Gap(20),
        Text(
          'Với nhiều năm kinh nghiệm trong lĩnh vực cung cấp vật tư '
          'nông nghiệp, chúng tôi tự hào là đối tác đáng tin cậy của '
          'hàng ngàn hộ nông dân trên khắp cả nước. Từ phân bón, cám '
          'thức ăn chăn nuôi đến dịch vụ thu mua nông sản, chúng tôi '
          'luôn đặt lợi ích của khách hàng lên hàng đầu.',
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
      ],
    );
  }
}
