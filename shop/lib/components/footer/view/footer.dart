import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/common/common.dart';
import 'package:tungbach/components/footer/cubit/company_info_cubit.dart';
import 'package:tungbach/components/footer/models/footer_models.dart';
import 'package:tungbach/components/navigation/navigation_constants.dart';
import 'package:tungbach/components/responsive_builder/responsive_builder.dart';
import 'package:tungbach/data/data.dart';
import 'package:tungbach/injection.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/screens.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Footer component with company information
///
/// Provides its own CompanyInfoCubit internally for self-contained state
/// management. No need to provide the cubit externally - Footer manages
/// its own data.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<CompanyInfoCubit>();
        unawaited(cubit.loadCompanyInfo());
        return cubit;
      },
      child: const _FooterContent(),
    );
  }
}

class _FooterContent extends StatelessWidget {
  const _FooterContent();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          margin: EdgeInsets.only(
            top: screenSize.isDesktop
                ? 110
                : screenSize.isTablet
                ? 80
                : 64,
          ),
          decoration: const BoxDecoration(
            color: AppColors.neutral200,
            border: Border(top: BorderSide(color: AppColors.neutral400)),
          ),
          child: Column(
            children: [
              // Main footer content
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1268),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.isDesktop
                        ? 24
                        : screenSize.isTablet
                        ? 32
                        : 20,
                    vertical: screenSize.isDesktop
                        ? 80
                        : screenSize.isTablet
                        ? 56
                        : 40,
                  ),
                  child: _FooterSections(screenSize: screenSize),
                ),
              ),
              // Copyright section
              DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.neutral400)),
                ),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1268),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.isDesktop
                          ? 24
                          : screenSize.isTablet
                          ? 32
                          : 20,
                      vertical: screenSize.isDesktop ? 32 : 24,
                    ),
                    child: _CopyrightSection(screenSize: screenSize),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FooterSections extends StatelessWidget {
  const _FooterSections({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    if (screenSize.isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 4, child: _CompanySection(screenSize: screenSize)),
          const Gap(60),
          Expanded(flex: 2, child: _QuickLinksSection(screenSize: screenSize)),
          const Gap(60),
          Expanded(flex: 2, child: _ServicesSection(screenSize: screenSize)),
          const Gap(60),
          Expanded(flex: 3, child: _ContactInfoSection(screenSize: screenSize)),
        ],
      );
    } else if (screenSize.isTablet) {
      // Tablet layout: 2x2 grid for better balance
      return Column(
        children: [
          // Top row: Company info (full width)
          _CompanySection(screenSize: screenSize),
          const Gap(40),
          // Bottom row: 3 columns for navigation and contact
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _QuickLinksSection(screenSize: screenSize)),
              const Gap(32),
              Expanded(child: _ServicesSection(screenSize: screenSize)),
              const Gap(32),
              Expanded(child: _ContactInfoSection(screenSize: screenSize)),
            ],
          ),
        ],
      );
    } else {
      // Mobile layout with better organization
      return Column(
        children: [
          _CompanySection(screenSize: screenSize),
          const Gap(32),
          // Group navigation sections together
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _QuickLinksSection(screenSize: screenSize)),
              const Gap(24),
              Expanded(child: _ServicesSection(screenSize: screenSize)),
            ],
          ),
          const Gap(32),
          _ContactInfoSection(screenSize: screenSize),
        ],
      );
    }
  }
}

class _CopyrightSection extends StatelessWidget {
  const _CopyrightSection({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    if (screenSize.isDesktop || screenSize.isTablet) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© ${DateTime.now().year} Nông Sản Tùng Bách. All rights reserved.',
            style: GoogleFonts.inter(fontSize: 14, color: AppColors.neutral600),
          ),
          Row(
            children: [
              _CopyrightLink(
                text: 'Chính sách bảo mật',
                onTap: () => context.go('/${PrivacyPolicyScreen.path}'),
              ),
              const Gap(24),
              _CopyrightLink(
                text: 'Điều khoản sử dụng',
                onTap: () => context.go('/${TermsOfServiceScreen.path}'),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            '© ${DateTime.now().year} Nông Sản Tùng Bách.',
            style: GoogleFonts.inter(fontSize: 14, color: AppColors.neutral600),
            textAlign: TextAlign.center,
          ),
          const Gap(8),
          Text(
            'All rights reserved.',
            style: GoogleFonts.inter(fontSize: 14, color: AppColors.neutral600),
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _CopyrightLink(
                text: 'Chính sách bảo mật',
                onTap: () => context.go('/${PrivacyPolicyScreen.path}'),
              ),
              _CopyrightLink(
                text: 'Điều khoản sử dụng',
                onTap: () => context.go('/${TermsOfServiceScreen.path}'),
              ),
            ],
          ),
        ],
      );
    }
  }
}

/// Company information section for footer
class _CompanySection extends StatelessWidget {
  const _CompanySection({required this.screenSize});

  final ScreenSizes screenSize;

  double get _logoWidth => switch (screenSize) {
    .desktop => 240,
    .tablet => 220,
    .phone => 200,
    .mobile => 180,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.go('/${HomeScreen.path}'),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AppAssets.images.lanscapeLogo.image(width: _logoWidth),
          ),
        ),
        Gap(
          screenSize.isMobile
              ? 16
              : screenSize.isTablet
              ? 18
              : 20,
        ),
        Text(
          'Địa chỉ tin cậy cho bà con nông dân. Chuyên cung cấp phân bón, '
          'cám chất lượng cao và thu mua nông sản với giá tốt nhất.',
          style: GoogleFonts.inter(
            fontSize: screenSize.isMobile
                ? 14
                : screenSize.isTablet
                ? 15
                : 15,
            height: 1.6,
            color: AppColors.neutral600,
          ),
        ),
        Gap(
          screenSize.isMobile
              ? 20
              : screenSize.isTablet
              ? 22
              : 24,
        ),
        const _SocialMediaButtons(),
      ],
    );
  }
}

/// Social media buttons section
class _SocialMediaButtons extends StatelessWidget {
  const _SocialMediaButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialIconButton(
          icon: const Icon(
            IconData(0xE810, fontFamily: AppFonts.socialIconFont),
          ),
          onTap: () => launchUrlString(
            'https://www.facebook.com/profile.php?id=61556144112144',
          ),
        ),
      ],
    );
  }
}

/// Quick links navigation section
class _QuickLinksSection extends StatelessWidget {
  const _QuickLinksSection({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          text: 'Liên Kết Nhanh',
          fontSize: screenSize.isMobile
              ? 16
              : screenSize.isTablet
              ? 17
              : 18,
        ),
        Gap(
          screenSize.isMobile
              ? 16
              : screenSize.isTablet
              ? 18
              : 20,
        ),
        ...quickLinks.map(
          (link) => Padding(
            padding: EdgeInsets.only(
              bottom: screenSize.isMobile
                  ? 10
                  : screenSize.isTablet
                  ? 11
                  : 12,
            ),
            child: ClickableText(
              text: link.title,
              onTap: () => context.go(link.route),
              fontSize: screenSize.isMobile
                  ? 14
                  : screenSize.isTablet
                  ? 14.5
                  : 15,
            ),
          ),
        ),
      ],
    );
  }
}

/// Services list section
class _ServicesSection extends StatelessWidget {
  const _ServicesSection({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          text: 'Dịch Vụ',
          fontSize: screenSize.isMobile
              ? 16
              : screenSize.isTablet
              ? 17
              : 18,
        ),
        Gap(
          screenSize.isMobile
              ? 16
              : screenSize.isTablet
              ? 18
              : 20,
        ),
        ...serviceLinks.map(
          (service) => Padding(
            padding: EdgeInsets.only(
              bottom: screenSize.isMobile
                  ? 10
                  : screenSize.isTablet
                  ? 11
                  : 12,
            ),
            child: ClickableText(
              text: service.title,
              onTap: () => context.go(service.route),
              fontSize: screenSize.isMobile
                  ? 14
                  : screenSize.isTablet
                  ? 14.5
                  : 15,
            ),
          ),
        ),
      ],
    );
  }
}

/// Contact information section
class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyInfoCubit, CompanyInfoState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(text: 'Thông Tin Liên Hệ'),
              Gap(20),
              Text('Đang tải...'),
            ],
          ),
          loading: () => const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(text: 'Thông Tin Liên Hệ'),
              Gap(20),
              Text('Đang tải...'),
            ],
          ),
          success: (info) {
            final contactItems = [
              const FooterContactModel(
                icon: Icons.location_on_outlined,
                text: 'Xem trên bản đồ',
              ),
              ...info.phoneNumbers.map(
                (phone) =>
                    FooterContactModel(icon: Icons.phone_outlined, text: phone),
              ),
              FooterContactModel(icon: Icons.email_outlined, text: info.email),
              FooterContactModel(
                icon: Icons.access_time_outlined,
                text: info.workingHours,
              ),
            ];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(
                  text: 'Thông Tin Liên Hệ',
                  fontSize: screenSize.isMobile
                      ? 16
                      : screenSize.isTablet
                      ? 17
                      : 18,
                ),
                Gap(
                  screenSize.isMobile
                      ? 16
                      : screenSize.isTablet
                      ? 18
                      : 20,
                ),
                ...contactItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == contactItems.length - 1;

                  final isClickable = _isClickableItem(item);
                  final onTap = _getItemAction(item, info);

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: isLast
                          ? 0
                          : (screenSize.isMobile
                                ? 12
                                : screenSize.isTablet
                                ? 14
                                : 16),
                    ),
                    child: isClickable && onTap != null
                        ? MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: onTap,
                              child: IconTextItem(
                                icon: item.icon,
                                text: item.text,
                                textColor: AppColors.primary,
                                fontSize: screenSize.isMobile
                                    ? 14
                                    : screenSize.isTablet
                                    ? 14.5
                                    : 15,
                              ),
                            ),
                          )
                        : IconTextItem(
                            icon: item.icon,
                            text: item.text,
                            fontSize: screenSize.isMobile
                                ? 14
                                : screenSize.isTablet
                                ? 14.5
                                : 15,
                          ),
                  );
                }),
              ],
            );
          },
          failure: (error) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(text: 'Thông Tin Liên Hệ'),
              const Gap(20),
              Text('Lỗi: $error'),
            ],
          ),
        );
      },
    );
  }

  bool _isClickableItem(FooterContactModel item) {
    return item.icon == Icons.location_on_outlined ||
        item.icon == Icons.phone_outlined ||
        item.icon == Icons.email_outlined;
  }

  VoidCallback? _getItemAction(FooterContactModel item, CompanyInfoModel info) {
    if (item.icon == Icons.location_on_outlined) {
      return () => launchUrlString(info.mapUrl);
    } else if (item.icon == Icons.phone_outlined) {
      final phone = item.text.replaceAll(RegExp(r'[^\d]'), '');
      return () => launchUrlString('tel:$phone');
    } else if (item.icon == Icons.email_outlined) {
      return () => launchUrlString('mailto:${item.text}');
    }
    return null;
  }
}

/// Copyright footer link widget
class _CopyrightLink extends StatelessWidget {
  const _CopyrightLink({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClickableText(text: text, onTap: onTap, fontSize: 14);
  }
}
