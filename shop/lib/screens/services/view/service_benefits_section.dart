import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

/// Service benefits and guarantees section
class ServiceBenefitsSection extends StatelessWidget {
  const ServiceBenefitsSection({super.key});

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
              child: Column(
                children: [
                  _SectionHeader(screenSize: screenSize),
                  Gap(screenSize.isDesktop ? 60 : 40),
                  _BenefitsGrid(screenSize: screenSize),
                ],
              ),
            ),
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
          'Cam Kết Của Chúng Tôi',
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
          'Những cam kết đặc biệt dành cho khách hàng của chúng tôi',
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

class _BenefitsGrid extends StatelessWidget {
  _BenefitsGrid({required this.screenSize});

  final ScreenSizes screenSize;

  final List<_BenefitItem> benefits = [
    _BenefitItem(
      icon: Icons.verified_user,
      title: 'Sản Phẩm Chính Hãng',
      description: 'Cam kết 100% sản phẩm chính hãng, có nguồn gốc rõ ràng',
    ),
    _BenefitItem(
      icon: Icons.local_shipping,
      title: 'Giao Hàng Miễn Phí',
      description: 'Miễn phí vận chuyển cho đơn hàng từ 500.000đ trở lên',
    ),
    _BenefitItem(
      icon: Icons.support_agent,
      title: 'Hỗ Trợ 24/7',
      description: 'Đội ngũ tư vấn sẵn sàng hỗ trợ mọi lúc, mọi nơi',
    ),
    _BenefitItem(
      icon: Icons.price_check,
      title: 'Giá Tốt Nhất',
      description: 'Cam kết giá cạnh tranh nhất thị trường, hoàn tiền nếu có',
    ),
    _BenefitItem(
      icon: Icons.autorenew,
      title: 'Đổi Trả Dễ Dàng',
      description: 'Chính sách đổi trả linh hoạt trong vòng 7 ngày',
    ),
    _BenefitItem(
      icon: Icons.loyalty,
      title: 'Ưu Đãi Thành Viên',
      description: 'Chương trình tích điểm và ưu đãi cho khách hàng thân thiết',
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
          children: benefits
              .map(
                (benefit) => SizedBox(
                  width:
                      (constraints.maxWidth - (24 * (crossAxisCount - 1))) /
                      crossAxisCount,
                  child: _BenefitCard(benefit: benefit),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _BenefitCard extends StatelessWidget {
  const _BenefitCard({required this.benefit});

  final _BenefitItem benefit;

  @override
  Widget build(BuildContext context) {
    return HoverAnimatedCard(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.neutral100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.neutral400),
          boxShadow: [
            BoxShadow(
              color: AppColors.neutral400.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
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
              child: Icon(benefit.icon, color: AppColors.primary, size: 40),
            ),
            const Gap(24),
            Text(
              benefit.title,
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
              benefit.description,
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

class _BenefitItem {
  _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}
