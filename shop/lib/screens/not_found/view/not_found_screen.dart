import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/screens.dart';

/// 404 Not Found screen with decorative background and navigation options.
///
/// Displays a visually appealing error page when users navigate to
/// a non-existent route. Features:
/// - Large "404" error code display
/// - Descriptive error message
/// - Navigation button to return home
/// - Decorative leaf background elements
/// - Responsive design for all screen sizes
/// - Smooth fade-in animation
class NotFoundScreen extends StatefulWidget {
  const NotFoundScreen({super.key});

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // Start animation immediately - no need to await completion
    _animationController.forward().ignore();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: ResponsiveBuilder(
                builder: (context, screenSize, constraints) {
                  return Container(
                    constraints: BoxConstraints(
                      minHeight:
                          MediaQuery.sizeOf(context).height *
                          (screenSize.isMobile ? 88 : 101) /
                          100,
                    ),
                    color: AppColors.neutral800,
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(
                            constraints.maxWidth * -4 / 100,
                            constraints.minHeight * 27 / 100,
                          ),
                          child: Opacity(
                            opacity: 41 / 100,
                            child: AppAssets.icons.leaf1.svg(
                              width:
                                  MediaQuery.sizeOf(context).width * 35 / 100,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -20,
                          child: AppAssets.icons.leaf3.svg(
                            width: MediaQuery.sizeOf(context).width * 25 / 100,
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: -45,
                          child: Transform.rotate(
                            angle: -pi / 2.85,
                            child: Opacity(
                              opacity: 44 / 100,
                              child: AppAssets.icons.leaf2.svg(
                                width:
                                    MediaQuery.sizeOf(context).width * 40 / 100,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 100,
                              horizontal: screenSize.isMobile ? 16 : 24,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _build404Text(screenSize: screenSize),
                                Text(
                                  Labels.pageNotFound,
                                  style: GoogleFonts.lora(
                                    textStyle: AppTextStyles.h2.copyWith(
                                      color: AppColors.neutral100,
                                      fontSize: screenSize.isTablet
                                          ? 35
                                          : screenSize <= .phone
                                          ? 32
                                          : null,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const Gap(16),
                                Text(
                                  Labels.pageNotFoundDescription,
                                  style: GoogleFonts.lora(
                                    textStyle: AppTextStyles.s18h34.copyWith(
                                      color: AppColors.neutral100,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Gap(!screenSize.isMobile ? 40 : 32),
                                Button(
                                  text: Labels.backToHomePage,
                                  buttonSize: .normal,
                                  isDarkBackground: true,
                                  onTap: () =>
                                      context.go('/${HomeScreen.path}'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _build404Text({required ScreenSizes screenSize}) {
    final fontSize = switch (screenSize) {
      .tablet => 150,
      .phone => 136,
      .mobile => 100,
      _ => 180,
    }.toDouble();
    final fontHeight = switch (screenSize) {
      .tablet => 139,
      .phone => 136,
      .mobile => 100,
      _ => 160,
    };
    return Text(
      '404',
      style: GoogleFonts.lora(
        fontSize: fontSize,
        height: fontHeight / fontSize,
        color: AppColors.neutral100,
      ),
      textAlign: TextAlign.center,
    );
  }
}
