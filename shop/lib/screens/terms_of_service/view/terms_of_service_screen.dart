import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/data/data.dart';
import 'package:tungbach/injection.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/terms_of_service/cubit/terms_of_service_cubit.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Terms of service screen displaying company's terms and conditions
class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  static String path = 'terms-of-service';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<TermsOfServiceCubit>();
        unawaited(cubit.loadTermsOfService());
        return cubit;
      },
      child: const CustomScaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [_TermsOfServiceContent(), Footer()],
          ),
        ),
      ),
    );
  }
}

/// Main content section for terms of service
class _TermsOfServiceContent extends StatelessWidget {
  const _TermsOfServiceContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsOfServiceCubit, TermsOfServiceState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (error) => Center(
            child: Text('${Labels.errorOccurred}: $error'),
          ),
          success: (terms, companyInfo) => _TermsOfServiceLoadedContent(
            terms: terms,
            companyInfo: companyInfo,
          ),
        );
      },
    );
  }
}

/// Content widget for loaded terms of service
class _TermsOfServiceLoadedContent extends StatelessWidget {
  const _TermsOfServiceLoadedContent({
    required this.terms,
    required this.companyInfo,
  });

  final TermsOfServiceModel terms;
  final CompanyInfoModel companyInfo;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1268),
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: screenSize.isDesktop
                  ? 80
                  : screenSize.isTablet
                  ? 64
                  : 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Page header
                Text(
                  terms.pageTitle,
                  style: GoogleFonts.lora(
                    fontSize: screenSize.isDesktop
                        ? 48
                        : screenSize.isTablet
                        ? 40
                        : 32,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutral800,
                  ),
                ),
                const Gap(16),
                Text(
                  '${Labels.lastUpdated} ${terms.lastUpdated.day}/${terms.lastUpdated.month}/${terms.lastUpdated.year}',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.neutral600,
                  ),
                ),
                const Gap(40),

                // Content sections
                ...terms.sections.expand(
                  (section) => [
                    if (section.title == '13. Liên Hệ')
                      _ContactTermsSection(
                        section: section,
                        companyInfo: companyInfo,
                      )
                    else
                      _TermsSection(
                        title: section.title,
                        content: section.content,
                      ),
                    const Gap(32),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Reusable section widget for terms content
class _TermsSection extends StatelessWidget {
  const _TermsSection({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lora(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral800,
          ),
        ),
        const Gap(12),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.8,
            color: AppColors.neutral700,
          ),
        ),
      ],
    );
  }
}

/// Contact section with clickable map link
class _ContactTermsSection extends StatelessWidget {
  const _ContactTermsSection({
    required this.section,
    required this.companyInfo,
  });

  final PolicySectionModel section;
  final CompanyInfoModel companyInfo;

  @override
  Widget build(BuildContext context) {
    final PolicySectionModel(:title, :content) = section;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lora(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral800,
          ),
        ),
        const Gap(12),
        RichText(
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.8,
              color: AppColors.neutral700,
            ),
            children: [
              TextSpan(
                text: '$content\n\n',
              ),
              TextSpan(
                text: '${companyInfo.companyName}\n',
              ),
              const TextSpan(text: '${Labels.email}: '),
              TextSpan(
                text: companyInfo.email,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.8,
                  color: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      launchUrlString('mailto:${companyInfo.email}'),
              ),
              const TextSpan(text: '\n${Labels.phone}: '),
              ...companyInfo.phoneNumbers.asMap().entries.expand(
                (entry) {
                  final MapEntry(key: index, value: phone) = entry;
                  return [
                    TextSpan(
                      text: phone,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        height: 1.8,
                        color: AppColors.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrlString('tel:$phone'),
                    ),
                    if (index < companyInfo.phoneNumbers.length - 1)
                      const TextSpan(text: ' / '),
                  ];
                },
              ),
              const TextSpan(text: '\n'),
              const TextSpan(text: '${Labels.address}: '),
              TextSpan(
                text: Labels.viewOnGoogleMaps,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.8,
                  color: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrlString(companyInfo.mapUrl),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
