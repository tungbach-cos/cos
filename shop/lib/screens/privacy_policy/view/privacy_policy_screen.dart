import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/injection.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/privacy_policy/cubit/privacy_policy_cubit.dart';

/// Privacy policy screen displaying company's privacy policy
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static String path = 'privacy-policy';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<PrivacyPolicyCubit>();
        unawaited(cubit.loadPrivacyPolicy());
        return cubit;
      },
      child: const CustomScaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [_PrivacyPolicyContent(), Footer()],
          ),
        ),
      ),
    );
  }
}

/// Main content section for privacy policy
class _PrivacyPolicyContent extends StatelessWidget {
  const _PrivacyPolicyContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Initializing...')),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const Gap(16),
                Text('Error: $error'),
              ],
            ),
          ),
          success: (policy, companyInfo) => ResponsiveBuilder(
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
                        policy.pageTitle,
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
                        'Cập nhật lần cuối: ${policy.lastUpdated.day}/${policy.lastUpdated.month}/${policy.lastUpdated.year}',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.neutral600,
                        ),
                      ),
                      const Gap(40),

                      // Dynamic sections from repository
                      ...policy.sections.map(
                        (section) => Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: _PolicySection(
                            title: section.title,
                            content: section.content,
                          ),
                        ),
                      ),

                      // Contact section with company info
                      _PolicySection(
                        title: '9. Liên Hệ',
                        content:
                            'Nếu bạn có bất kỳ câu hỏi nào về '
                            'chính sách bảo mật này, vui lòng liên hệ:'
                            '\n\n'
                            '${companyInfo.companyName}\n'
                            'Email: ${companyInfo.email}\n'
                            'Điện thoại: '
                            '${companyInfo.phoneNumbers.join(' / ')}',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// Reusable section widget for policy content
class _PolicySection extends StatelessWidget {
  const _PolicySection({required this.title, required this.content});

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
