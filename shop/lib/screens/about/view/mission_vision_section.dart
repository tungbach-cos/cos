import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

/// Mission and vision section
class MissionVisionSection extends StatelessWidget {
  const MissionVisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          color: AppColors.neutral200,
          padding: EdgeInsets.symmetric(
            vertical: screenSize.isDesktop
                ? 100
                : screenSize.isTablet
                ? 80
                : 60,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1268),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: screenSize.isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _MissionCard(screenSize: screenSize)),
                        const Gap(40),
                        Expanded(child: _VisionCard(screenSize: screenSize)),
                      ],
                    )
                  : Column(
                      children: [
                        _MissionCard(screenSize: screenSize),
                        const Gap(32),
                        _VisionCard(screenSize: screenSize),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _MissionCard extends StatelessWidget {
  const _MissionCard({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(16),
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
            child: const Icon(
              Icons.flag_outlined,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          const Gap(24),
          const SectionTitle(text: 'Sứ Mệnh', fontSize: 28),
          const Gap(16),
          Text(
            'Cung cấp sản phẩm và dịch vụ chất lượng cao, giúp nông dân '
            'tăng năng suất, giảm chi phí và phát triển bền vững. '
            'Chúng tôi cam kết đồng hành cùng bà con nông dân trong mọi '
            'giai đoạn sản xuất.',
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

class _VisionCard extends StatelessWidget {
  const _VisionCard({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(16),
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
            child: const Icon(
              Icons.visibility_outlined,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          const Gap(24),
          const SectionTitle(text: 'Tầm Nhìn', fontSize: 28),
          const Gap(16),
          Text(
            'Trở thành nhà cung cấp hàng đầu về vật tư nông nghiệp '
            'tại Việt Nam, được tin tưởng bởi hàng triệu nông dân. '
            'Chúng tôi hướng đến việc xây dựng một cộng đồng nông nghiệp '
            'phát triển, hiện đại và bền vững.',
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
