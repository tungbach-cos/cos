import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

/// Detailed services information section
class ServiceDetailsSection extends StatelessWidget {
  const ServiceDetailsSection({super.key});

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
              _ServiceCard(
                screenSize: screenSize,
                icon: AppAssets.icons.leaf1,
                title: 'Phân Bón Chất Lượng Cao',
                description:
                    'Cung cấp đầy đủ các loại phân bón phục vụ nhu cầu '
                    'canh tác của bà con nông dân',
                features: const [
                  'Phân bón NPK đa dạng công thức',
                  'Phân hữu cơ vi sinh cao cấp',
                  'Phân lá chuyên dụng cho từng loại cây',
                  'Phân bón lót và bón thúc chất lượng',
                  'Tư vấn miễn phí về liều lượng và cách sử dụng',
                ],
                isReversed: false,
              ),
              Gap(screenSize.isDesktop ? 80 : 60),
              _ServiceCard(
                screenSize: screenSize,
                icon: AppAssets.icons.leaf2,
                title: 'Cám & Thức Ăn Chăn Nuôi',
                description:
                    'Thức ăn chăn nuôi chất lượng cao, đảm bảo dinh dưỡng '
                    'và sức khỏe cho đàn vật nuôi',
                features: const [
                  'Cám gạo nguyên chất không tạp chất',
                  'Thức ăn công nghiệp cho lợn, gà, vịt',
                  'Thức ăn bổ sung vitamin và khoáng chất',
                  'Cám hỗn hợp dinh dưỡng cân đối',
                  'Tư vấn chế độ dinh dưỡng phù hợp',
                ],
                isReversed: true,
              ),
              Gap(screenSize.isDesktop ? 80 : 60),
              _ServiceCard(
                screenSize: screenSize,
                icon: AppAssets.icons.leaf3,
                title: 'Thu Mua Nông Sản',
                description:
                    'Dịch vụ thu mua nông sản uy tín, giá cả hợp lý, '
                    'thanh toán nhanh chóng',
                features: const [
                  'Thu mua lúa gạo với giá cạnh tranh',
                  'Thu mua nông sản theo mùa vụ',
                  'Thanh toán ngay, không chậm trễ',
                  'Vận chuyển miễn phí với số lượng lớn',
                  'Hợp đồng dài hạn cho đối tác ổn định',
                ],
                isReversed: false,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.screenSize,
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
    required this.isReversed,
  });

  final ScreenSizes screenSize;
  final SvgGenImage icon;
  final String title;
  final String description;
  final List<String> features;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    final imageSection = _ImageSection(screenSize: screenSize, icon: icon);

    final contentSection = _ContentSection(
      screenSize: screenSize,
      title: title,
      description: description,
      features: features,
    );

    if (screenSize.isDesktop || screenSize.isTablet) {
      return Row(
        children: isReversed
            ? [
                Expanded(flex: 5, child: contentSection),
                const Gap(60),
                Expanded(flex: 5, child: imageSection),
              ]
            : [
                Expanded(flex: 5, child: imageSection),
                const Gap(60),
                Expanded(flex: 5, child: contentSection),
              ],
      );
    } else {
      return Column(children: [contentSection, const Gap(40), imageSection]);
    }
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({required this.screenSize, required this.icon});

  final ScreenSizes screenSize;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenSize.isDesktop ? 80 : 60),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.asset(
        icon.path,
        width: screenSize.isDesktop ? 200 : 150,
        height: screenSize.isDesktop ? 200 : 150,
        colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  const _ContentSection({
    required this.screenSize,
    required this.title,
    required this.description,
    required this.features,
  });

  final ScreenSizes screenSize;
  final String title;
  final String description;
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: screenSize.isDesktop || screenSize.isTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.lora(
            fontSize: switch (screenSize) {
              .desktop => 40,
              .tablet => 36,
              .phone => 32,
              .mobile => 28,
            },
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral800,
          ),
          textAlign: screenSize.isDesktop || screenSize.isTablet
              ? TextAlign.start
              : TextAlign.center,
        ),
        const Gap(20),
        Text(
          description,
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
        const Gap(32),
        ...features.map(
          (feature) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.neutral100,
                    size: 16,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Text(
                    feature,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      height: 1.6,
                      color: AppColors.neutral700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
