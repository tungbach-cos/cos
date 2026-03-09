import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tungbach/components/button/button.dart';
import 'package:tungbach/components/nav_link/nav_link.dart';
import 'package:tungbach/components/navigation/navigation_constants.dart';
import 'package:tungbach/components/responsive_builder/responsive_builder.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/screens.dart';

/// Responsive header component with navigation and mobile menu.
///
/// Features:
/// - Desktop: Full navigation with logo and contact button
/// - Mobile: Logo with hamburger menu that opens Scaffold drawer
/// - Responsive logo sizing
/// - Touch-friendly mobile interactions
class Header extends StatelessWidget {
  const Header({
    super.key,
    this.onMenuTap,
  });

  /// Callback to open the drawer when menu button is tapped.
  ///
  /// Typically: `() => Scaffold.of(context).openDrawer()`
  final VoidCallback? onMenuTap;

  /// Builds the mobile navigation drawer.
  ///
  /// Use this with Scaffold.drawer:
  /// ```dart
  /// Scaffold(
  ///   drawer: Header.buildDrawer(context),
  ///   ...
  /// )
  /// ```
  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.neutral100,
      child: Column(
        children: [
          // Drawer header with logo
          DrawerHeader(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.neutral400),
              ),
            ),
            child: Row(
              children: [
                AppAssets.images.lanscapeLogo.image(
                  height: 28,
                  width: 120,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.neutral800,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Navigation links
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) {
                final link = mainNavigationLinks[index];
                return _buildDrawerItem(
                  title: link.title,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.go(link.route);
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: AppColors.neutral300,
              ),
              itemCount: mainNavigationLinks.length,
            ),
          ),

          // Contact button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Button(
              text: 'Liên hệ',
              buttonType: .filled,
              onTap: () {
                Navigator.of(context).pop();
                context.go('/${ContactScreen.path}');
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds individual drawer navigation items.
  static Widget _buildDrawerItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.neutral800,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.neutral400)),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenSize.isDesktop ? 35 : 25,
                horizontal: screenSize.isMobile ? 16 : 24,
              ),
              constraints: const BoxConstraints(maxWidth: 1268),
              child: Row(
                children: [
                  // Logo
                  _buildLogo(context, screenSize),

                  // Desktop navigation
                  if (screenSize.isDesktop) ...[
                    const Gap(40),
                    _buildDesktopNavigation(context),
                  ],

                  const Spacer(),

                  // Mobile menu button or contact button
                  if (screenSize.isMobile)
                    _buildMobileMenuButton(context)
                  else if (screenSize > .phone)
                    _buildContactButton(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Builds the responsive logo with appropriate sizing.
  Widget _buildLogo(BuildContext context, ScreenSizes screenSize) {
    final logoHeight = screenSize.isMobile ? 28.0 : 36.0;
    final logoConstraints = screenSize.isMobile
        ? const BoxConstraints(minWidth: 120, maxWidth: 140)
        : const BoxConstraints(minWidth: 180, maxWidth: 200);

    return ConstrainedBox(
      constraints: logoConstraints,
      child: GestureDetector(
        onTap: () => context.go('/${HomeScreen.path}'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AppAssets.images.lanscapeLogo.image(
            height: logoHeight,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  /// Builds desktop navigation with horizontal links.
  Widget _buildDesktopNavigation(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final link = mainNavigationLinks[index];
          return NavLink(
            label: link.title,
            onTap: (ctx) => ctx.go(link.route),
          );
        },
        separatorBuilder: (context, index) => const Gap(24),
        itemCount: mainNavigationLinks.length,
      ),
    );
  }

  /// Builds the contact button for desktop/tablet.
  Widget _buildContactButton(BuildContext context) {
    return Button(
      text: 'Liên hệ',
      buttonType: .filled,
      onTap: () => context.go('/${ContactScreen.path}'),
    );
  }

  /// Builds the hamburger menu button for mobile.
  Widget _buildMobileMenuButton(BuildContext context) {
    return IconButton(
      onPressed: onMenuTap ?? () => Scaffold.of(context).openEndDrawer(),
      icon: const Icon(
        Icons.menu,
        color: AppColors.neutral800,
        size: 24,
      ),
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(),
    );
  }
}
